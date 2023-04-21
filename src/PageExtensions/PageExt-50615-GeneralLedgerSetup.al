pageextension 50615 "General Ledger Setup EXT" extends "General Ledger Setup"
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
        addlast("Bank Posting")
        {
            action(Test)
            {
                ApplicationArea = All;
                Caption = 'Test';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Image;
                RunObject = codeunit 50602;

                trigger OnAction()
                begin

                end;
            }
        }
    }

}

