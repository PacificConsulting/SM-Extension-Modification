pageextension 50630 Contactpage extends "Contact List"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("Date of Meeting"; Rec."Date of Meeting")
            {
                ApplicationArea = all;
            }
            field("Type of Meeting"; Rec."Type of Meeting")
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