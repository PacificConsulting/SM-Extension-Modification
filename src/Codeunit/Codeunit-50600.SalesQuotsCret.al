codeunit 50600 "Sales Order to Sales quotes"
{
    Permissions = tabledata 112 = RM, tabledata 114 = RM, tabledata 122 = RM, tabledata 124 = RM;

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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', true, true)]
    local procedure OnBeforeInsertItemLedgEntry(var ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; TransferItem: Boolean; OldItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLineOrigin: Record "Item Journal Line")
    begin
        ItemLedgerEntry."Vessel Code" := ItemJournalLine."Vessel Code";
        ItemLedgerEntry."Country of Origin" := ItemJournalLine."Country of Origin";
        ItemLedgerEntry."Country of final Destination" := ItemJournalLine."Country of final Destination";
        ItemLedgerEntry."Destination Country" := ItemJournalLine."Destination Country";
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
        ItemJnlLine."Vessel Code" := PurchHeader."REDM Vessel Code";
        ItemJnlLine."Country of Origin" := PurchHeader."REDM Country of Origin";
        ItemJnlLine."Country of final Destination" := PurchHeader."REDM Country of final destinat";
        ItemJnlLine."Destination Country" := PurchHeader."REDM Destination Country";
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
        ItemJnlLine."Vessel Code" := SalesHeader."REDM Vessel Code";
        ItemJnlLine."Country of Origin" := SalesHeader."REDM Country of Origin";
        ItemJnlLine."Country of final Destination" := SalesHeader."REDM Country of final dest";
        ItemJnlLine."Destination Country" := SalesHeader."REDM Destination Country";
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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeVendLedgEntryInsert', '', true, true)]
    local procedure OnBeforeVendLedgEntryInsert(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line"; GLRegister: Record "G/L Register")
    begin
        VendorLedgerEntry."Country of Origin" := GenJournalLine."Country of Origin";
        VendorLedgerEntry."Country of final Destination" := GenJournalLine."Country of final Destination";
        VendorLedgerEntry."Destination Country" := GenJournalLine."Destination Country";
        VendorLedgerEntry."Vessel Code" := GenJournalLine."Vessel Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeCustLedgEntryInsert', '', true, true)]
    local procedure OnBeforeCustLedgEntryInsert(var CustLedgerEntry: Record "Cust. Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line"; GLRegister: Record "G/L Register"; var TempDtldCVLedgEntryBuf: Record "Detailed CV Ledg. Entry Buffer"; var NextEntryNo: Integer)
    begin
        CustLedgerEntry."Country of Origin" := GenJournalLine."Country of Origin";
        CustLedgerEntry."Country of final Destination" := GenJournalLine."Country of final Destination";
        CustLedgerEntry."Destination Country" := GenJournalLine."Destination Country";
        CustLedgerEntry."Vessel Code" := GenJournalLine."Vessel Code";
    end;
    //Codeunit 12 end 

    // //Codeunit 90 Start
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', true, true)]
    procedure OnAfterPostPurchaseDoc(var PurchaseHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PurchRcpHdrNo: Code[20]; RetShptHdrNo: Code[20]; PurchInvHdrNo: Code[20]; PurchCrMemoHdrNo: Code[20]; CommitIsSupressed: Boolean)
    var
        PIH: Record 122;
        PCRMH: Record 124;
    begin
        PIH.Reset();
        PIH.SetRange("No.", PurchInvHdrNo);
        if PIH.FindFirst() then begin
            PIH.CalcFields(Amount);
            PIH."Invoice Amount(LCY)" += PIH.Amount / PIH."Currency Factor";
            PIH.Modify();
        end;

        PCRMH.Reset();
        PCRMH.SetRange("No.", PurchCrMemoHdrNo);
        if PCRMH.FindFirst() then begin
            PCRMH.CalcFields(Amount);
            PCRMH."Invoice Amount(LCY)" += PCRMH.Amount / PCRMH."Currency Factor";
            PCRMH.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePostVendorEntry', '', true, true)]
    local procedure OnBeforePostVendorEntry(var GenJnlLine: Record "Gen. Journal Line"; var PurchHeader: Record "Purchase Header"; var TotalPurchLine: Record "Purchase Line"; var TotalPurchLineLCY: Record "Purchase Line"; PreviewMode: Boolean; CommitIsSupressed: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; var IsHandled: Boolean)
    begin
        GenJnlLine."Country of Origin" := PurchHeader."REDM Country of Origin";
        GenJnlLine."Country of final Destination" := PurchHeader."REDM Country of final destinat";
        GenJnlLine."Destination Country" := PurchHeader."REDM Destination Country";
        GenJnlLine."Vessel Code" := PurchHeader."REDM Vessel Code";
    end;
    // //Codeunit 90 End

    // //Codeunit 80 Start
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', true, true)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    var
        SIH: Record 112;
        SCRMH: Record 114;
    begin
        SIH.Reset();
        SIH.SetRange("No.", SalesInvHdrNo);
        if SIH.FindFirst() then begin
            SIH.CalcFields(Amount);
            SIH."Invoice Amount(LCY)" += SIH.Amount / SIH."Currency Factor";
            SIH.Modify();
        end;

        SCRMH.Reset();
        SCRMH.SetRange("No.", SalesCrMemoHdrNo);
        if SCRMH.FindFirst() then begin
            SCRMH.CalcFields(Amount);
            SCRMH."Invoice Amount(LCY)" += SCRMH.Amount / SCRMH."Currency Factor";
            SCRMH.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostCustomerEntry', '', true, true)]
    local procedure OnBeforePostCustomerEntry(var GenJnlLine: Record "Gen. Journal Line"; var SalesHeader: Record "Sales Header"; var TotalSalesLine: Record "Sales Line"; var TotalSalesLineLCY: Record "Sales Line"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line")
    begin
        GenJnlLine."Country of Origin" := SalesHeader."REDM Country of Origin";
        GenJnlLine."Country of final Destination" := SalesHeader."REDM Country of final dest";
        GenJnlLine."Destination Country" := SalesHeader."REDM Destination Country";
        GenJnlLine."Vessel Code" := SalesHeader."REDM Vessel Code";
    end;
    // //Codeunit 80 End
    var
        myInt: Integer;
        ItemSpecification: Record 50122;
        SaleQItemSpecs: Record 50122;
}