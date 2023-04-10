pageextension 50601 "Sales Quote_Ext" extends "Sales Quote"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("REDM Country of Origin"; Rec."REDM Country of Origin")
            {
                ApplicationArea = All;
                Caption = 'Country of Origin';
            }
            field("REDM Inco Terms/Delivery Terms"; Rec."REDM Inco Terms/Delivery Terms")
            {
                ApplicationArea = All;
                Caption = 'Inco Terms';
            }
            field("REDM Document Tolerance"; Rec."REDM Document Tolerance")
            {
                ApplicationArea = All;
                Caption = 'Document Tolerance';
                TableRelation = "Over-Receipt Code";
            }
            field("REDM Discharge Terms"; Rec."REDM Discharge Terms")
            {
                ApplicationArea = All;
                Caption = 'Delivery Terms';
            }
            field("REDM Delivery Time"; Rec."REDM Delivery Time")
            {
                ApplicationArea = all;
                Caption = 'Delivery Time';
            }

        }
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
        addafter(Email)
        {
            action("PROPOSAL-COAL/COKE")
            {
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedCategory = Category9;
                Image = Report;
                trigger OnAction()
                begin
                    rec."Language Code" := 'ENU';
                    rec.Modify();
                    SH.Reset();
                    SH.SetRange("No.", Rec."No.");
                    if SH.FindFirst() then begin
                        Report.RunModal(50600, true, true, SH);
                    end;
                end;
            }
        }

        modify(Print)
        {
            Caption = 'PROPOSAL-STEEL/OTHER';
        }

    }

    var
        myInt: Integer;
        SH: Record 36;

}