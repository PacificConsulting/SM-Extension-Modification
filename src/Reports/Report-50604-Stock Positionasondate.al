report 50604 "Stock Position"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\StockPosition.rdl';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            RequestFilterFields = "Location Code", "Posting Date", "Item No.";
            DataItemTableView = where("Remaining Quantity" = filter(<> 0));
            column(Item_No_; "Item No.")
            {
            }
            column(UOM; RecItem."Base Unit of Measure")
            {

            }
            column(Description; Description)
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(Cost_Amount__Actual_; "Cost Amount (Actual)")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Remaining_Quantity; "Remaining Quantity")
            {

            }
            column(LocName; Loc.Name)
            {
            }
            column(Desc; RecItem.Description)
            {
            }
            column(noofdays; noofdays)
            {

            }
            trigger OnAfterGetRecord()
            begin
                if RecItem.Get("Item Ledger Entry"."Item No.") then;
                if Loc.Get("Item Ledger Entry"."Location Code") then;

                //noofdays := Today - "Posting Date";
            end;
        }
    }

    var
        myInt: Integer;
        Loc: Record Location;
        RecItem: Record Item;
        noofdays: Integer;
}