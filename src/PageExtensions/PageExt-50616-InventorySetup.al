pageextension 50616 "Inventory Setup EXT" extends "Inventory Setup"
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
            field("Email Id"; Rec."Email Id")
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
        // Add changes to page actions here

        addlast(Posting)
        {
            action(Test)
            {
                ApplicationArea = All;
                Caption = 'Test';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Image;
                RunObject = codeunit 50603;

                trigger OnAction()
                begin

                end;
            }

        }
    }

    var
        myInt: Integer;
}