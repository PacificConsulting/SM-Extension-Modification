tableextension 50612 "Purchase and Payable EXT" extends "Purchases & Payables Setup"
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