pageextension 50621 Vendorpostinggrp extends "Vendor Posting Groups"
{
    layout
    {
        // Add changes to page layout here
        addbefore("Service Charge Acc.")
        {
            field("Email Alert"; Rec."Email Alert")
            {
                ApplicationArea = All;
            }
        }
    }

    var
        myInt: Integer;
}