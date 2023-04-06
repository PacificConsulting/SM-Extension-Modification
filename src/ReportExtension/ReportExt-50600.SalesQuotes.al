reportextension 50600 "Sales Quotes_EXT" extends "Standard Sales - Quote"
{
    WordLayout = './StandardSalesQuote.docx';
    dataset
    {
        // Add changes to dataitems and columns here
        add(Header)
        {
            column(REDM_Country_of_Origin; RedmCountry.Name)
            {
            }
            column(Quality_And_Weight; "Quality And Weight")
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
            column(ShComment; ShComment)
            {

            }

        }
        modify(Header)
        {
            trigger OnAfterAfterGetRecord()
            begin
                OverReceiptCode.Reset();
                OverReceiptCode.SetRange(Code, "REDM Document Tolerance");
                if OverReceiptCode.FindFirst() then;

                REDMPort.Reset();
                REDMPort.SetRange(Code, "REDM Load Port");
                if REDMPort.FindFirst() then;
                Clear(SHComment);
                SalCommentL.Reset();
                SalCommentL.SetRange("Document Type", "Document Type");
                SalCommentL.SetRange("No.", "No.");
                SalCommentL.SetRange("Document Line No.", 0);
                if SalCommentL.FindSet() then
                    repeat
                        if SHComment = '' then
                            SHComment := SalCommentL.Comment
                        else
                            SHComment := SHComment + ', ' + SalCommentL.Comment;
                    until SalCommentL.Next() = 0;
            end;
        }
        add(Line)
        {
            column(SLComment; SLComment)
            {

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

    }


    requestpage
    {
        // Add changes to the requestpage here
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }
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
}