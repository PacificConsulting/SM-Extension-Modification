report 50602 "Proforma UIC"
{
    //
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\ProformaInvoiceATG-1.rdl';
    PreviewMode = Normal;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                ORDER(Ascending)
                                WHERE("Document Type" = FILTER(Order | Quote));
            RequestFilterFields = "No.", "Document Type";

            column(PaymnttermsDiscnt; PaymnttermsDiscnt)
            {
            }
            column(Order_Date; "Order Date") { }
            column(Contract_Reference; "REDM Contract Reference")
            {

            }
            column(BenFicname; BenFicname)
            {

            }
            column(Deal; "Shortcut Dimension 1 Code")
            {

            }
            column(REDM_BL_Date; "REDM BL Date")
            {

            }
            column(Prepayment_Due_Date; "Prepayment Due Date")
            {
            }
            column(Origin_SalesHeader; CountryOrigin.Name)//"Sales Header".Origin)    //Temp comment
            {
            }
            column(IncoTerms_SH; "Sales Header"."REDM Inco Terms/Delivery Terms")//"Sales Header".Incoterms)//Temp comment
            {
            }
            column(PageConst_________FORMAT_CurrReport_PAGENO_; PageConst + ' ' + FORMAT(CurrReport.PAGENO))
            {
            }
            column(COMPANYNAME; CompanyInfo.Name)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(StueMummer; CompanyInfo."RSPL Registry Tax No.")//CompanyInfo."Registry Tax No.")  
            {
            }
            column(RegistrieMummer; CompanyInfo."RSPLRegister Court No.")//CompanyInfo."Register Court No.")
            {
            }
            column(USTIDNr; "REDM OWN VAT Account No.")//"Sales Header"."own VAT Registration No.")
            {
            }
            column(Company_Logo; CompanyInfo.Picture)
            {
            }
            column(CompanyContact; CompanyInfo.Name)
            {
            }
            column(CompanyAddress1; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyAddress2)// CompanyInfo."Address 2")
            {
            }
            column(CompInfoPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyAddress3; CompanyInfo.City)
            {
            }
            column(CompanyAddress5; CompanyInfo."Country/Region Code")
            {
            }
            column(CompCountry; Country)
            {
            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyFaxNo; CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(website; CompanyInfo."Home Page")
            {

            }
            column(VATNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(CustVATNo; CustVATNo)
            {
            }
            column(SellContact; "Sales Header"."Sell-to Customer Name")
            {
            }
            column(SelAdd; "Sell-to Address")
            {
            }
            column(SelltoAddress2_SalesHeader; "Sales Header"."Sell-to Address 2")
            {
            }
            column(SelAdd1; "Sell-to Post Code" + ', ' + "Sell-to City")
            {
            }
            column(SelAdd2; SalesCountryName)
            {
            }
            column(SelAdd3; "Sell-to Post Code")
            {
            }
            column(SelAdd4; "Sell-to Contact No.")
            {
            }
            column(CurrencyCode_SalesHeader; "Sales Header"."Currency Code")
            {
            }
            column(NoInvoice; InvoiceNo)
            {
            }
            column(DocDate; "Document Date")
            {
            }
            column(ShipmentDate_SalesHeader; "Sales Header"."Shipment Date")
            {
            }
            column(DeliveryTerms_SalesHeader; "Sales Header"."REDM Discharge Terms")//"Delivery Terms")
            {
            }
            column(PortOfLoad; PortOfLoading)
            {
            }
            column(portofDischarge; portofDischarge)
            {
            }
            column(FinalDestination; '')
            {
            }
            column(DischargePort; DischargePort)
            {
            }
            column(PaymentTerm; PaymentTermsDesc)
            {
            }
            column(CountryOfOrigin; Country)
            {
            }
            column(SaleOrderNo; "No.")
            {
            }
            column(SNo; SNo)
            {
            }
            column(Sales_Header__Sales_Header___Deal_Reference_; '')
            {
            }
            column(FORMAT__Sales_Header___Due_Date__0___Day_____Month_Text_____Year4___; FORMAT("Sales Header"."Due Date", 0, '<Day>/<Month>/<Year4>'))
            {
            }
            column(Sales_Invoice_HeaderCaption; Sales_Invoice_HeaderCaptionLbl)
            {
            }
            column(Sales_Header_Document_Type; "Document Type")
            {
            }
            column(Comm1; Comments[1])
            {
            }
            column(Comm2; Comments[2])
            {
            }
            column(Comm3; Comments[3])
            {
            }
            column(Comm4; Comments[4])
            {
            }
            column(Comm5; Comments[5])
            {
            }
            column(Comm6; Comments[6])
            {
            }
            column(Comm7; Comments[7])
            {
            }
            column(Comm8; Comments[8])
            {
            }
            column(ExternalDocumentNo_SalesHeader; "Sales Header"."External Document No.")
            {
            }
            column(TotalPrepmntvalue; TotalPrepmntvalue)
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
                                    ORDER(Ascending)
                                    WHERE("Document Type" = FILTER(Order | Quote));

                column(SlDocno; "Sales Line"."Document No.")
                {
                }
                column(Tarrifcode; "Sales Line"."REDM Tariff Code")
                {
                }
                column(DescOfProd; "Description Comment")
                {
                }
                column(UOMC_SL; "Sales Line"."Unit of Measure Code")
                {
                }
                column(UOM; "Unit of Measure")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Rate; UnitPriceLCY)
                {
                }
                column(Amount; AmountLCY)
                {
                }
                column(CurrCode; CurrCode)
                {
                }
                column(OpenPracket; OpenPracket)
                {
                }
                column(ClosePracket; ClosePracket)
                {
                }
                column(AmountInWords; AmountInWords[1])
                {
                }
                column(NewAmtInwords; NewAmtInwords)
                {
                }
                column(TranShipment; "Sales Header"."Transport Method")
                {
                }
                column(PartialShipment; PartialShipment)
                {
                }
                column(Shipment; shipmentDesc)
                {
                }
                column(DeliveryTerm; DelTerms)
                {
                }
                column(Tolerance; '')
                {
                }
                column(Inspection; Inspection)
                {
                }
                column(Validity; Validity)
                {
                }
                column(Packing; Package)
                {
                }
                column(Delterms; DelTerms)
                {
                }
                column(TransShipment; TranShipment)
                {
                }
                column(Packing1; Package)
                {
                }
                column(Bank1; BANKName)
                {
                }
                column(Bank2; BankAcc)
                {
                }
                column(BankAdd_1_; BankAdd[1])
                {
                }
                column(BankAdd_2_; BankAdd[2])
                {
                }
                column(BankAdd_3_City; BankAdd[3])
                {
                }
                column(Postcode; BankAdd[13])
                {
                }
                column(BankAdd_4_; BankAdd[4])
                {
                }
                column(BankAdd_5_SwiftCode; BankAdd[5])
                {
                }
                column(BankAdd_6_IBAN; BankAdd[6])
                {
                }
                column(BankAdd_7_; BankAdd[7])
                {
                }
                column(BankAdd_8_; BankAdd[8])
                {
                }
                column(BankAdd_9_; BankAdd[9])
                {
                }
                column(BankAdd_10_; BankAdd[10])
                {
                }
                column(BankAdd_11_CurrencyCode; BankAdd[11])
                {
                }
                column(BankAdd_12_; BankAdd[12])
                {
                }
                column(Sales_Line_Document_Type; "Document Type")
                {
                }
                column(Sales_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    GenLedSetup.GET;



                    AmountLCY := "Line Amount";
                    AmountLCY1 := "Line Amount";
                    UnitPriceLCY := "Unit Price";
                    // FixedPriceLCY := "Fixed Price"; } //ASR
                    AmountLCY := ROUND(UnitPriceLCY * Quantity);
                    AmountLCY1 := ROUND(UnitPriceLCY * Quantity);

                    SNo += 1;

                    IF PrintAmountInLCY THEN BEGIN
                        IF "Sales Header"."Currency Code" <> '' THEN BEGIN
                            IF "Sales Header"."Currency Factor" <> 0 THEN BEGIN
                                AmountLCY :=
                                  ROUND(
                                    CurrExchRate.ExchangeAmtFCYToLCY(
                                      WORKDATE, "Sales Header"."Currency Code", "Line Amount",
                                     "Sales Header"."Currency Factor"));
                                UnitPriceLCY :=
                                   ROUND(
                                     CurrExchRate.ExchangeAmtFCYToLCY(
                                       WORKDATE, "Sales Header"."Currency Code", "Unit Price",
                                      "Sales Header"."Currency Factor"));

                                /* FixedPriceLCY :=
                                   ROUND(
                                     CurrExchRate.ExchangeAmtFCYToLCY(
                                       WORKDATE,"Sales Header"."Currency Code","Fixed Price",
                                      "Sales Header"."Currency Factor"));
                                      */ //ASR

                                AmountLCY := ROUND(UnitPriceLCY * Quantity);
                                CurrCode := GenLedSetup."LCY Code";
                            END;
                        END;
                    END ELSE BEGIN
                        UnitPriceLCY := "Unit Price";
                        //FixedPriceLCY := "Fixed Price"; } //ASR
                        AmountLCY := ROUND(UnitPriceLCY * Quantity);
                        IF "Sales Header"."Currency Code" <> '' THEN
                            CurrCode := "Sales Header"."Currency Code"
                        ELSE
                            CurrCode := GenLedSetup."LCY Code";
                    END;

                    IF CurrCode <> '' THEN BEGIN
                        OpenPracket := '(';
                        ClosePracket := ')';
                    END;

                    //TotalAmount += AmountLCY;
                    TotalAmount += AmountLCY1;

                    TotalAmount1 += TotalAmount;

                    CurUOM := "Sales Header"."Currency Code" + '/' + "Sales Line"."Unit of Measure";
                    CurUOM1 := "Sales Line"."Unit of Measure";
                    CurUOM2 := "Sales Header"."Currency Code";

                end;

                trigger OnPreDataItem()
                begin
                    CLEAR(TotalAmount);
                end;
            }
            dataitem("Sales Comment Line Header"; "Sales Comment Line")
            {
                DataItemLink = "No." = field("No."), "Document Type" = field("Document Type");
                DataItemLinkReference = "Sales Header";
                DataItemTableView = where("Document Line No." = Filter(0));
                column(SHComment; Comment)
                {

                }
                column(SHCommentNO; "No.")
                {

                }
                column(ShLine_No_; "Line No.")
                {

                }
                column(Srno; Srno)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    Srno += 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //PCPL-25/091023
                Clear(TAmt);
                SL.RESET;
                SL.SetRange("Document No.", "Sales Header"."No.");
                if SL.FindFirst() then
                    repeat
                        TAmt += SL.Amount;
                    until SL.Next() = 0;

                PaymentTerms.RESET;
                PaymentTerms.SETRANGE(Code, "Sales Header"."Payment Terms Code");
                IF PaymentTerms.FINDFIRST THEN
                    PaymnttermsDiscnt := PaymentTerms."Discount %";

                TotalPrepmntvalue := Round((TAmt * (PaymnttermsDiscnt / 100)));

                Check.InitTextVariable();
                Check.FormatNoText(AmountInWords, TotalPrepmntvalue, "Sales Header"."Currency Code");
                NewAmtInwords := CONVERTSTR(AmountInWords[1], '*', ' ');
                //PCPL-25/091023

                CountryOrigin.Reset();
                CountryOrigin.SetRange(Code, "REDM Country of Origin");
                if CountryOrigin.FindFirst() then;

                IF CustomerRec.GET("Sales Header"."Sell-to Customer No.") THEN
                    CustVATNo := CustomerRec."VAT Registration No.";

                if "Sales Header"."REDM Payment Conditions" <> '' then BEGIN
                    PaymentTermsDesc := "Sales Header"."REDM Payment Conditions"
                END ELSE BEGIN
                    PaymentTerms.RESET;
                    PaymentTerms.SETRANGE(Code, "Payment Terms Code");
                    IF PaymentTerms.FINDFIRST THEN
                        PaymentTermsDesc := (PaymentTerms.Description);
                END;

                /*PaymentTerms.RESET;
                PaymentTerms.SETRANGE(Code, "Payment Terms Code");
                IF PaymentTerms.FINDFIRST THEN
                    PaymnttermsDiscnt := PaymentTerms."Discount %";*/

                RDMPortMaster.RESET;
                RDMPortMaster.SETRANGE(Code, "Sales Header"."REDM Load Port");
                IF RDMPortMaster.FINDFIRST THEN
                    PortOfLoading := RDMPortMaster.Decription;

                RDMPortMaster.RESET;
                RDMPortMaster.SETRANGE(Code, "Sales Header"."REDM Discharge Port");///"Sales Header"."Port of Discharge");  //temp comment
                IF RDMPortMaster.FINDFIRST THEN
                    portofDischarge := RDMPortMaster.Decription;

                if CompanyInfo."Address 2" <> '' then
                    CompanyAddress2 := CompanyInfo."Address 2" + ', ';

                bankAccount.SETRANGE(bankAccount."No.", "Sales Header"."REDM Bank Account");//"Sales Header"."Bank to be used");   //temp comment
                IF bankAccount.FINDFIRST THEN BEGIN
                    BenFicname := 'BENEFICIARY: ' + CompanyInfo.Name;
                    BankAcc := 'Bank Account No. : ' + bankAccount."Bank Account No.";
                    BANKName := bankAccount.Name;
                    BankAdd[1] := 'Bank Address : ' + bankAccount.Address;
                    if bankAccount."Address 2" <> '' then
                        BankAdd[2] := bankAccount."Address 2" + ', ';
                    BankAdd[3] := bankAccount.City + '- ';
                    IF CountryTable.GET(bankAccount."Country/Region Code") THEN;
                    BankAdd[4] := CountryTable.Name;
                    BankAdd[5] := 'SWIFT : ' + bankAccount."SWIFT Code";
                    BankAdd[6] := bankAccount.IBAN;
                    //BankAdd[7] := bankAccount."Correspondent Bank Name";
                    //BankAdd[8] := bankAccount."Correspondent Bank Branch";
                    //BankAdd[9] := bankAccount."Correspondent Bank Swift Code";
                    BankAdd[10] := CompanyInfo.Name;
                    BankAdd[11] := 'Currency : ' + "Sales Header"."Currency Code";//bankAccount."Currency Code";
                    BankAdd[12] := bankAccount."No.";
                    BankAdd[13] := bankAccount."Post Code";
                END;
                SalesInvoiceHeader.SETRANGE(SalesInvoiceHeader."Order No.", "Sales Header"."No.");
                IF SalesInvoiceHeader.FINDFIRST THEN
                    InvoiceNo := SalesInvoiceHeader."No.";

                IF CountryTable.GET("Sales Header"."Sell-to Country/Region Code") THEN;
                SalesCountryName := CountryTable.Name;

                shipmentmethod.SETRANGE(shipmentmethod.Code, "Sales Header"."Shipment Method Code");
                IF shipmentmethod.FINDFIRST THEN
                    shipmentDesc := shipmentmethod.Description;

                i := 1;
                SalComment.RESET;
                SalComment.SETRANGE("Document Type", "Document Type");
                SalComment.SETRANGE("No.", "No.");
                IF SalComment.FINDFIRST THEN BEGIN
                    IF SalComment."Line No." <> 0 THEN
                        REPEAT
                            Comments[i] := FORMAT(i) + '.' + FORMAT(SalComment.Comment);
                            i += 1;
                        //CommentsTxt := SalComment.Comment;
                        //MESSAGE('a');
                        //END;
                        UNTIL SalComment.NEXT = 0;
                END;

            end;

            trigger OnPreDataItem()
            begin
                //RSPL Resp>>
                //SETFILTER("Shortcut Dimension 1 Code", CUSecurityCenter.SecurityCenter("Shortcut Dimension 1 Code")); //ASR
                //RSPL Resp<<

                CompanyInfo.CALCFIELDS(Picture);
                CountryTable.SETRANGE(CountryTable.Code, CompanyInfo."Country/Region Code");
                IF CountryTable.FINDFIRST THEN
                    Country := CountryTable.Name;
            end;
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInfo.GET;

        /*
          SalesSetup.GET;
        CASE SalesSetup."Logo Position on Documents" OF
          SalesSetup."Logo Position on Documents"::"No Logo":;
          SalesSetup."Logo Position on Documents"::Left:
            BEGIN
              CompanyInfo.CALCFIELDS(Picture);
            END;
          SalesSetup."Logo Position on Documents"::Center:
            BEGIN
              CompanyInfo1.GET;
              CompanyInfo1.CALCFIELDS(Picture);
            END;
          SalesSetup."Logo Position on Documents"::Right:
            BEGIN
              CompanyInfo2.GET;
              CompanyInfo2.CALCFIELDS(Picture);
            END;
        END;
        */

    end;

    var
        PageConst: Label 'Page';
        CompanyAddress2: text;

        BenFicname: Text;
        PaymentTerms: Record 3;
        PaymentTermsDesc: Text;
        PortOfLoading: Text;
        portofDischarge: Text;
        CurUOM: Text;
        CurUOM1: Text;
        CurUOM2: Text;
        bankAccount: Record 270;
        BankAcc: Text;
        BANKName: Text[50];
        BankAdd: array[13] of Text[100];
        TotalAmount: Decimal;
        Check: codeunit 50601; //Report Check; //
        AmountInWords: array[2] of Text[250];
        NewAmtInwords: Text[250];
        BunkerDelNote: Text[250];
        CompanyInfo: Record 79;
        ShipToAddr: Text[50];
        CompanyAddr: Text[50];
        //FormatAddr: Codeunit  365;  //temp comment
        CompanyInfo1: Record 79;
        CompanyInfo2: Record 79;
        SalesSetup: Record 311;
        DischargePort: Text;
        CountryTable: Record 9;
        Country: Text;
        InvoiceNo: Text;
        SalesInvoiceHeader: Record 112;
        TranShipment: Text;
        PartialShipment: Text;
        Inspection: Text;
        Package: Text;
        DelTerms: Text;
        Validity: Text;
        shipmentmethod: Record 10;
        shipmentDesc: Text;
        AmountLCY: Decimal;
        UnitPriceLCY: Decimal;
        FixedPriceLCY: Decimal;
        PrintAmountInLCY: Boolean;
        CurrExchRate: Record 330;
        SNo: Integer;
        CurrCode: Code[10];
        GenLedSetup: Record 98;
        OpenPracket: Text;
        ClosePracket: Text;
        SalesCountryName: Text;
        Sales_Invoice_HeaderCaptionLbl: Label 'Sales Invoice Header';
        "-----------------------------------": Integer;
        AmountLCY1: Decimal;
        TotalAmount1: Decimal;
        Comments: array[10] of Text[100];
        SalComment: Record 44;
        i: Integer;
        CommentsTxt: Text;
        CustomerRec: Record 18;
        CustVATNo: Text;
        EntryExitPoint: Record 282;
        PaymnttermsDiscnt: Decimal;
        TotalPrepmntvalue: Decimal;
        j: integer;
        Srno: Integer;
        RDMPortMaster: Record "REDM Port Master";
        CountryOrigin: Record 349;
        SL: Record "Sales Line";
        TAmt: Decimal;
}

