tableextension 50601 "ItemJournal Line EXT" extends "Item Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(50600; Curre; Blob)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}