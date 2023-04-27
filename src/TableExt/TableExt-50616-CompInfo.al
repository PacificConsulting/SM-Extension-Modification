tableextension 50616 "Comppany Info" extends "Company Information"
{
    fields
    {
        // Add changes to table fields here
        field(50600; "PAN Number"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50601; "TAN Number"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50602; "GST Registration Number"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50603; "CIN Number"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}