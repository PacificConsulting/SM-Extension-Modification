tableextension 50602 "bank Account Ledger Ent Ext" extends "Bank Account Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50600; "Gen. Prod. Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}