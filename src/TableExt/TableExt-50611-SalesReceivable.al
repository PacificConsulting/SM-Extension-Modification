tableextension 50611 "Sales And Receivable EXT" extends "Sales & Receivables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50600; "Email Alerts"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50601; "Email Id"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}