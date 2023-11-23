tableextension 50618 "Vendor Ledger Entry EXT" extends "Vendor Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50601; "Country of Origin"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        Field(50602; "Destination Country"; Code[50])
        {
            DataClassification = ToBeClassified;
        }

        field(50603; "Country of final Destination"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50604; "Vessel Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50605; "ISCC Certificate Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}