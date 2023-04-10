codeunit 50600 "Sales Order to Sales quotes"
{
    //for create item specification
    trigger OnRun()
    begin
    end;
    //Codeunit 86 start
    //[IntegrationEvent(false, false)]
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Quote to Order", 'OnAfterInsertSalesOrderLine', '', true, true)]
    local procedure OnAfterInsertSalesOrderLine(var SalesOrderLine: Record "Sales Line"; SalesOrderHeader: Record "Sales Header"; SalesQuoteLine: Record "Sales Line"; SalesQuoteHeader: Record "Sales Header")
    begin
        SalesQuoteLine.Reset();
        SalesQuoteLine.SetRange("Document No.", SalesQuoteHeader."No.");
        SalesQuoteLine.SetRange("Document Type", SalesQuoteHeader."Document Type");
        if SalesQuoteLine.FindSet() then
            repeat
                ItemSpecification.Reset();
                //ItemSpecification.SetRange("REDM Document Type", SalesQuoteLine."Document Type");
                ItemSpecification.SetRange("REDM Document No.", SalesQuoteLine."Document No.");
                ItemSpecification.SetRange("REDM Line No.", SalesQuoteLine."Line No.");
                if ItemSpecification.FindSet() then
                    repeat
                        SaleQItemSpecs.Init();
                        SaleQItemSpecs.Validate("REDM Document Type", SalesOrderHeader."Document Type");
                        SaleQItemSpecs.Validate("REDM Document No.", SalesOrderHeader."No.");
                        SaleQItemSpecs.Validate("REDM Line No.", ItemSpecification."REDM Line No.");
                        SaleQItemSpecs.Validate("REDM Parameter Code", ItemSpecification."REDM Parameter Code");
                        SaleQItemSpecs.Validate("REDM Parameter Description", ItemSpecification."REDM Parameter Description");
                        SaleQItemSpecs.Validate("REDM Parameter UOM", ItemSpecification."REDM Parameter UOM");
                        SaleQItemSpecs.Validate("REDM Guaranteed Value", ItemSpecification."REDM Guaranteed Value");
                        SaleQItemSpecs.Validate("REDM Rejected Value", ItemSpecification."REDM Rejected Value");
                        SaleQItemSpecs.Validate("REDM Additional Description", ItemSpecification."REDM Additional Description");
                        SaleQItemSpecs.Insert();

                    until ItemSpecification.Next() = 0;
            until SalesQuoteLine.Next() = 0;
    end;
    //Codeunit 86 end

    //Codeunit 22 start
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertValueEntry', '', true, true)]
    local procedure OnBeforeInsertValueEntry(var ValueEntry: Record "Value Entry"; ItemJournalLine: Record "Item Journal Line"; var ItemLedgerEntry: Record "Item Ledger Entry"; var ValueEntryNo: Integer; var InventoryPostingToGL: Codeunit "Inventory Posting To G/L"; CalledFromAdjustment: Boolean; var OldItemLedgEntry: Record "Item Ledger Entry"; var Item: Record Item; TransferItem: Boolean; var GlobalValueEntry: Record "Value Entry")
    begin
        //ValueEntry."Currency Code" := ItemJournalLine.currenc
    end;
    //Codeunit 22 end

    //Table 83 start
    // [IntegrationEvent(false, false)]
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromPurchHeader', '', true, true)]
    local procedure OnAfterCopyItemJnlLineFromPurchHeader(var ItemJnlLine: Record "Item Journal Line"; PurchHeader: Record "Purchase Header")
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromPurchLine', '', true, true)]
    local procedure OnAfterCopyItemJnlLineFromPurchLine(var ItemJnlLine: Record "Item Journal Line"; PurchLine: Record "Purchase Line")
    begin
    end;

    //[IntegrationEvent(false, false)]
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesHeader', '', true, true)]
    local procedure OnAfterCopyItemJnlLineFromSalesHeader(var ItemJnlLine: Record "Item Journal Line"; SalesHeader: Record "Sales Header")
    begin
    end;

    //[IntegrationEvent(false, false)]
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesLine', '', true, true)]
    local procedure OnAfterCopyItemJnlLineFromSalesLine(var ItemJnlLine: Record "Item Journal Line"; SalesLine: Record "Sales Line")
    begin
    end;
    //Table 83 end    

    //Report 1304 Start
    //[IntegrationEvent(false, false)]
    // [EventSubscriber(ObjectType::Report, Report::"Standard Sales - Quote", 'OnAfterSetLanguage', '', true, true)]
    // local procedure OnAfterSetLanguage()
    // var
    //     SdSalesQuotes: Report "Standard Sales - Quote";
    //     Language: Codeunit Language;
    // begin
    //     //CurrReport.Language := Language.GetLanguageIdOrDefault(LanguageCode);
    //     SdSalesQuotes.Language := Language.GetLanguageIdOrDefault('ENU');
    //     Message(Format(SdSalesQuotes.Language));
    // end;

    // // [IntegrationEvent(false, false)]
    // [EventSubscriber(ObjectType::Report, Report::"Standard Sales - Quote", 'OnAfterFormatDocumentFields', '', true, true)]
    // local procedure OnAfterFormatDocumentFields(var SalesHeader: Record "Sales Header")
    // var
    //     FormatDocument: Codeunit "Format Document";
    //     ShipmentMethod: Record "Shipment Method";
    //     PaymentTerms: Record "Payment Terms";
    //     PaymentMethod: Record "Payment Method";
    // begin
    //     FormatDocument.SetPaymentTerms(PaymentTerms, SalesHeader."Payment Terms Code", 'ENU');
    //     FormatDocument.SetPaymentMethod(PaymentMethod, SalesHeader."Payment Method Code", 'ENU');
    //     FormatDocument.SetShipmentMethod(ShipmentMethod, SalesHeader."Shipment Method Code", 'ENU');
    // end;
    // //Report 1304 end

    var
        myInt: Integer;
        ItemSpecification: Record 50122;
        SaleQItemSpecs: Record 50122;
}