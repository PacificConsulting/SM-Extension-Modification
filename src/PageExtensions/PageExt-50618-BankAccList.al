pageextension 50618 "Bank Account List EXT" extends "Bank Account List"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
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