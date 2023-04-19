pageextension 50609 "Posted Sales Invoices Ext" extends "Posted Sales Invoices"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("Invoiced Quantity"; Rec."Invoiced Quantity")
            {
                ApplicationArea = All;
            }
        }
        addafter(Amount)
        {
            field("Invoice Amount(LCY)"; Rec."Invoice Amount(LCY)")
            {
                ApplicationArea = All;
            }

        }
        modify("Amount (LCY)")
        {
            Caption = 'Actual Amount (LCY)';
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}