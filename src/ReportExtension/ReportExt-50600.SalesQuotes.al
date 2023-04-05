reportextension 50600 "Sales Quotes_EXT" extends "Standard Sales - Quote"
{
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
}