tableextension 50603 "Value Entry EXT" extends "Value Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50600; "VAT Transaction Type"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}