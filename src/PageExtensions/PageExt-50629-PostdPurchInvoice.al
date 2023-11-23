pageextension 50629 PostedPurchInv extends "Posted Purchase Invoice"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("Purchase Contract Number"; Rec."Purchase Contract Number")
            {
                ApplicationArea = all;
            }
            field("Purchase Contract Date"; Rec."Purchase Contract Date")
            {
                ApplicationArea = all;
            }
            field("Purch Contract Validity Days"; Rec."Purch Contract Validity Days")
            {
                ApplicationArea = all;
            }
            field("Purch Contract Validity Date"; Rec."Purch Contract Validity Date")
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