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
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
                                    ORDER(Ascending)
                                    WHERE("Document Type" = FILTER(Order | Quote));
                column(TotalPrepmntvalue; TotalPrepmntvalue)
                {
                }
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

                    PaymentTerms.RESET;
                    PaymentTerms.SETRANGE(Code, "Sales Header"."Payment Terms Code");
                    IF PaymentTerms.FINDFIRST THEN
                        PaymnttermsDiscnt := PaymentTerms."Discount %";

                    TotalPrepmntvalue := TotalAmount1 * (PaymnttermsDiscnt / 100);
                    //MESSAGE('%1', TotalPrepmntvalue);


                    Check.InitTextVariable();
                    Check.FormatNoText(AmountInWords, TotalPrepmntvalue, CurrCode);
                    //MESSAGE('%1',AmountInWords[1]);

                    NewAmtInwords := CONVERTSTR(AmountInWords[1], '*', ' ');
                    //Message(format(NewAmtInwords));

                    /*
                    Check.InitTextVariable();
                    Check.FormatNoText(AmountInWords,TotalAmount1,CurrCode);
                    //MESSAGE('%1',AmountInWords[1]);
                    
                    NewAmtInwords := CONVERTSTR(AmountInWords[1],'*',' ');
                    //MESSAGE(AmountInWords[1]);
                    //MESSAGE(NewAmtInwords);
                    */
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
                /* //ASR
                IF "Payment Terms Code" = '' THEN
                  PaymentTerms.INIT
                ELSE BEGIN
                  PaymentTerms.GET("Payment Terms Code");
                  PaymentTerms.TranslateDescription(PaymentTerms,"Language Code");
                  PaymentTermsDesc := (PaymentTerms.Description);   //ASR +' '+ FORMAT("Sales Header"."Pricing Event Date");
                END;
                */
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

                /*EntryExitPoint.RESET;
                EntryExitPoint.SETRANGE(Code, "Sales Header"."REDM Load Port");//"Sales Header"."Port of Loading");  //temp comment
                IF EntryExitPoint.FINDFIRST THEN
                    PortOfLoading := EntryExitPoint.Description;

                EntryExitPoint.RESET;
                EntryExitPoint.SETRANGE(Code, "Sales Header"."REDM Discharge Port");///"Sales Header"."Port of Discharge");  //temp comment
                IF EntryExitPoint.FINDFIRST THEN
                    portofDischarge := EntryExitPoint.Description;
                    */
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

                /* //ASR
                IF "Loading Location" <> '' THEN
                  PortOfLoading := "Loading Location"
                ELSE IF "Load Port" <> '' THEN BEGIN
                  //IF Port.GET("Load Port")THEN;   //ASR
                    //PortOfLoading := Port.Description; //ASR
                END;                
                
                IF "Discharge Location" <> '' THEN
                  DischargePort := "Discharge Location"
                ELSE IF "Discharge Port"<>'' THEN BEGIN
                  IF Port.GET("Discharge Port")THEN;
                   DischargePort := Port.Description;
                END;
                
                IF "Sales Header"."Trans-Shipment" = "Sales Header"."Trans-Shipment"::"1" THEN
                  TranShipment := 'Allowed';
                IF "Sales Header"."Trans-Shipment" <> "Sales Header"."Trans-Shipment"::"1" THEN
                  TranShipment := 'Not Allowed';
                
                IF "Sales Header"."Partial Shipment" = "Sales Header"."Partial Shipment"::"1" THEN
                  PartialShipment := 'Allowed';
                IF "Sales Header"."Partial Shipment" <> "Sales Header"."Partial Shipment"::"1" THEN
                  PartialShipment := 'Not Allowed';
                  */ //ASR

                /*  //ASR
                SalesAddInfo.RESET;
                SalesAddInfo.SETRANGE(SalesAddInfo."No.","Sales Header"."No.");
                IF SalesAddInfo.FINDFIRST THEN
                BEGIN
                  Inspection := SalesAddInfo.Inspection;
                  Package := SalesAddInfo.Packing;
                  DelTerms := SalesAddInfo."Pricing Description" + DischargePort;
                  Validity := SalesAddInfo.Validity;
                END;
                */  //ASR

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

    requestpage
    {

        layout
        {
            area(content)
            {
                field(ShowAmountInLCY; PrintAmountInLCY)
                {
                    Caption = 'Show Amount In LCY';
                    Visible = false;
                }
            }
        }

        actions
        {
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
        PaymentTermsDesc: Text[100];
        PortOfLoading: Text[100];
        portofDischarge: Text[50];
        CurUOM: Text[30];
        CurUOM1: Text[30];
        CurUOM2: Text[30];
        bankAccount: Record 270;
        BankAcc: Text[50];
        BANKName: Text[50];
        BankAdd: array[13] of Text[100];
        TotalAmount: Decimal;
        Check: codeunit 50601;//Report Check;
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
        DischargePort: Text[50];
        CountryTable: Record 9;
        Country: Text[50];
        InvoiceNo: Text[50];
        SalesInvoiceHeader: Record 112;
        TranShipment: Text[30];
        PartialShipment: Text[30];
        Inspection: Text[30];
        Package: Text[30];
        DelTerms: Text[50];
        Validity: Text[50];
        shipmentmethod: Record 10;
        shipmentDesc: Text[50];
        AmountLCY: Decimal;
        UnitPriceLCY: Decimal;
        FixedPriceLCY: Decimal;
        PrintAmountInLCY: Boolean;
        CurrExchRate: Record 330;
        SNo: Integer;
        CurrCode: Code[10];
        GenLedSetup: Record 98;
        OpenPracket: Text[10];
        ClosePracket: Text[10];
        SalesCountryName: Text[30];
        Sales_Invoice_HeaderCaptionLbl: Label 'Sales Invoice Header';
        "-----------------------------------": Integer;
        AmountLCY1: Decimal;
        TotalAmount1: Decimal;
        Comments: array[10] of Text[100];
        SalComment: Record 44;
        i: Integer;
        CommentsTxt: Text[100];
        CustomerRec: Record 18;
        CustVATNo: Text[20];
        EntryExitPoint: Record 282;
        PaymnttermsDiscnt: Decimal;
        TotalPrepmntvalue: Decimal;
        j: integer;
        Srno: Integer;
        RDMPortMaster: Record "REDM Port Master";
        CountryOrigin: Record 349;
}

