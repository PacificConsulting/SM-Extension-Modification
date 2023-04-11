// report 50601 "Inventory Valuation (update)"
// {
//     // +-----------------------------------------------------+
//     // |               GOB Software & Systeme                |
//     // +-----------------------------------------------------+
//     // |                   unitop Handel                     |
//     // +-----------------------------------------------------+
//     // 
//     // Version            Comment
//     // -------------------------------------------------------
//     // ihd0000.1000.0000  Variants
//     // 
//     // 
//     // +-----------------------------------------------------+
//     // |               GOB Software & Systeme                |
//     // +-----------------------------------------------------+
//     // |                   unitop ERP                        |
//     // +-----------------------------------------------------+
//     // 
//     // Version            Comment
//     // -------------------------------------------------------
//     // ERP11.01
//     // 
//     // IW.STM.9692
//     //   Fields
//     //     Unfold Item Variants              - changed (caption to Include Variants Overview)
//     //   Triggers
//     //     Item - OnAfterGetRecord()         - changed
//     //     Item - OnPreDataItem()            - changed
//     //     AssignAmounts                     - changed
//     //     Value Entry - OnAfterGetRecord()  - changed
//     //     Value Entry - OnPreDataItem()     - changed
//     //   20191107
//     //     Replaced "Value Entry" dataitem with ValueEntryLoop dataitem (Integer)
//     //     Replaced "Value Entry" dataitem variable with ValueEntry2 record variable
//     DefaultLayout = RDLC;
//     RDLCLayout = './InventoryValuationupdate.rdlc';

//     Caption = 'Inventory Valuation (update)';
//     EnableHyperlinks = true;

//     dataset
//     {
//         dataitem(Item;Item)
//         {
//             DataItemTableView = SORTING ("Inventory Posting Group")
//                                 WHERE (Type = CONST (Inventory));
//             RequestFilterFields = "No.", "Inventory Posting Group", "Statistics Group";
//             column(BoM_Text; BoM_TextLbl)
//             {
//             }
//             column(LocationCodeLblCaption; LocationCodeLbl)
//             {
//             }
//             column(WeightCaption1; WeightLbl1)
//             {
//             }
//             column(WeightCaption2; WeightLbl2)
//             {
//             }
//             column(WeightCaption3; WeightLbl3)
//             {
//             }
//             column(WeightCaption4; WeightLbl4)
//             {
//             }
//             column(VariantNoLblCaption; VariantNoLbl)
//             {
//             }
//             column(COMPANYNAME; COMPANYPROPERTY.DISPLAYNAME)
//             {
//             }
//             column(CurrReport_PAGENO; CurrReport.PAGENO)
//             {
//             }
//             column(STRSUBSTNO___1___2__Item_TABLECAPTION_ItemFilter_; STRSUBSTNO('%1: %2', TABLECAPTION, ItemFilter))
//             {
//             }
//             column(STRSUBSTNO_Text005_StartDateText_; STRSUBSTNO(Text005, StartDateText))
//             {
//             }
//             column(STRSUBSTNO_Text005_FORMAT_EndDate__; STRSUBSTNO(Text005, FORMAT(EndDate)))
//             {
//             }
//             column(ShowExpected; ShowExpected)
//             {
//             }
//             column(ItemFilter; ItemFilter)
//             {
//             }
//             column(Inventory_ValuationCaption; Inventory_ValuationCaptionLbl)
//             {
//             }
//             column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
//             {
//             }
//             column(This_report_includes_entries_that_have_been_posted_with_expected_costs_Caption; This_report_includes_entries_that_have_been_posted_with_expected_costs_CaptionLbl)
//             {
//             }
//             column(ItemNoCaption; ValueEntry.FIELDCAPTION("Item No."))
//             {
//             }
//             column(ItemDescriptionCaption; FIELDCAPTION(Description))
//             {
//             }
//             column(IncreaseInvoicedQtyCaption; IncreaseInvoicedQtyCaptionLbl)
//             {
//             }
//             column(DecreaseInvoicedQtyCaption; DecreaseInvoicedQtyCaptionLbl)
//             {
//             }
//             column(QuantityCaption; QuantityCaptionLbl)
//             {
//             }
//             column(ValueCaption; ValueCaptionLbl)
//             {
//             }
//             column(QuantityCaption_Control31; QuantityCaption_Control31Lbl)
//             {
//             }
//             column(QuantityCaption_Control40; QuantityCaption_Control40Lbl)
//             {
//             }
//             column(InvCostPostedToGL_Control53Caption; InvCostPostedToGL_Control53CaptionLbl)
//             {
//             }
//             column(QuantityCaption_Control58; QuantityCaption_Control58Lbl)
//             {
//             }
//             column(TotalCaption; TotalCaptionLbl)
//             {
//             }
//             column(Expected_Cost_IncludedCaption; Expected_Cost_IncludedCaptionLbl)
//             {
//             }
//             column(Expected_Cost_Included_TotalCaption; Expected_Cost_Included_TotalCaptionLbl)
//             {
//             }
//             column(Expected_Cost_TotalCaption; Expected_Cost_TotalCaptionLbl)
//             {
//             }
//             column(GetUrlForReportDrilldown; GetUrlForReportDrilldown("No."))
//             {
//             }
//             column(ItemNo; "No.")
//             {
//             }
//             column(ItemDescription; Description)
//             {
//             }
//             column(ItemBaseUnitofMeasure; "Base Unit of Measure")
//             {
//             }
//             column(Item_Inventory_Posting_Group; "Inventory Posting Group")
//             {
//             }
//             column(StartingInvoicedValue; StartingInvoicedValue)
//             {
//                 AutoFormatType = 1;
//             }
//             column(StartingInvoicedQty; StartingInvoicedQty)
//             {
//                 DecimalPlaces = 0 : 5;
//             }
//             column(StartingInvoicedWeight; StartingInvoicedWeight)
//             {
//             }
//             column(StartingExpectedValue; StartingExpectedValue)
//             {
//                 AutoFormatType = 1;
//             }
//             column(StartingExpectedQty; StartingExpectedQty)
//             {
//                 DecimalPlaces = 0 : 5;
//             }
//             column(StartingExpectedWeight; StartingExpectedWeight)
//             {
//             }
//             column(IncreaseInvoicedValue; IncreaseInvoicedValue)
//             {
//                 AutoFormatType = 1;
//             }
//             column(IncreaseInvoicedQty; IncreaseInvoicedQty)
//             {
//                 DecimalPlaces = 0 : 5;
//             }
//             column(IncreaseInvoicedWeight; IncreaseInvoicedWeight)
//             {
//             }
//             column(IncreaseExpectedValue; IncreaseExpectedValue)
//             {
//                 AutoFormatType = 1;
//             }
//             column(IncreaseExpectedQty; IncreaseExpectedQty)
//             {
//                 DecimalPlaces = 0 : 5;
//             }
//             column(IncreaseExpectedWeight; IncreaseExpectedWeight)
//             {
//             }
//             column(DecreaseInvoicedValue; DecreaseInvoicedValue)
//             {
//                 AutoFormatType = 1;
//             }
//             column(DecreaseInvoicedQty; DecreaseInvoicedQty)
//             {
//                 DecimalPlaces = 0 : 5;
//             }
//             column(DecreaseInvoicedWeight; DecreaseInvoicedWeight)
//             {
//             }
//             column(DecreaseExpectedValue; DecreaseExpectedValue)
//             {
//                 AutoFormatType = 1;
//             }
//             column(DecreaseExpectedQty; DecreaseExpectedQty)
//             {
//                 DecimalPlaces = 0 : 5;
//             }
//             column(DecreaseExpectedWeight; DecreaseExpectedWeight)
//             {
//             }
//             column(EndingInvoicedValue; StartingInvoicedValue + IncreaseInvoicedValue - DecreaseInvoicedValue)
//             {
//             }
//             column(EndingInvoicedQty; StartingInvoicedQty + IncreaseInvoicedQty - DecreaseInvoicedQty)
//             {
//                 DecimalPlaces = 0 : 5;
//             }
//             column(EndingInvoicedWeight; StartingInvoicedWeight + IncreaseInvoicedWeight - DecreaseInvoicedWeight)
//             {
//                 DecimalPlaces = 0 : 5;
//             }
//             column(CostPostedToGL; CostPostedToGL)
//             {
//                 AutoFormatType = 1;
//             }
//             column(InvCostPostedToGL; InvCostPostedToGL)
//             {
//                 AutoFormatType = 1;
//             }
//             column(ExpCostPostedToGL; ExpCostPostedToGL)
//             {
//                 AutoFormatType = 1;
//             }
//             column(VariantCodeCaption; VariantCodeLbl)
//             {
//             }
//             column(ShowVariant; ShowVariant)
//             {
//             }
//             column(OpenItemVariant; OpenItemVariant)
//             {
//             }
//             dataitem(ValueEntryLoop; Integer)//Table2000000026)
//             {
//                 column(VariantCode_ValueEntry; ValueEntry2VariantCode)
//                 {
//                 }
//                 column(ItemVariant_Description; ItemVariantDescription)
//                 {
//                 }
//                 column(StartingInvoicedValueVar; StartingInvoicedValueVar)
//                 {
//                     DecimalPlaces = 2 : 2;
//                 }
//                 column(StartingInvoicedQtyVar; StartingInvoicedQtyVar)
//                 {
//                     DecimalPlaces = 3 : 5;
//                 }
//                 column(StartingInvoicedWeightVar; StartingInvoicedWeightVar)
//                 {
//                 }
//                 column(IncreaseInvoicedValueVar; IncreaseInvoicedValueVar)
//                 {
//                 }
//                 column(IncreaseInvoicedQtyVar; IncreaseInvoicedQtyVar)
//                 {
//                 }
//                 column(IncreaseInvoicedWeightVar; IncreaseInvoicedWeightVar)
//                 {
//                 }
//                 column(DecreaseInvoicedValueVar; DecreaseInvoicedValueVar)
//                 {
//                 }
//                 column(DecreaseInvoicedQtyVar; DecreaseInvoicedQtyVar)
//                 {
//                 }
//                 column(DecreaseInvoicedWeightVar; DecreaseInvoicedWeightVar)
//                 {
//                 }
//                 column(EndingInvoicedValueVar; StartingInvoicedValueVar + IncreaseInvoicedValueVar - DecreaseInvoicedValueVar)
//                 {
//                 }
//                 column(EndingInvoicedQtyVar; StartingInvoicedQtyVar + IncreaseInvoicedQtyVar - DecreaseInvoicedQtyVar)
//                 {
//                 }
//                 column(EndingInvoicedWeightVar; StartingInvoicedWeightVar + IncreaseInvoicedWeightVar - DecreaseInvoicedWeightVar)
//                 {
//                 }
//                 column(CostPostedToGLVar; CostPostedToGLVar)
//                 {
//                 }
//                 column(InvCostPostedToGLVar; InvCostPostedToGLVar)
//                 {
//                     AutoFormatType = 1;
//                 }
//                 column(ExpCostPostedToGLVar; ExpCostPostedToGLVar)
//                 {
//                     AutoFormatType = 1;
//                 }
//                 column(LocationCode_ValueEntry; ValueEntry2LocationCode)
//                 {
//                 }
//                 column(Weight_ValueEntry; ValueEntry2ItemLedgerEntryWeight)
//                 {
//                 }
//                 column(CurrLocationCode; CurrLocationCode)
//                 {
//                 }
//                 column(EndingExpectedValue; StartingExpectedValue + IncreaseExpectedValue - DecreaseExpectedValue)
//                 {
//                     AutoFormatType = 1;
//                 }
//                 column(EndingExpectedQty; StartingExpectedQty + IncreaseExpectedQty - DecreaseExpectedQty)
//                 {
//                     DecimalPlaces = 0 : 5;
//                 }
//                 column(EndingExpectedWeight; StartingExpectedWeight + IncreaseExpectedWeight - DecreaseExpectedWeight)
//                 {
//                     DecimalPlaces = 0 : 5;
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     ValueEntry2VariantCode := ValueEntry2."Variant Code";
//                     ValueEntry2LocationCode := ValueEntry2."Location Code";
//                     IF NOT ItemVariant.GET(ValueEntry2."Item No.", ValueEntry2."Variant Code") THEN
//                         ItemVariant.RESET;

//                     StartingInvoicedValueVar := 0;
//                     StartingInvoicedQtyVar := 0;
//                     IncreaseInvoicedValueVar := 0;
//                     IncreaseInvoicedQtyVar := 0;
//                     DecreaseInvoicedValueVar := 0;
//                     DecreaseInvoicedQtyVar := 0;

//                     StartingExpectedValue := 0;
//                     StartingExpectedQty := 0;
//                     IncreaseExpectedValue := 0;
//                     IncreaseExpectedQty := 0;
//                     DecreaseExpectedValue := 0;
//                     DecreaseExpectedQty := 0;
//                     StartingExpectedWeight := 0;
//                     IncreaseExpectedWeight := 0;
//                     DecreaseExpectedWeight := 0;



//                     InvCostPostedToGLVar := 0;
//                     CostPostedToGLVar := 0;
//                     ExpCostPostedToGLVar := 0;
//                     StartingInvoicedWeightVar := 0;
//                     IncreaseInvoicedWeightVar := 0;
//                     DecreaseInvoicedWeightVar := 0;

//                     IF ValueEntry2."Posting Date" IN [StartDate .. EndDate] THEN BEGIN
//                         //IW.STM.9692 20200116 >
//                         //  IF (ValueEntry2."Item Ledger Entry Type" <> ValueEntry2."Item Ledger Entry Type"::Transfer)
//                         //    AND (ValueEntry2."Invoiced Quantity" > 0)
//                         IF ValueEntry2."Item Ledger Entry Type" IN [ValueEntry2."Item Ledger Entry Type"::"Positive Adjmt.",
//                                                                     ValueEntry2."Item Ledger Entry Type"::Output,
//                                                                     ValueEntry2."Item Ledger Entry Type"::"Assembly Output"]
//                         //IW.STM.9692 20200116 <
//                         THEN BEGIN
//                             IncreaseInvoicedValueVar := ValueEntry2."Cost Amount (Actual)";
//                             IncreaseInvoicedQtyVar := ValueEntry2."Invoiced Quantity";
//                            // IncreaseInvoicedWeightVar := ValueEntry2."Item Ledger Entry Weight ()";   //temp comment
//                             //IW.STM.9692 20200115 >
//                             IncreaseExpectedValue := ValueEntry2."Cost Amount (Expected)";
//                             IncreaseExpectedQty := ValueEntry2."Item Ledger Entry Quantity";
//                             //IncreaseExpectedWeight := ValueEntry2."Item Ledger Entry Weight ()";          //temp comment
//                             //IW.STM.9692 20200115 <
//                         END;
//                         //IW.STM.9692 20200116 >
//                         //  IF (ValueEntry2."Item Ledger Entry Type" <> ValueEntry2."Item Ledger Entry Type"::Transfer)
//                         //    AND (ValueEntry2."Invoiced Quantity" <= 0)
//                         IF ValueEntry2."Item Ledger Entry Type" IN [ValueEntry2."Item Ledger Entry Type"::"Negative Adjmt.",
//                                                                     ValueEntry2."Item Ledger Entry Type"::Consumption,
//                                                                     ValueEntry2."Item Ledger Entry Type"::"Assembly Consumption"]
//                         //IW.STM.9692 20200116 <
//                         THEN BEGIN
//                             DecreaseInvoicedValueVar := ValueEntry2."Cost Amount (Actual)" * -1;
//                             DecreaseInvoicedQtyVar := ValueEntry2."Invoiced Quantity" * -1;
//                            // DecreaseInvoicedWeightVar := ValueEntry2."Item Ledger Entry Weight ()" * -1;  //temp comment
//                             //IW.STM.9692 20200115 >
//                             DecreaseExpectedValue := ValueEntry2."Cost Amount (Expected)" * -1;
//                             DecreaseExpectedQty := ValueEntry2."Item Ledger Entry Quantity" * -1;
//                             //DecreaseExpectedWeight := ValueEntry2."Item Ledger Entry Weight ()" * -1;  //temp comment
//                             //IW.STM.9692 20200115 <
//                         END;
//                         //IW.STM.9692 20200116 >
//                         // IF ValueEntry2."Item Ledger Entry Type" IN [ValueEntry2."Item Ledger Entry Type"::Transfer]
//                         IF ValueEntry2."Item Ledger Entry Type" IN [ValueEntry2."Item Ledger Entry Type"::Transfer,
//                                                                     ValueEntry2."Item Ledger Entry Type"::Purchase,
//                                                                     ValueEntry2."Item Ledger Entry Type"::Sale,
//                                                                     ValueEntry2."Item Ledger Entry Type"::" "] THEN
//                             //IW.STM.9692 20200116 <
//                             IF TRUE IN [ValueEntry2."Invoiced Quantity" <= 0] THEN BEGIN //change ValueEntry  to ValueEntry2 01032020
//                                 DecreaseInvoicedValueVar := ValueEntry2."Cost Amount (Actual)" * -1;
//                                 DecreaseInvoicedQtyVar := ValueEntry2."Invoiced Quantity" * -1;
//                                 //DecreaseInvoicedWeightVar := ValueEntry2."Item Ledger Entry Weight ()" * -1;  //temp comment
//                                 //IW.STM.9692 20200115 >
//                                 DecreaseExpectedValue := ValueEntry2."Cost Amount (Expected)" * -1;
//                                 DecreaseExpectedQty := ValueEntry2."Item Ledger Entry Quantity" * -1;
//                                 //DecreaseExpectedWeight := ValueEntry2."Item Ledger Entry Weight ()" * -1;//temp comment
//                                 //IW.STM.9692 20200115 <
//                             END ELSE BEGIN
//                                 IncreaseInvoicedValueVar := ValueEntry2."Cost Amount (Actual)";
//                                 IncreaseInvoicedQtyVar := ValueEntry2."Invoiced Quantity";
//                                 //IncreaseInvoicedWeightVar := ValueEntry2."Item Ledger Entry Weight ()";//temp comment
//                                 //IW.STM.9692 20200115 >
//                                 IncreaseExpectedValue := ValueEntry2."Cost Amount (Expected)";
//                                 IncreaseExpectedQty := ValueEntry2."Item Ledger Entry Quantity";
//                                 //IncreaseExpectedWeight := ValueEntry2."Item Ledger Entry Weight ()";      //temp comment
//                                 //IW.STM.9692 20200115 <
//                             END;
//                     END ELSE BEGIN // IF ValueEntry2."Posting Date" IN [0D..StartDate]
//                         StartingInvoicedValueVar := ValueEntry2."Cost Amount (Actual)";
//                         StartingInvoicedQtyVar := ValueEntry2."Invoiced Quantity";
//                         //StartingInvoicedWeightVar := ValueEntry2."Item Ledger Entry Weight ()";   
//                         //IW.STM.9692 20200115 >
//                         StartingExpectedValue := ValueEntry2."Cost Amount (Expected)";
//                         StartingExpectedQty := ValueEntry2."Item Ledger Entry Quantity";
//                         //StartingExpectedWeight := ValueEntry2."Item Ledger Entry Weight ()";    //temp comment
//                         //IW.STM.9692 20200115 <
//                     END;

//                     ExpCostPostedToGLVar := ValueEntry2."Expected Cost Posted to G/L";
//                     InvCostPostedToGLVar := ValueEntry2."Cost Posted to G/L";
//                     CostPostedToGLVar := ExpCostPostedToGLVar + InvCostPostedToGLVar;

//                     //20200116>
//                     StartingExpectedValue += StartingInvoicedValueVar;
//                     IncreaseExpectedValue += IncreaseInvoicedValueVar;
//                     DecreaseExpectedValue += DecreaseInvoicedValueVar;
//                     //20200116<

//                     IF ValueEntry2."Variant Code" = '' THEN
//                         ItemVariantDescription := Item.Description
//                     ELSE
//                         ItemVariantDescription := ItemVariant.Description;

//                     ValueEntry2.NEXT;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     //IW.STM.9692 20200116 >
//                     // ValueEntry2.RESET;
//                     // ValueEntry2.SETRANGE("Item No.",Item."No.");
//                     // ValueEntry2.SETFILTER("Variant Code",Item."Variant Filter");
//                     // ValueEntry2.SETFILTER("Location Code",Item."Location Filter");
//                     // ValueEntry2.SETFILTER("Global Dimension 1 Code",Item."Global Dimension 1 Filter");
//                     // ValueEntry2.SETFILTER("Global Dimension 2 Code",Item."Global Dimension 2 Filter");
//                     // ValueEntry2.SETRANGE("Posting Date",0D,EndDate);
//                     // IF OpenItemVariant THEN
//                     //  ValueEntry2.SETCURRENTKEY("Item No.","Variant Code","Location Code")
//                     // ELSE
//                     //  ValueEntry2.SETCURRENTKEY("Item No.","Location Code");
//                     //IW.STM.9692 20200116 <


//                     IF ValueEntry2.FINDSET THEN
//                         ValueEntryLoop.SETRANGE(Number, 1, ValueEntry2.COUNT)
//                     ELSE
//                         CurrReport.BREAK;

//                     ShowVariant := TRUE;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 ItemNo: Code[20];
//             begin
//                 CALCFIELDS("Assembly BOM");

//                 IF EndDate = 0D THEN
//                     EndDate := DMY2DATE(31, 12, 9999);

//                 StartingInvoicedValue := 0;
//                 StartingInvoicedQty := 0;
//                 IncreaseInvoicedValue := 0;
//                 IncreaseInvoicedQty := 0;
//                 DecreaseInvoicedValue := 0;
//                 DecreaseInvoicedQty := 0;

//                 StartingExpectedValue := 0;
//                 StartingExpectedQty := 0;
//                 IncreaseExpectedValue := 0;
//                 IncreaseExpectedQty := 0;
//                 DecreaseExpectedValue := 0;
//                 DecreaseExpectedQty := 0;


//                 InvCostPostedToGL := 0;
//                 CostPostedToGL := 0;
//                 ExpCostPostedToGL := 0;
//                 //IW.STM.9692 >
//                 StartingExpectedWeight := 0;
//                 IncreaseExpectedWeight := 0;
//                 DecreaseExpectedWeight := 0;
//                 StartingInvoicedWeight := 0;
//                 IncreaseInvoicedWeight := 0;
//                 DecreaseInvoicedWeight := 0;
//                 //IW.STM.9692 <

//                 IsEmptyLine := TRUE;
//                 ValueEntry.RESET;
//                 ValueEntry.SETRANGE("Item No.", "No.");
//                 ValueEntry.SETFILTER("Variant Code", GETFILTER("Variant Filter"));
//                 ValueEntry.SETFILTER("Location Code", GETFILTER("Location Filter"));
//                 ValueEntry.SETFILTER("Global Dimension 1 Code", GETFILTER("Global Dimension 1 Filter"));
//                 ValueEntry.SETFILTER("Global Dimension 2 Code", GETFILTER("Global Dimension 2 Filter"));

//                 IF StartDate > 0D THEN BEGIN
//                     ValueEntry.SETRANGE("Posting Date", 0D, CALCDATE('<-1D>', StartDate));
//                     ValueEntry.CALCSUMS("Item Ledger Entry Quantity", "Cost Amount (Actual)", "Cost Amount (Expected)", "Invoiced Quantity", "Item Ledger Entry Weight ()");
//                     AssignAmounts(ValueEntry, StartingInvoicedValue, StartingInvoicedQty, StartingInvoicedWeight, StartingExpectedValue, StartingExpectedQty, StartingExpectedWeight, 1);
//                     IsEmptyLine := IsEmptyLine AND ((StartingInvoicedValue = 0) AND (StartingInvoicedQty = 0) AND (StartingInvoicedWeight = 0));
//                     IF ShowExpected THEN
//                         IsEmptyLine := IsEmptyLine AND ((StartingExpectedValue = 0) AND (StartingExpectedQty = 0) AND (StartingExpectedWeight = 0));
//                 END;

//                 ValueEntry.SETRANGE("Posting Date", StartDate, EndDate);
//                 ValueEntry.SETFILTER(
//                   "Item Ledger Entry Type", '%1|%2|%3|%4',
//                   ValueEntry."Item Ledger Entry Type"::Purchase,
//                   ValueEntry."Item Ledger Entry Type"::"Positive Adjmt.",
//                   ValueEntry."Item Ledger Entry Type"::Output,
//                   ValueEntry."Item Ledger Entry Type"::"Assembly Output");
//                 ValueEntry.CALCSUMS("Item Ledger Entry Quantity", "Cost Amount (Actual)", "Cost Amount (Expected)", "Invoiced Quantity", "Item Ledger Entry Weight ()");
//                 AssignAmounts(ValueEntry, IncreaseInvoicedValue, IncreaseInvoicedQty, IncreaseInvoicedWeight, IncreaseExpectedValue, IncreaseExpectedQty, IncreaseExpectedWeight, 1);

//                 ValueEntry.SETRANGE("Posting Date", StartDate, EndDate);
//                 ValueEntry.SETFILTER(
//                   "Item Ledger Entry Type", '%1|%2|%3|%4',
//                   ValueEntry."Item Ledger Entry Type"::Sale,
//                   ValueEntry."Item Ledger Entry Type"::"Negative Adjmt.",
//                   ValueEntry."Item Ledger Entry Type"::Consumption,
//                   ValueEntry."Item Ledger Entry Type"::"Assembly Consumption");
//                 ValueEntry.CALCSUMS("Item Ledger Entry Quantity", "Cost Amount (Actual)", "Cost Amount (Expected)", "Invoiced Quantity", "Item Ledger Entry Weight ()");
//                 AssignAmounts(ValueEntry, DecreaseInvoicedValue, DecreaseInvoicedQty, DecreaseInvoicedWeight, DecreaseExpectedValue, DecreaseExpectedQty, DecreaseExpectedWeight, -1);

//                 ValueEntry.SETRANGE("Posting Date", StartDate, EndDate);
//                 ValueEntry.SETRANGE("Item Ledger Entry Type", ValueEntry."Item Ledger Entry Type"::Transfer);
//                 IF ValueEntry.FINDSET THEN
//                     REPEAT
//                         //20191204>
//                         //IF TRUE IN [ValueEntry."Valued Quantity" < 0,NOT GetOutboundItemEntry(ValueEntry."Item Ledger Entry No.")] THEN
//                         IF TRUE IN [ValueEntry."Invoiced Quantity" <= 0] THEN
//                             //20191204<
//                             AssignAmounts(ValueEntry, DecreaseInvoicedValue, DecreaseInvoicedQty, DecreaseInvoicedWeight, DecreaseExpectedValue, DecreaseExpectedQty, DecreaseExpectedWeight, -1)
//                         ELSE
//                             AssignAmounts(ValueEntry, IncreaseInvoicedValue, IncreaseInvoicedQty, IncreaseInvoicedWeight, IncreaseExpectedValue, IncreaseExpectedQty, IncreaseExpectedWeight, 1);
//                     UNTIL ValueEntry.NEXT = 0;

//                 IsEmptyLine := IsEmptyLine AND ((IncreaseInvoicedValue = 0) AND (IncreaseInvoicedQty = 0) AND (IncreaseInvoicedWeight = 0));
//                 IsEmptyLine := IsEmptyLine AND ((DecreaseInvoicedValue = 0) AND (DecreaseInvoicedQty = 0) AND (DecreaseInvoicedWeight = 0));
//                 IF ShowExpected THEN BEGIN
//                     IsEmptyLine := IsEmptyLine AND ((IncreaseExpectedValue = 0) AND (IncreaseExpectedQty = 0) AND (IncreaseExpectedValue = 0));
//                     IsEmptyLine := IsEmptyLine AND ((DecreaseExpectedValue = 0) AND (DecreaseExpectedQty = 0) AND (DecreaseExpectedWeight = 0));
//                 END;

//                 ValueEntry.SETRANGE("Posting Date", 0D, EndDate);
//                 ValueEntry.SETRANGE("Item Ledger Entry Type");
//                 IF ValueEntry.FINDSET THEN
//                     ValueEntry.CALCSUMS("Cost Posted to G/L", "Expected Cost Posted to G/L");
//                 ExpCostPostedToGL += ValueEntry."Expected Cost Posted to G/L";
//                 InvCostPostedToGL += ValueEntry."Cost Posted to G/L";

//                 //IW.STM.9692 >
//                 StartingExpectedWeight += StartingInvoicedWeight;
//                 IncreaseExpectedWeight += IncreaseInvoicedWeight;
//                 DecreaseExpectedWeight += DecreaseInvoicedWeight;
//                 //IW.STM.9692 <
//                 StartingExpectedValue += StartingInvoicedValue;
//                 IncreaseExpectedValue += IncreaseInvoicedValue;
//                 DecreaseExpectedValue += DecreaseInvoicedValue;
//                 CostPostedToGL := ExpCostPostedToGL + InvCostPostedToGL;

//                 //MESSAGE('%1 %2 %3 %4 %5 %6',ValueEntry2."Item Ledger Entry Type", ValueEntry."Item Ledger Entry Type", ValueEntry."Cost Amount (Actual)", ValueEntry."Invoiced Quantity", ValueEntry."Item Ledger Entry Weight ()");

//                 //IW.STM.9692 20191227>
//                 // IF IsEmptyLine THEN
//                 //  CurrReport.SKIP;
//                 //IW.STM.9692 20191227<

//                 ItemNo := Item."No.";

//                 //IW.STM.9692 20200116 >
//                 ValueEntry2.RESET;
//                 ValueEntry2.SETRANGE("Item No.", Item."No.");
//                 ValueEntry2.SETFILTER("Variant Code", Item.GETFILTER("Variant Filter")); // 18.02.2020 VIP
//                 ValueEntry2.SETFILTER("Location Code", Item.GETFILTER("Location Filter")); // 18.02.2020 VIP
//                 ValueEntry2.SETFILTER("Global Dimension 1 Code", Item."Global Dimension 1 Filter");
//                 ValueEntry2.SETFILTER("Global Dimension 2 Code", Item."Global Dimension 2 Filter");
//                 ValueEntry2.SETRANGE("Posting Date", 0D, EndDate);
//                 IF OpenItemVariant THEN
//                     ValueEntry2.SETCURRENTKEY("Item No.", "Variant Code", "Location Code")
//                 ELSE
//                     ValueEntry2.SETCURRENTKEY("Item No.", "Location Code");

//                 IF ValueEntry2.ISEMPTY THEN
//                     CurrReport.SKIP;
//                 //IW.STM.9692 20200116 <
//             end;

//             trigger OnPostDataItem()
//             begin
//                 //IW.STM.9692 >
//                 // IF IsEmptyLine THEN
//                 //  CurrReport.SKIP;
//                 //IW.STM.9692 <
//             end;

//             trigger OnPreDataItem()
//             begin
//                 CurrReport.CREATETOTALS(
//                   StartingExpectedQty, IncreaseExpectedQty, DecreaseExpectedQty,
//                   StartingInvoicedQty, IncreaseInvoicedQty, DecreaseInvoicedQty);
//                 CurrReport.CREATETOTALS(
//                   StartingExpectedValue, IncreaseExpectedValue, DecreaseExpectedValue,
//                   StartingInvoicedValue, IncreaseInvoicedValue, DecreaseInvoicedValue,
//                   CostPostedToGL, ExpCostPostedToGL, InvCostPostedToGL);
//                 //IW.STM.9692 >
//                 CurrReport.CREATETOTALS(
//                   StartingExpectedWeight, IncreaseExpectedWeight, DecreaseExpectedWeight,
//                   StartingInvoicedWeight, IncreaseInvoicedWeight, DecreaseInvoicedWeight,
//                   CostPostedToGLVar, ExpCostPostedToGLVar, InvCostPostedToGLVar);
//                 //IW.STM.9692 <
//             end;
//         }
//     }

//     requestpage
//     {
//         SaveValues = true;

//         layout
//         {
//             area(content)
//             {
//                 group(Optionen)
//                 {
//                     Caption = 'Options';
//                     field(StartingDate; StartDate)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Starting Date';
//                         ToolTip = 'Specifies the date from which the report or batch job processes information.';
//                     }
//                     field(EndingDate; EndDate)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Ending Date';
//                         ToolTip = 'Specifies the date to which the report or batch job processes information.';
//                     }
//                     field(IncludeExpectedCost; ShowExpected)
//                     {
//                         ApplicationArea = Basic, Suite;
//                         Caption = 'Include Expected Cost';
//                         ToolTip = 'Specifies if you want the report to also show entries that only have expected costs.';
//                     }
//                     field(OpenItemVariant; OpenItemVariant)
//                     {
//                         Caption = 'Include Variants Overview';
//                     }
//                 }
//             }
//         }

//         actions
//         {
//         }

//         trigger OnOpenPage()
//         begin
//             IF (StartDate = 0D) AND (EndDate = 0D) THEN
//                 EndDate := WORKDATE;
//         end;
//     }

//     labels
//     {
//         Inventory_Posting_Group_NameCaption = 'Inventory Posting Group Name';
//         Expected_CostCaption = 'Expected Cost';
//     }

//     trigger OnPreReport()
//     begin
//         IF (StartDate = 0D) AND (EndDate = 0D) THEN
//             EndDate := WORKDATE;

//         IF StartDate IN [0D, 01010000D] THEN
//             StartDateText := ''
//         ELSE
//             StartDateText := FORMAT(StartDate - 1);

//         ItemFilter := Item.GETFILTERS;
//     end;

//     var
//         Text005: Label 'As of %1';
//         ValueEntry: Record 5802;
//         ClientTypeManagement: Codeunit "Client Type Management";// 4;
//         StartDate: Date;
//         EndDate: Date;
//         ShowExpected: Boolean;
//         ItemFilter: Text;
//         StartDateText: Text[10];
//         StartingInvoicedWeight: Decimal;
//         StartingExpectedWeight: Decimal;
//         StartingInvoicedValue: Decimal;
//         StartingExpectedValue: Decimal;
//         StartingInvoicedQty: Decimal;
//         StartingExpectedQty: Decimal;
//         IncreaseInvoicedWeight: Decimal;
//         IncreaseExpectedWeight: Decimal;
//         IncreaseInvoicedValue: Decimal;
//         IncreaseExpectedValue: Decimal;
//         IncreaseInvoicedQty: Decimal;
//         IncreaseExpectedQty: Decimal;
//         DecreaseInvoicedWeight: Decimal;
//         DecreaseExpectedWeight: Decimal;
//         DecreaseInvoicedValue: Decimal;
//         DecreaseExpectedValue: Decimal;
//         DecreaseInvoicedQty: Decimal;
//         DecreaseExpectedQty: Decimal;
//         BoM_TextLbl: Label 'Base UoM';
//         Inventory_ValuationCaptionLbl: Label 'Inventory Valuation';
//         CurrReport_PAGENOCaptionLbl: Label 'Page';
//         This_report_includes_entries_that_have_been_posted_with_expected_costs_CaptionLbl: Label 'This report includes entries that have been posted with expected costs.';
//         IncreaseInvoicedQtyCaptionLbl: Label 'Increases (LCY)';
//         DecreaseInvoicedQtyCaptionLbl: Label 'Decreases (LCY)';
//         QuantityCaptionLbl: Label 'Quantity';
//         ValueCaptionLbl: Label 'Value';
//         QuantityCaption_Control31Lbl: Label 'Quantity';
//         QuantityCaption_Control40Lbl: Label 'Quantity';
//         InvCostPostedToGL_Control53CaptionLbl: Label 'Cost Posted to G/L';
//         QuantityCaption_Control58Lbl: Label 'Quantity';
//         TotalCaptionLbl: Label 'Total';
//         Expected_Cost_Included_TotalCaptionLbl: Label 'Expected Cost Included Total';
//         Expected_Cost_TotalCaptionLbl: Label 'Expected Cost Total';
//         Expected_Cost_IncludedCaptionLbl: Label 'Expected Cost Included';
//         InvCostPostedToGL: Decimal;
//         CostPostedToGL: Decimal;
//         ExpCostPostedToGL: Decimal;
//         IsEmptyLine: Boolean;
//         FirstData: Boolean;
//         ValueEntryFilter: Text;
//         StartingInvoicedWeightVar: Decimal;
//         StartingInvoicedValueVar: Decimal;
//         StartingInvoicedQtyVar: Decimal;
//         IncreaseInvoicedWeightVar: Decimal;
//         IncreaseInvoicedValueVar: Decimal;
//         IncreaseInvoicedQtyVar: Decimal;
//         DecreaseInvoicedWeightVar: Decimal;
//         DecreaseInvoicedValueVar: Decimal;
//         DecreaseInvoicedQtyVar: Decimal;
//         InvCostPostedToGLVar: Decimal;
//         CostPostedToGLVar: Decimal;
//         ExpCostPostedToGLVar: Decimal;
//         ShowVariant: Boolean;
//         OpenItemVariant: Boolean;
//         VariantCodeLbl: Label 'Variant Code';
//         ItemVariant: Record 5401;
//         LocationCodeLbl: Label 'Location Code';
//         VariantNoLbl: Label 'Variant No.';
//         WeightLbl1: Label 'Weight';
//         WeightLbl2: Label 'Weight';
//         WeightLbl3: Label 'Weight';
//         WeightLbl4: Label 'Weight';
//         ItemVariantDescription: Text[50];
//         ValueEntry2: Record 5802;
//         ValueEntry2LocationCode: Code[10];
//         ValueEntry2VariantCode: Code[10];
//         ValueEntry2ItemLedgerEntryWeight: Decimal;
//         CurrLocationCode: Code[10];
//         CurrLocationCode2: Code[10];
//         CurrVariantCode2: Code[10];
//         CurrVariantCode: Code[10];
//         NoValueEntriesPerPeriod: Boolean;

//     local procedure AssignAmounts(ValueEntry: Record 5802; var InvoicedValue: Decimal; var InvoicedQty: Decimal; var InvoicedWeight: Decimal; var ExpectedValue: Decimal; var ExpectedQty: Decimal; var ExpectedWeight: Decimal; Sign: Decimal)
//     begin
//         InvoicedValue += ValueEntry."Cost Amount (Actual)" * Sign;
//         InvoicedQty += ValueEntry."Invoiced Quantity" * Sign;
//         ExpectedValue += ValueEntry."Cost Amount (Expected)" * Sign;
//         ExpectedQty += ValueEntry."Item Ledger Entry Quantity" * Sign;
//         //IW.STM.9692 >
//         // InvoicedWeight += ValueEntry."Item Ledger Entry Weight ()" * Sign;   //temp comment
//         // ExpectedWeight += ValueEntry."Item Ledger Entry Weight ()" * Sign;   //temp comment
//         //IW.STM.9692 <
//     end;

//     local procedure GetOutboundItemEntry(ItemLedgerEntryNo: Integer): Boolean
//     var
//         ItemApplnEntry: Record 339;
//         ItemLedgEntry: Record 32;
//     begin
//         ItemApplnEntry.SETCURRENTKEY("Item Ledger Entry No.");
//         ItemApplnEntry.SETRANGE("Item Ledger Entry No.", ItemLedgerEntryNo);
//         IF NOT ItemApplnEntry.FINDFIRST THEN
//             EXIT(TRUE);

//         ItemLedgEntry.SETRANGE("Item No.", Item."No.");
//         ItemLedgEntry.SETFILTER("Variant Code", Item.GETFILTER("Variant Filter"));
//         ItemLedgEntry.SETFILTER("Location Code", Item.GETFILTER("Location Filter"));
//         ItemLedgEntry.SETFILTER("Global Dimension 1 Code", Item.GETFILTER("Global Dimension 1 Filter"));
//         ItemLedgEntry.SETFILTER("Global Dimension 2 Code", Item.GETFILTER("Global Dimension 2 Filter"));
//         ItemLedgEntry."Entry No." := ItemApplnEntry."Outbound Item Entry No.";
//         EXIT(NOT ItemLedgEntry.FIND);
//     end;

//     [Scope('Internal')]
//     procedure SetStartDate(DateValue: Date)
//     begin
//         StartDate := DateValue;
//     end;

//     [Scope('Internal')]
//     procedure SetEndDate(DateValue: Date)
//     begin
//         EndDate := DateValue;
//     end;

//     [Scope('Internal')]
//     procedure InitializeRequest(NewStartDate: Date; NewEndDate: Date; NewShowExpected: Boolean)
//     begin
//         StartDate := NewStartDate;
//         EndDate := NewEndDate;
//         ShowExpected := NewShowExpected;
//     end;

//     local procedure GetUrlForReportDrilldown(ItemNumber: Code[20]): Text
//     begin
//         // Generates a URL to the report which sets tab "Item" and field "Field1" on the request page, such as
//         // dynamicsnav://hostname:port/instance/company/runreport?report=5801<&Tenant=tenantId>&filter=Item.Field1:1100.
//         // TODO
//         // Eventually leverage parameters 5 and 6 of GETURL by adding ",Item,TRUE)" and
//         // use filter Item.SETFILTER("No.",'=%1',ItemNumber);.
//         EXIT(GETURL(ClientTypeManagement.GetCurrentClientType, COMPANYNAME, OBJECTTYPE::Report, REPORT::"Invt. Valuation - Cost Spec.") +
//           STRSUBSTNO('&filter=Item.Field1:%1', ItemNumber));
//     end;

//     local procedure GroupIsChanged(): Boolean
//     begin
//         //20191129
//         IF OpenItemVariant THEN
//             EXIT(
//               ((StartDate <> 0D) AND FirstData) OR
//               ((StartDate <> 0D) AND NOT FirstData AND
//               ((ValueEntry2."Variant Code" <> CurrVariantCode) OR (ValueEntry2."Location Code" <> CurrLocationCode))))
//         ELSE
//             EXIT(
//               ((StartDate <> 0D) AND FirstData) OR
//               ((StartDate <> 0D) AND NOT FirstData AND
//               (ValueEntry2."Location Code" <> CurrLocationCode)))
//     end;
// }

