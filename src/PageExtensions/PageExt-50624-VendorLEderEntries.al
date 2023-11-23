pageextension 50625 VendorLEdgerEntries extends "Vendor Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
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