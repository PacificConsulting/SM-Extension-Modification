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
            field("Purchase Contract Number"; Rec."Sales Contract Number")
            {
                ApplicationArea = all;
            }
            field("Purchase Contract Date"; Rec."Sales Contract Date")
            {
                ApplicationArea = all;
            }
            field("Purch Contract Validity Days"; Rec."Sales Contract Validity Days")
            {
                ApplicationArea = all;
            }
            field("Purch Contract Validity Date"; Rec."Sales Contract Validity Date")
            {
                ApplicationArea = all;
            }
            field("ISCC Claim"; Rec."ISCC Claim")
            {
                ApplicationArea = all;
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