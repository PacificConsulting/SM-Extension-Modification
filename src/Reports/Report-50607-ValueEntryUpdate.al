report 50607 "Value Entry Update"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    ProcessingOnly = true;
    Permissions = tabledata "Value Entry" = RM, tabledata "Sales Invoice Header" = RM, tabledata "Purch. Inv. Header" = RM;

    dataset
    {
        dataitem("Value Entry"; "Value Entry")
        {
            RequestFilterFields = "Posting Date", "Document No.";
            //DataItemTableView = where("Posting Date" = filter(20230101 .. 20230521));

            column(Document_No_; "Document No.")
            {

            }
            trigger OnAfterGetRecord()
            begin
                if "Value Entry"."Document Type" = "Value Entry"."Document Type"::"Sales Invoice" then begin
                    SIH.Reset();
                    SIH.SetRange("No.", "Value Entry"."Document No.");
                    SIH.SetRange("Posting Date", 20220101D, 20230521D);
                    if SIH.FindFirst() then begin
                        "Value Entry"."Currency Code" := SIH."Currency Code";
                        "Value Entry"."VAT Registration No." := SIH."VAT Registration No.";
                        "Value Entry"."VAT Transaction Type" := SIH."REDM Transaction Type";
                        "Value Entry"."Own Vat Account No." := SIH."REDM OWN VAT Account No.";

                        if SIH."Invoice Amount(LCY)" = 0 then begin
                            SIH.CalcFields(Amount);
                            SIH."Invoice Amount(LCY)" += SIH.Amount / SIH."Currency Factor";
                            SIH.Modify();
                        end;
                    end;

                    SIL.Reset();
                    SIL.SetRange("Document No.", "Value Entry"."Document No.");
                    SIL.SetRange("No.", "Value Entry"."Item No.");
                    if SIL.FindFirst() then begin
                        "Value Entry"."Tarrif code" := SIL."REDM Tariff Code";
                    end;

                    ILE.Reset();
                    ILE.SetRange("Entry No.", "Value Entry"."Item Ledger Entry No.");
                    if ILE.FindFirst() then begin
                        "Value Entry"."Number Of Units" := ILE."No.Of Units";
                    end;
                    "Value Entry".Modify();
                end;

                if "Value Entry"."Document Type" = "Value Entry"."Document Type"::"Purchase Invoice" then begin
                    PIH.Reset();
                    PIH.SetRange("No.", "Value Entry"."Document No.");
                    PIH.SetRange("Posting Date", 20220101D, 20230521D);
                    if PIH.FindFirst() then begin
                        "Value Entry"."Currency Code" := PIH."Currency Code";
                        "Value Entry"."VAT Registration No." := PIH."VAT Registration No.";
                        "Value Entry"."VAT Transaction Type" := PIH."REDM Transaction Type";
                        "Value Entry"."Own Vat Account No." := PIH."REDM OWN VAT Account No.";

                        if PIH."Invoice Amount(LCY)" = 0 then begin
                            PIH.CalcFields(Amount);
                            PIH."Invoice Amount(LCY)" += PIH.Amount / PIH."Currency Factor";
                            PIH.Modify();
                        end;
                    end;

                    PIL.Reset();
                    PIL.SetRange("Document No.", "Value Entry"."Document No.");
                    PIL.SetRange("No.", "Value Entry"."Item No.");
                    if SIL.FindFirst() then begin
                        "Value Entry"."Tarrif code" := PIL."REDM Tariff Code";
                    end;

                    ILE.Reset();
                    ILE.SetRange("Entry No.", "Value Entry"."Item Ledger Entry No.");
                    if ILE.FindFirst() then begin
                        "Value Entry"."Number Of Units" := ILE."No.Of Units";
                    end;
                    "Value Entry".Modify();
                end;
            end;

            trigger OnPreDataItem()
            begin
                SetRange("Posting Date", 20220101D, 20230521D);
            end;

            trigger OnPostDataItem()
            begin
                Message('done');
            end;
        }
    }


    var
        myInt: Integer;
        PIH: Record "Purch. Inv. Header";
        PIL: Record "Purch. Inv. Line";
        SIH: Record "Sales Invoice Header";
        SIL: Record "Sales Invoice Line";
        ILE: Record "Item Ledger Entry";
}