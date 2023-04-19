pageextension 50607 "Posted Purchase Invoice EXT" extends "Posted Purchase Invoices"
{

    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
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

    var
        myInt: Integer;
        TarrifCode: Code[250];
        InvQty: Decimal;
        PIL: Record 123;
}