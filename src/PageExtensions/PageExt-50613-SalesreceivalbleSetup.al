pageextension 50613 "Sales & Receivable EXT" extends "Sales & Receivables Setup"
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
            field("Email Id for Invoice Due"; Rec."Email Id for Invoice Due")
            {
                ApplicationArea = All;
            }

        }
    }
    actions
    {
        addafter("Customer Price Groups")
        {
            action(Test)
            {
                ApplicationArea = All;
                Caption = 'Test';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Image;
                RunObject = codeunit 50605;

                trigger OnAction()
                begin

                end;
            }
            // action("Due Next Week")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Due NExt Week';
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     Image = Image;
            //     RunObject = codeunit 50606;
            // }

        }
    }


}