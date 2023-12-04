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
            field("Email ID for Opportunity"; Rec."Email ID for Opportunity")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addafter("Customer Price Groups")
        {
            // action(Test)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Test';
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     Image = Image;
            //     RunObject = codeunit 50607;

            //     trigger OnAction()
            //     begin

            //     end;
            // }

            // action("Due Next Week")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Stock';
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     Image = Image;
            //     RunObject = codeunit 50603;
            // }

        }
    }


}