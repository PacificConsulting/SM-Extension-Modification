pageextension 50619 "Purchase Ord EXT" extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("Purchase Contract Number"; Rec."Purchase Contract Number")
            {
                ApplicationArea = all;
            }
            field("Purchase Contract Date"; Rec."Purchase Contract Date")
            {
                ApplicationArea = all;
            }
            field("Purch Contract Validity Days"; Rec."Purch Contract Validity Days")
            {
                ApplicationArea = all;
            }
            field("Purch Contract Validity Date"; Rec."Purch Contract Validity Date")
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
        addafter(AttachAsPDF)
        {
            action("Purchase Order UIC")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category10;
                Image = Print;
                trigger OnAction()
                begin
                    PH.Reset();
                    PH.SetRange("No.", Rec."No.");
                    if PH.FindFirst() then begin
                        report.RunModal(50606, true, true, PH);
                    end;
                end;
            }
        }
    }

    var
        myInt: Integer;
        PH: Record "Purchase Header";
}