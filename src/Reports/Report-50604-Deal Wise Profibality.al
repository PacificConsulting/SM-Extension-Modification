report 50604 "Deal Wise Profitability"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\DealWiseProfit_1.rdl';

    dataset
    {
        dataitem("REDM Deal Header"; "REDM Deal Header")
        {
            RequestFilterFields = "Deal No.";
            column(Deal_No_; "Deal No.")
            {

            }
            column(CompCountry; CompCountry)
            { }
            column(Deal_Description; "Deal Description")
            { }
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(CompInfoAdd1; CompInfo.Address)
            {
            }
            column(CompInfoAdd2; CompInfo."Address 2")
            {
            }
            column(CompInfocity; CompInfo.City)
            {
            }
            column(Website; CompInfo."Home Page")
            {
            }
            column(Comppostcode; CompInfo."Post Code")
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "REDM Deal No." = field("Deal No.");
                DataItemLinkReference = "REDM Deal Header";

                column(GLGen__Prod__Posting_Group; "Gen. Prod. Posting Group")
                {

                }
                column(GLDeal_No_; "REDM Deal No.")
                {

                }
            }
            dataitem("REDM Deal Participant"; "REDM Deal Participant")
            {
                DataItemLink = "REDM Deal No." = field("Deal No.");
                DataItemLinkReference = "REDM Deal Header";

                column(Item_Code; "REDM Item Code")
                {

                }
                column(Line_No_; "REDM Line No.")
                {

                }
                column(Item_Description; "REDM Item Description")
                {

                }
                Column(Purchase_Amount; "REDM Purchase Amount")
                {

                }
                Column(Purchase_Quantity; "REDM Purchase Quantity")
                {

                }
                column(Sales_Amount; "REDM Sales Amount")
                {

                }
                column(Sales_Qty_; "REDM Sales Qty.")
                {

                }
                column(Supplier_Name; "REDM Supplier Name")
                {

                }
                column(Customer_Name; "REDM Customer Name")
                {

                }
                column(UOM; "REDM UOM")
                {

                }
                trigger OnAfterGetRecord()
                begin
                    Message(Format("REDM Item Description"));
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CountryTable.RESET;
                CountryTable.SETRANGE(CountryTable.Code, CompInfo."Country/Region Code");
                IF CountryTable.FINDFIRST THEN
                    CompCountry := CountryTable.Name;
            end;
        }
    }


    var
        myInt: Integer;
        CompInfo: Record 79;
        CountryTable: Record 9;
        CompCountry: Text;
}