report 50609 "Posted Purchase Invoice Update"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    ProcessingOnly = true;
    Permissions = tabledata "Purch. Inv. Header" = RM;

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "Posting Date", "No.";
            //DataItemTableView = where("Posting Date" = filter(20230101 .. 20230521));

            column(Document_No_; "No.")
            {

            }
            trigger OnAfterGetRecord()
            begin
                if ("Invoice Amount(LCY)" = 0) and ("Currency Factor" <> 0) then begin
                    CalcFields(Amount);
                    "Invoice Amount(LCY)" += Amount / "Currency Factor";
                    Modify();
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