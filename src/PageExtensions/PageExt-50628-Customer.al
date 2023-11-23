pageextension 50628 Cust extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(Invoicing)
        {
            field("ISCC Certificate Number"; Rec."ISCC Certificate Number")
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