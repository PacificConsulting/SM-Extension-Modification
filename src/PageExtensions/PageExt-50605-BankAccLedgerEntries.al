pageextension 50605 "Bank Acc Ledger Entries EXT" extends "Bank Account Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("External Document No.")
        {
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
            }
            field("Document Date"; Rec."Document Date")
            {
                ApplicationArea = All;
            }


        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}