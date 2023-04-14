pageextension 50606 "Posted Sales Invoice_Ext" extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
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
        }
    }

    var
        myInt: Integer;
        SIH: Record 112;
}