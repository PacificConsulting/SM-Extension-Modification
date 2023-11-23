pageextension 50606 "Posted Sales Invoice_Ext" extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("Purchase Contract Number"; Rec."Sales Contract Number")
            {
                ApplicationArea = all;
            }
            field("Purchase Contract Date"; Rec."Sales Contract Date")
            {
                ApplicationArea = all;
            }
            field("Purch Contract Validity Days"; Rec."Sales Contract Validity Days")
            {
                ApplicationArea = all;
            }
            field("Purch Contract Validity Date"; Rec."Sales Contract Validity Date")
            {
                ApplicationArea = all;
            }
            field("ISCC Claim"; Rec."ISCC Claim")
            {
                ApplicationArea = all;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
        addafter("Debit Note")
        {
            action("Commercial Invoice UIC")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category6;
                Image = Print;
                trigger OnAction()
                begin
                    SIH.Reset();
                    SIH.SetRange("No.", Rec."No.");
                    if SIH.FindFirst() then begin
                        report.RunModal(50603, true, true, SIH);
                    end;
                end;
            }
            action("Run CU")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category6;
                Image = Print;
                Visible = false;
                trigger OnAction()
                var
                    CU: Codeunit 50606;
                begin
                    CU.Run();
                end;

            }
        }
    }

    var
        myInt: Integer;
        SIH: Record 112;
}