pageextension 50611 "Sales Order Sub EXT" extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Quantity Shipped")
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