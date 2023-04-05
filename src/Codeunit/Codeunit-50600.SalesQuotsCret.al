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
                //Message(Format(SalesQuoteLine."Document No."));
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

    var
        myInt: Integer;
        ItemSpecification: Record 50122;
        SaleQItemSpecs: Record 50122;
}