pageextension 50626 SaleInvoice extends "Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
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
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}