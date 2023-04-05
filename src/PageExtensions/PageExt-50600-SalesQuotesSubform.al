pageextension 50600 "Sales Quotes Sub_Ext" extends "Sales Quote Subform"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("Item &Tracking Lines")
        {
            action("Item Specifications")
            {
                ApplicationArea = all;
                trigger OnAction()
                begin
                    Clear(PageItemSpecification);
                    ItemSpecification.Reset();
                    ItemSpecification.SetRange("REDM Document Type", Rec."Document Type");
                    ItemSpecification.SetRange("REDM Document No.", Rec."Document No.");
                    ItemSpecification.SetRange("REDM Line No.", Rec."Line No.");
                    if ItemSpecification.FindFirst() then; //begin
                    PageItemSpecification.LookupMode(true);
                    PageItemSpecification.SetTableView(ItemSpecification);
                    if PageItemSpecification.RunModal() = Action::LookupOK then
                        PageItemSpecification.SetSelectionFilter(ItemSpecification);
                    //end;
                end;
            }
        }

    }

    var
        myInt: Integer;
        ItemSpecification: Record 50122;
        PageItemSpecification: Page 50122;
}