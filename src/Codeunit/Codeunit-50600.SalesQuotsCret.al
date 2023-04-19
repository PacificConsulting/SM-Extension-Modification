codeunit 50600 "Sales Order to Sales quotes"
{
    //for create item specification
    trigger OnRun()
    begin
    end;
    //Codeunit 86 start
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
        ValueEntry."Currency Code" := ItemJournalLine."Currency Code";
        ValueEntry."Tarrif code" := ItemJournalLine."Tarrif Code";
        ValueEntry."VAT Registration No." := ItemJournalLine."VAT Registration No.";
        ValueEntry."Transport Method" := ItemJournalLine."Transport Method";
        ValueEntry."VAT Transaction Type" := ItemJournalLine."VAT Transaction Type";
        ValueEntry."Own Vat Account No." := ItemJournalLine."Own VAT Account No.";
        ValueEntry."Number Of Units" := ItemLedgerEntry."No.Of Units";
        ValueEntry.Thickness := ItemLedgerEntry."REDM Thickness";
        ValueEntry."Length (MM)" := ItemLedgerEntry."REDM Length (MM)";
        ValueEntry."Width (MM)" := ItemLedgerEntry."REDM Width (MM)";
        ValueEntry.Diameter := ItemLedgerEntry."REDM Diameter";
        ValueEntry."Profile Code" := ItemLedgerEntry."REDM Profile Code";
    end;
    //Codeunit 22 end

    //Table 83 start    
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromPurchHeader', '', true, true)]
    local procedure OnAfterCopyItemJnlLineFromPurchHeader(var ItemJnlLine: Record "Item Journal Line"; PurchHeader: Record "Purchase Header")
    begin
        ItemJnlLine."Currency Code" := PurchHeader."Currency Code";
        ItemJnlLine."VAT Registration No." := PurchHeader."VAT Registration No.";
        ItemJnlLine."Own VAT Account No." := PurchHeader."REDM OWN VAT Account No.";
        ItemJnlLine."Transport Method" := PurchHeader."Transport Method";
        ItemJnlLine."VAT Transaction Type" := PurchHeader."REDM Transaction Type";

    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromPurchLine', '', true, true)]
    local procedure OnAfterCopyItemJnlLineFromPurchLine(var ItemJnlLine: Record "Item Journal Line"; PurchLine: Record "Purchase Line")
    begin
        ItemJnlLine."Tarrif Code" := PurchLine."REDM Tariff Code";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesHeader', '', true, true)]
    local procedure OnAfterCopyItemJnlLineFromSalesHeader(var ItemJnlLine: Record "Item Journal Line"; SalesHeader: Record "Sales Header")
    begin
        ItemJnlLine."Currency Code" := SalesHeader."Currency Code";
        ItemJnlLine."VAT Registration No." := SalesHeader."VAT Registration No.";
        ItemJnlLine."Own VAT Account No." := SalesHeader."REDM OWN VAT Account No.";
        ItemJnlLine."Transport Method" := SalesHeader."Transport Method";
        ItemJnlLine."VAT Transaction Type" := Format(SalesHeader."REDM Transaction Type");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesLine', '', true, true)]
    local procedure OnAfterCopyItemJnlLineFromSalesLine(var ItemJnlLine: Record "Item Journal Line"; SalesLine: Record "Sales Line")
    begin
        ItemJnlLine."Tarrif Code" := SalesLine."REDM Tariff Code";
    end;
    //Table 83 end 

    //Codeunit 12 start
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostBankAccOnBeforeBankAccLedgEntryInsert', '', true, true)]
    local procedure OnPostBankAccOnBeforeBankAccLedgEntryInsert(var BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line"; BankAccount: Record "Bank Account"; var TempGLEntryBuf: Record "G/L Entry" temporary; var NextTransactionNo: Integer; GLRegister: Record "G/L Register")
    var
        GenjnlL: Record 81;
    begin
        GenjnlL.Reset();
        GenjnlL.SetRange("Journal Batch Name", GenJournalLine."Journal Batch Name");
        GenjnlL.SetRange("Journal Template Name", GenJournalLine."Journal Template Name");
        GenjnlL.SetRange("Line No.", GenJournalLine."Line No.");
        if GenjnlL.FindFirst() then;
        BankAccountLedgerEntry."Gen. Prod. Posting Group" := GenjnlL."Gen. Prod. Posting Group";
    end;
    //Codeunit 12 end 

    // //Codeunit 90 Start
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPurchInvHeaderInsert', '', true, true)]
    // local procedure OnAfterPurchInvHeaderInsert(var PurchInvHeader: Record "Purch. Inv. Header"; var PurchHeader: Record "Purchase Header"; PreviewMode: Boolean)
    // begin
    //     PurchHeader.CalcFields(Amount);
    //     if PurchHeader."Currency Factor" <> 0 then
    //         PurchInvHeader."Invoice Amount(LCY)" := PurchHeader.Amount / PurchHeader."Currency Factor";
    //     Message(Format(PurchInvHeader."Invoice Amount(LCY)"));

    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchCrMemoHeaderInsert', '', true, true)]
    // local procedure OnBeforePurchCrMemoHeaderInsert(var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; var PurchHeader: Record "Purchase Header"; CommitIsSupressed: Boolean)
    // begin
    //     PurchHeader.CalcFields(Amount);
    //     if PurchHeader."Currency Factor" <> 0 then
    //         PurchCrMemoHdr."Invoice Amount(LCY)" := PurchHeader.Amount / PurchHeader."Currency Factor";
    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPurchInvLineInsert', '', true, true)]
    local procedure OnAfterPurchInvLineInsert(var PurchInvLine: Record "Purch. Inv. Line"; PurchInvHeader: Record "Purch. Inv. Header"; PurchLine: Record "Purchase Line"; ItemLedgShptEntryNo: Integer; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSupressed: Boolean; PurchHeader: Record "Purchase Header"; PurchRcptHeader: Record "Purch. Rcpt. Header"; TempWhseRcptHeader: Record "Warehouse Receipt Header")
    begin
        PurchInvHeader."Invoice Amount(LCY)" += PurchInvLine.Amount / PurchInvHeader."Currency Factor";
        PurchInvHeader.Modify();
        Message(Format(PurchInvHeader."Invoice Amount(LCY)"));
    end;
    // //Codeunit 90 End


    // //Codeunit 80 Start

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', true, true)]
    local procedure OnAfterSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line"; SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line"; ItemLedgShptEntryNo: Integer; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSuppressed: Boolean; var SalesHeader: Record "Sales Header"; var TempItemChargeAssgntSales: Record "Item Charge Assignment (Sales)" temporary; var TempWhseShptHeader: Record "Warehouse Shipment Header" temporary; var TempWhseRcptHeader: Record "Warehouse Receipt Header" temporary; PreviewMode: Boolean)
    begin
        SalesInvHeader."Invoice Amount(LCY)" += SalesInvLine.Amount / SalesInvHeader."Currency Factor";
        SalesInvHeader.Modify();
        Message(Format(SalesInvHeader."Invoice Amount(LCY)"));
    end;


    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesCrMemoHeaderInsert', '', true, true)]
    // local procedure OnBeforeSalesCrMemoHeaderInsert(var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; var IsHandled: Boolean; var SalesInvHeader: Record "Sales Invoice Header")
    // begin
    //     SalesHeader.CalcFields(Amount);
    //     if SalesHeader."Currency Factor" <> 0 then
    //         SalesCrMemoHeader."Invoice Amount(LCY)" := SalesHeader.Amount / SalesHeader."Currency Factor";
    // end;
    // //Codeunit 80 End
    var
        myInt: Integer;
        ItemSpecification: Record 50122;
        SaleQItemSpecs: Record 50122;
}