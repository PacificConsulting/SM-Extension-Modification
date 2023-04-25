pageextension 50614 "Purch & Payable EXT" extends "Purchases & Payables Setup"
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
        addafter("Vendor Posting Groups")
        {
            action(Test)
            {
                ApplicationArea = All;
                Caption = 'Test';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Image;
                RunObject = codeunit 50604;

                trigger OnAction()
                begin

                end;
            }

        }
    }

}