pageextension 50612 "Purchase Order Sub EXT" extends "Purchase Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Quantity Received")
        {
            field("Invoice Value"; Rec."Invoice Value")
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