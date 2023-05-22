tableextension 50614 "Inventory setup EXT" extends "Inventory Setup"
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
        field(50602; "Validation For No. of units"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = '//PCPL-25/220523';
        }
    }

    var
        myInt: Integer;
}