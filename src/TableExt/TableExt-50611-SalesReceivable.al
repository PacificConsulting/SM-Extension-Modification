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
        field(50602; "Email Id for Invoice Due"; Text[500])
        {
            DataClassification = ToBeClassified;
            Description = '//PCPL-25/220523';
        }

    }

    var
        myInt: Integer;
}