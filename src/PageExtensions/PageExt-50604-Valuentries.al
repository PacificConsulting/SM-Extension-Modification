pageextension 50604 "Value Entries EXT" extends "Value Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("Transportation Type")
        {
            field("VAT Transaction Type"; Rec."VAT Transaction Type")
            {
                ApplicationArea = All;
            }
        }
        modify("Transportation Type")
        {
            Visible = false;
        }
    }

    // actions
    // {
    //     // Add changes to page actions here
    // }

    var
        myInt: Integer;
}