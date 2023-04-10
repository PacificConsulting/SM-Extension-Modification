tableextension 50601 "ItemJournal Line EXT" extends "Item Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(50600; "Currency Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50601; "Tarrif Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50602; "VAT Registration No."; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50603; "Own VAT Account No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50604; "VAT Transaction Type"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}