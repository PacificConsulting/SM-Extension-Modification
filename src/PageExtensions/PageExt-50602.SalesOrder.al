pageextension 50602 "Sales ord_Ext" extends "Sales Order"
{
    layout
    {
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
        // Add changes to page layout here
        addafter("Foreign Trade")
        {
            group("Additional Details")
            {
                field("Shipping Conditions"; Rec."Shipping Conditions")
                {
                    ApplicationArea = All;

                }
                field("Payment Term/Condition"; Rec."Payment Term/Condition")
                {
                    ApplicationArea = All;
                }
                field("Quality ANd Weight"; Rec."Quality ANd Weight")
                {
                    ApplicationArea = All;
                }
                field("Validity And Subject"; Rec."Validity And Subject")
                {
                    ApplicationArea = All;
                }
                field("Other Terms And Condition"; Rec."Other Terms And Condition")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter("Print Confirmation")
        {
            action("Proforma UIC")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category11;
                Image = Print;
                trigger OnAction()
                begin
                    SH.Reset();
                    SH.SetRange("No.", Rec."No.");
                    if SH.FindFirst() then begin
                        report.RunModal(50602, true, true, SH);
                    end;
                end;
            }
        }
        modify("Proforma Invoice ATG")
        {
            Visible = false;
        }
    }
    var
        SH: Record 36;

}