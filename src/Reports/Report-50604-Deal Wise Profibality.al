// report 50604 "Deal Wise Profitability old"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'src\Report Layout\DealWiseProfit_1.rdl';

//     dataset
//     {
//         dataitem("REDM Deal Header"; "REDM Deal Header")
//         {
//             RequestFilterFields = "Deal No.";
//             column(Deal_No_; "Deal No.")
//             {

//             }
//             column(Cost_Amount; COGSvalue) { }
//             column(CompCountry; CompCountry)
//             { }
//             column(Deal_Description; "Deal Description")
//             { }
//             column(CompInfo_Name; CompInfo.Name)
//             {
//             }
//             column(Logo; CompInfo.Picture) { }
//             column(CompInfoAdd1; CompInfo.Address)
//             {
//             }
//             column(CompInfoAdd2; CompInfo."Address 2")
//             {
//             }
//             column(CompInfocity; CompInfo.City)
//             {
//             }
//             column(Website; CompInfo."Home Page")
//             {
//             }
//             column(Comppostcode; CompInfo."Post Code")
//             {
//             }
//             dataitem("REDM Deal Participant"; "REDM Deal Participant")
//             {
//                 DataItemLink = "REDM Deal No." = field("Deal No.");
//                 DataItemLinkReference = "REDM Deal Header";

//                 column(Item_Code; "REDM Item Code")
//                 {

//                 }
//                 column(Line_No_; "REDM Line No.")
//                 {

//                 }
//                 column(DealNo; "REDM Deal No.") { }
//                 column(Item_Description; "REDM Item Description")
//                 {

//                 }
//                 Column(Purchase_Amount; "REDM Purchase Amount")
//                 {

//                 }
//                 Column(Purchase_Quantity; "REDM Purchase Quantity")
//                 {

//                 }
//                 column(Sales_Amount; "REDM Sales Amount")
//                 {

//                 }
//                 column(Sales_Qty_; "REDM Sales Qty.")
//                 {

//                 }
//                 column(Sales_Amount_LCY; "REDM Sales Amount LCY") { }
//                 column(Purchase_Amount_LCY; "REDM Purchase Amount LCY") { }
//                 column(Supplier_Name; "REDM Supplier Name")
//                 {

//                 }
//                 column(Customer_Name; "REDM Customer Name")
//                 {

//                 }
//                 column(UOM; "REDM UOM")
//                 {

//                 }
//                 dataitem("G/L Entry"; "G/L Entry")
//                 {
//                     DataItemLink = "Global Dimension 1 Code" = field("REDM Deal No.");
//                     DataItemLinkReference = "REDM Deal Participant";
//                     DataItemTableView = where("REDM Expens DealWise Statement" = filter(true));
//                     column(GLprodgroup; GenPrdgrp.Description)
//                     {

//                     }
//                     column(GLDeal_No_; "REDM Deal No.")
//                     {

//                     }
//                     column(GLDocument_No_; "Document No.") { }
//                     column(Amount; Amount)
//                     { }
//                     trigger OnAfterGetRecord()
//                     var
//                         myInt: Integer;
//                     begin
//                         GenPrdgrp.Reset();
//                         GenPrdgrp.SetRange(Code, "Gen. Prod. Posting Group");
//                         if GenPrdgrp.FindFirst() then;
//                     end;
//                 }
//                 trigger OnAfterGetRecord()
//                 begin
//                     //Message(Format("REDM Item Description"));
//                     PIH.Reset();
//                     PIH.SetRange("Shortcut Dimension 1 Code", "REDM Deal No.");
//                     PIH.SetRange("Buy-from Vendor No.", "REDM Supplier Code");
//                     if PIH.FindSet() then
//                         repeat
//                             ValueEntry.Reset();
//                             ValueEntry.SetRange("REDM Deal No.", "REDM Deal No.");
//                             ValueEntry.SetRange("Document No.", PIH."No.");
//                             if ValueEntry.FindSet() then
//                                 repeat
//                                     COGSvalue += ValueEntry."Cost Posted to G/L";
//                                 until ValueEntry.Next() = 0;
//                         until PIH.Next() = 0;
//                     SIH.Reset();
//                     SIH.SetRange("Shortcut Dimension 1 Code", "REDM Deal No.");
//                     SIH.SetRange("Sell-to Customer No.", "REDM Customer No.");
//                     if SIH.FindSet() then
//                         repeat
//                             ValueEntry.Reset();
//                             ValueEntry.SetRange("REDM Deal No.", "REDM Deal No.");
//                             ValueEntry.SetRange("Document No.", SIH."No.");
//                             if ValueEntry.FindSet() then
//                                 repeat
//                                     COGSvalue += ValueEntry."Cost Posted to G/L";
//                                 until ValueEntry.Next() = 0;
//                         until SIH.Next() = 0;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 CountryTable.RESET;
//                 CountryTable.SETRANGE(CountryTable.Code, CompInfo."Country/Region Code");
//                 IF CountryTable.FINDFIRST THEN
//                     CompCountry := CountryTable.Name;

//                 CompInfo.GET;
//                 CompInfo.CALCFIELDS(CompInfo.Picture);
//             end;
//         }
//     }


//     var
//         myInt: Integer;
//         CompInfo: Record 79;
//         CountryTable: Record 9;
//         CompCountry: Text;
//         GenPrdgrp: Record 251;
//         ValueEntry: Record "Value Entry";
//         PIH: Record 122;
//         SIH: Record 112;
//         COGSvalue: Decimal;
// }