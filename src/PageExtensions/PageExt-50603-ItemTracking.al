pageextension 50603 "Item Tracking_Ext" extends "Item Tracking Lines"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnClosePage()
    var
        myInt: Integer;
    begin
        if Rec."Lot No." <> '' then
            Rec.TestField("No.Of Units");
    end;

    var
        myInt: Integer;
}