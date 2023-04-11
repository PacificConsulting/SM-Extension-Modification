pageextension 50604 "Value Entries EXT" extends "Value Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("Transportation Type")
        {
            field("VAT Transaction Type"; Rec."VAT Transaction Type")
            {
                ApplicationArea = All;
            }
            field(Thickness; Rec.Thickness)
            {
                ApplicationArea = All;
            }
            field("Length (MM)"; Rec."Length (MM)")
            {
                ApplicationArea = All;
            }
            field(Diameter; Rec.Diameter)
            {
                ApplicationArea = All;
            }
            field("Width (MM)"; Rec."Width (MM)")
            {
                ApplicationArea = All;
            }

            field("Profile Code"; Rec."Profile Code")
            {
                ApplicationArea = All;
            }




        }
        modify("Transportation Type")
        {
            Visible = false;
        }
    }

    // actions
    // {
    //     // Add changes to page actions here
    // }

    var
        myInt: Integer;
}