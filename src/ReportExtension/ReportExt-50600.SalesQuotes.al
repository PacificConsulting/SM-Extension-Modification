reportextension 50600 "Sales Quotes_EXT" extends "Standard Sales - Quote"
{
    // WordLayout = './StandardSalesQuote.docx';
    dataset
    {
        // Add changes to dataitems and columns here
        add(Header)
        {
            column(RecCountryname; RecCountry.Name)
            {

            }
            column(CompPhoneNo; ComInformation."Phone No.")
            {

            }
            column(REDM_Country_of_Origin; RedmCountry.Name)
            {
            }
            column(Quality_And_Weight; "Quality And Weight")
            {

            }
            column(REDM_Load_Port; REDMPort.Decription)
            {

            }
            column(Validity_And_Subject; "Validity And Subject")
            {

            }
            column(Other_Terms_And_Condition; "Other Terms And Condition")
            {

            }
            column(Shipping_Conditions; "Shipping Conditions")
            {

            }
            column(Payment_Term_Condition; "Payment Term/Condition")
            {

            }
            column(Delivery_Terms; "REDM Delivery Time")
            {

            }


        }
        modify(Header)
        {

            trigger OnAfterAfterGetRecord()
            begin
                if RedmCountry.Get("REDM Country of Origin") then;
                OverReceiptCode.Reset();
                OverReceiptCode.SetRange(Code, "REDM Document Tolerance");
                if OverReceiptCode.FindFirst() then;

                REDMPort.Reset();
                REDMPort.SetRange(Code, "REDM Load Port");
                if REDMPort.FindFirst() then;
                ComInformation.GET;
                IF RecCountry.Get((ComInformation."Country/Region Code")) then;
            end;

        }
        add(Line)
        {
            column(SLComment; SLComment)
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(Item_No_; "No.")
            {

            }

        }
        addlast(Header)
        {
            dataitem("Sales Comment Line Header"; "Sales Comment Line")
            {
                DataItemLink = "No." = field("No."), "Document Type" = field("Document Type");
                DataItemLinkReference = Header;
                DataItemTableView = where("Document Line No." = Filter(0));
                column(SHComment; Comment)
                {

                }
                column(SHCommentNO; "No.")
                {

                }
                column(ShLine_No_; "Line No.")
                {

                }
            }
        }
        addlast(Line)
        {
            dataitem("REDM Item Specification (Sale)"; "REDM Item Specification (Sale)")
            {
                DataItemLink = "REDM Document No." = field("Document No."), "REDM Line No." = field("Line No.");
                DataItemLinkReference = Line;
                column(REDM_Parameter_Code; "REDM Parameter Code")
                {

                }
                column(REDM_Line_No_; "REDM Parameter Code")
                {

                }
                column(REDM_Document_No_; "REDM Document No.")
                {

                }
                column(REDM_Parameter_UOM; "REDM Parameter UOM")
                {

                }

                column(REDM_Guaranteed_Value; "REDM Guaranteed Value")
                {

                }
                column(REDM_Rejected_Value; "REDM Rejected Value")
                {

                }
                column(REDM_Additional_Description; "REDM Additional Description")
                {

                }
                column(REDM_Parameter_Description; "REDM Parameter Description")
                {

                }
                column(Srno; Srno)
                {

                }
                trigger OnPreDataItem()
                begin
                    Clear(Srno);
                end;

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    Srno += 1;

                end;
            }
        }
        modify(Line)
        {
            trigger OnAfterAfterGetRecord()
            begin
                Clear(SLComment);
                SCommentLine.Reset();
                SCommentLine.SetRange("Document Type", "Document Type");
                SCommentLine.SetRange("No.", "Document No.");
                SCommentLine.SetRange("Document Line No.", "Line No.");
                if SCommentLine.FindSet() then
                    repeat
                        if SLComment = '' then
                            SLComment := SCommentLine.Comment
                        else
                            SLComment := SLComment + ', ' + SCommentLine.Comment;
                    until SCommentLine.Next() = 0;
            end;
        }
        // modify(LetterText)
        // {
        //     trigger OnAfterAfterGetRecord()
        //     begin
        //         CurrReport.Language := Language1.GetLanguageIdOrDefault('ENU');
        //     end;
        // }
    }
    trigger OnPreReport()
    begin
        ComInformation.GET;

    end;

    var
        RecCountry: Record "Country/Region";
        RedmCountry: Record "Country/Region";
        REDMPort: Record "REDM Port Master";// 51411006
        ItemUOM: Record 204;
        OverReceiptCode: record 8510;
        SHComment: text;
        SLComment: Text;
        SalCommentL: Record 44;
        SCommentLine: Record 44;
        SdSalesQuotes: Report "Standard Sales - Quote";
        Language1: Codeunit Language;
        Srno: Integer;
        ComInformation: Record 79;
}