pageextension 50602 "Sales ord_Ext" extends "Sales Order"
{
    layout
    {
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
        // modify("REDMMulti Proforma Invoice Print")
        // {
        //     Visible = false;
        // }
    }
    var
        SH: Record 36;

}