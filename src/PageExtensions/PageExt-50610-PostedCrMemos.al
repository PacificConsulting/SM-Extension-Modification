pageextension 50610 "Posted Sales CR Memo EXT" extends "Posted Sales Credit Memos"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("REDM OWN VAT Account No."; Rec."REDM OWN VAT Account No.")
            {
                ApplicationArea = All;
                Caption = 'OWN VAT Number';
            }

            field("VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
                Caption = 'Vendor VAT Number';
            }
            field("REDM Transportation Type"; Rec."REDM Transportation Type")
            {
                ApplicationArea = All;
                Caption = 'Transportation Type';
            }
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