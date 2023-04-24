pageextension 50617 "Bank Account card EXT" extends "Bank Account Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("Email Alerts"; Rec."Email Alerts")
            {
                ApplicationArea = All;
            }

        }
    }

    var
        myInt: Integer;
}