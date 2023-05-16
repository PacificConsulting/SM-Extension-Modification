tableextension 50617 "Item Leder Entry Ext" extends "Item Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50601; "Vessel Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50602; "Country of Origin"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        Field(50603; "Destination Country"; Code[50])
        {
            DataClassification = ToBeClassified;
        }

        field(50604; "Country of final Destination"; code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}