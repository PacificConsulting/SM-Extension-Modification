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
            field("Email Id for Invoice Due"; Rec."Email Id for Invoice Due")
            {
                ApplicationArea = All;
            }
        }
    }
    // actions
    // {
    //     addafter("Vendor Posting Groups")
    //     {
    //         // action(Test)
    //         // {
    //         //     applicationArea = All;
    //         //     Caption = 'Test';
    //         //     Promoted = true;
    //         //     PromotedCategory = Process;
    //         //     PromotedIsBig = true;
    //         //     Image = Image;
    //         //     RunObject = codeunit 50604;
    //         // }

    //     }
    // }

}