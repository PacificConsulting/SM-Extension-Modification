report 50603 "COMMERCIAL Invoice UIC"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\COMMERCIALInvoiceATG.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(FOB_Bifurcation; FOB_Bifurcation)
            {
            }
            column(BenFicname; BenFicname)
            {

            }
            column(Sumqty; Sumqty)
            {

            }
            column(Deal; "Shortcut Dimension 1 Code")
            {

            }
            column(REDM_BL_Date; "REDM BL Date")
            {

            }
            column(REDM_Deal_No_; "REDM Deal No.")
            {

            }
            column(TotalBalAmntRecvble; TotalBalAmntRecvble)
            {
            }
            column(AdvancedReceived; ABS(AdvancedReceived))
            {
            }
            column(DeliveryTerms_SalesInvoiceHeader; "Sales Invoice Header"."REDM Discharge Terms")//"Delivery Terms")
            {
            }
            column(Incoterms_SalesInvoiceHeader; "Sales Invoice Header"."REDM Inco Terms/Delivery Terms")//Incoterms)
            {
            }
            column(CurrencyCode_SalesInvoiceHeader; "Sales Invoice Header"."Currency Code")
            {
            }
            column(TextBool; TextBool)
            {
            }
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
            column(CompInfo_Address________CompInfo__Address_2_; CompInfo.Address + ',' + CompInfo."Address 2")
            {
            }
            column(CompInfo_PostCode_City_Add2; CompInfo."Post Code" + ' ' + CompInfo.City + ', ' + CompInfo."Address 2")
            {
            }
            column(CompCountry; CompCountry)
            {
            }
            column(CompInfo_Tel_PhoneNo; 'Tel.: ' + CompInfo."Phone No.")
            {
            }
            column(CompInfo_Fax_PhoneNo2; 'Fax: ' + CompInfo."Phone No. 2")
            {
            }
            column(CompInfo_Email; 'Email : ' + CompInfo."E-Mail")
            {
            }
            column(CompInfo_VATRegNo; CompInfo."VAT Registration No.")
            {
            }
            column(Stuernummer; CompInfo."RSPL Registry Tax No.")//CompInfo."Registry Tax No.")
            {
            }
            column(CO__GST_REG__NO__; 'CO. GST REG. NO.' + CompInfo."Registration No.")
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(ShiptoName_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Name")
            {
            }
            column(ShiptoAddress_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Address")
            {
            }
            column(ShipToPostCode; "Sales Invoice Header"."Ship-to Post Code")
            {
            }
            column(ShiptoAddress2_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Address 2")
            {
            }
            column(ShiptoPostCode_City_Country_SalesInvoiceHeader; 'P.O. BOX ' + "Sales Invoice Header"."Ship-to Post Code" + ', ' + "Sales Invoice Header"."Ship-to City" + ', ' + CustomerCountry)
            {
            }
            column(CustomerCountry; CustomerCountry)
            {
            }
            column(CustVATNo; 'VAT NO. ' + CustVATNo)
            {
            }
            column(Portofloading_SalesInvoiceHeader; "Sales Invoice Header"."REDM Load Port")//"Port of loading")
            {
            }
            column(PortofDischarge_SalesInvoiceHeader; "Sales Invoice Header"."REDM Discharge Port")//"Port of Discharge")
            {
            }
            column(BLNo; "Sales Invoice Header"."REDM BL No.")//"Sales Invoice Header"."Bill of Lading No")  //Temp comment
            {
            }
            column(BLDate; "Sales Invoice Header"."REDM BL Date")//FORMAT("Sales Invoice Header"."Bill of Lading Date"))//Temp comment
            {
            }
            column(VesselCode_SalesInvoiceHeader; "Sales Invoice Header"."REDM Vessel Code")//"Vessel Code")
            {
            }
            column(Origin_SalesInvoiceHeader; Origin_Country)
            {
            }
            column(Origin_SalesInvoiceHeader2; CountryOrigin.Name)//Origin)
            {
            }
            column(Origin_SalesInvoiceHeader1; CountryOrigin.Name)//Origin)
            {
            }
            column(DIschargPortDesciptionnn; DischargePortName)
            {
            }
            column(LoadPortDesciptionnn; LoadPortDesciption)
            {
            }
            column(CountryOfOrigin; CompCountry)
            {
            }
            column(PaymentTermsDesc; PaymentTermsDesc)
            {
            }
            column(Bank1; BANKName)
            {
            }
            column(Bank2; BankAcc)
            {
            }
            column(BankCOuntry; BankCountry.Name)
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
            column(BankAdd_4_PostCode; BankAdd[4])
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
            column(Sales_Invoice_Header__Bill_to_Name_; "Bill-to Name")
            {
            }
            column(Sales_Invoice_Header__Bill_to_Address_; "Bill-to Address")
            {
            }
            column(Sales_Invoice_Header__Bill_to_Address_2_; "Bill-to Address 2")
            {
            }
            column(Bill_to_City__________Bill_to_Post_Code_; "Bill-to City" + ' ' + "Bill-to Post Code")
            {
            }
            column(Sales_Invoice_Header__Order_No__; "Order No.")
            {
            }
            column(Sales_Invoice_Header__No__; "No.")
            {
            }
            column(PostingDate_SalesInvoiceHeader; "Sales Invoice Header"."Posting Date")
            {
            }
            column(Sales_Invoice_Header__Posting_Date_; FORMAT("Posting Date", 0, '<day,2>-<month,2>-<year4>'))
            {
            }
            column(Sales_Invoice_Header__External_Document_No__; "External Document No.")
            {
            }
            column(Sales_Invoice_Header__Load_Port_; PortName)
            {
            }
            column(Sales_Invoice_Header__Payment_Terms_Code_; SubType)
            {
            }
            column(PaymTermsRec_Description; PaymTermsRec.Description)
            {
            }
            column(PaymMethodRec_Description; PaymMethodRec.Description)
            {
            }
            column(Sales_Invoice_Header__Due_Date_; FORMAT("Due Date", 0, '<day,2>-<month,2>-<year4>'))
            {
            }
            column(XX_; gBillDate)
            {
            }
            column(X_; gBillNo)
            {
            }
            column(XXX_; "Shipment Method Code")
            {
            }
            column(Order_Date; FORMAT("Sales Invoice Header"."Order Date"))
            {
            }
            column(SODate; FORMAT(SODate, 0, '<day,2>-<month,2>-<year4>'))
            {
            }
            column(Correspondent_Bank; '')
            {
            }
            column(Bank_SWIFT; '')
            {
            }
            column(PaymentTermCode; PaymentTermCode)
            {
            }
            column(FacilittyNo; FacilittyNo)
            {
            }
            column(IncoTermName; IncoTermName)
            {
            }
            column(VessalName; VessalName)
            {
            }
            column(DeliveryTerms_SalesInvoiceHeaderNew; "REDM Discharge Terms")//"Delivery Terms")
            {
            }
            column(DischargePort; DischargePort)
            {
            }
            column(DueDate; FORMAT(DueDate, 0, '<day,2>-<month,2>-<year4>'))
            {
            }
            column(FooterDesc1; Comm[1])
            {
            }
            column(FooterDesc2; Comm[2])
            {
            }
            column(FooterDesc3; Comm[3])
            {
            }
            column(Ship_to_Country; ShipToCountry)
            {
            }
            column(Bill_to_Country; contr)
            {
            }
            column(LCBank; LCBankName)
            {
            }
            column(CurrencyCode; "Sales Invoice Header"."Currency Code")
            {
            }
            column(OLDName; CompInfo."Bank Name")
            {
            }
            column(TAX_INVOICECaption; TAX_INVOICECaptionLbl)
            {
            }
            column(BUYER_APPLICANTCaption; BUYER_APPLICANTCaptionLbl)
            {
            }
            column(Sales_Order_No_Caption; Sales_Order_No_CaptionLbl)
            {
            }
            column(Sales_Invoice_Header__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(DateCaption; DateCaptionLbl)
            {
            }
            column(Ext__Doc_No_Caption; Ext__Doc_No_CaptionLbl)
            {
            }
            column(VESSEL__BARGE__TANKERCaption; VESSEL__BARGE__TANKERCaptionLbl)
            {
            }
            column(LOAD_PORT__TERMINALCaption; LOAD_PORT__TERMINALCaptionLbl)
            {
            }
            column(PAYMENT_TERMS_Caption; PAYMENT_TERMS_CaptionLbl)
            {
            }
            column(DISCRIPTIONCaption; DISCRIPTIONCaptionLbl)
            {
            }
            column(PAYMENT_METHODCaption; PAYMENT_METHODCaptionLbl)
            {
            }
            column(LC_No____ISSUE_DATE_Caption; LC_No____ISSUE_DATE_CaptionLbl)
            {
            }
            column(BL_BDN_DO_CQ_DATECaption; BL_BDN_DO_CQ_DATECaptionLbl)
            {
            }
            column(BL_BDN_DO_CQ_No_Caption; BL_BDN_DO_CQ_No_CaptionLbl)
            {
            }
            column(TERMS_OF_DELIVERYCaption; TERMS_OF_DELIVERYCaptionLbl)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(Sales_Invoice_Line__Unit_Price_Caption; Sales_Invoice_Line__Unit_Price_CaptionLbl)
            {
            }
            column(Sales_Invoice_Line_QuantityCaption; Sales_Invoice_Line_QuantityCaptionLbl)
            {
            }
            column(Sales_Invoice_Line__Unit_of_Measure_Caption; Sales_Invoice_Line__Unit_of_Measure_CaptionLbl)
            {
            }
            column(Sales_Invoice_Line_DescriptionCaption; "Sales Invoice Line".FIELDCAPTION(Description))
            {
            }
            column(ISSUE_DATE; ISSUE_DATELbl)
            {
            }
            column(Sales_Order_Date; Sales_Order_DateLbl)
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.")
                                    WHERE(Type = FILTER(<> ' '));
                column(FOBvalue; FOBvalue)
                {
                }
                column(SlDocno; "Sales Invoice Line"."Document No.")
                {
                }
                column(Tarrifcode; "Sales Invoice Line"."REDM Tariff Code")
                {
                }
                column(Freightvalue; Freightvalue)
                {
                }
                column(Sales_Invoice_Line_Description; Description)
                {
                }
                column(Description_SalesInvoiceLine; "Sales Invoice Line".Description)
                {
                }
                column(Sales_Invoice_Line__Unit_of_Measure_; "Unit of Measure")
                {
                }
                column(UnitofMeasureCode_SalesInvoiceLine; "Sales Invoice Line"."Unit of Measure Code")
                {
                }
                column(Quantity_SIL; "Sales Invoice Line".Quantity)
                {
                }

                column(Description_Comment; "Description Comment")
                {

                }
                column(UnitPrice_SIL; "Sales Invoice Line"."Unit Price")
                {
                }
                column(LineAmount_SIL; "Line Amount")
                {
                }
                column(Sales_Invoice_Line_Quantity; ROUND(Quantity, 0.001, '>'))
                {
                    DecimalPlaces = 3 : 3;
                }
                column(Sales_Invoice_Line__Unit_Price_; ROUND("Unit Price", 0.001, '>'))
                {
                }
                column(Sales_Invoice_Line__Line_Amount_; "Line Amount")
                {
                }
                column(Sales_Invoice_Line__No__; "No.")
                {
                }
                column(Sales_Invoice_Line_Quantity_Control1000000025; Quantity)
                {
                }
                column(Sales_Invoice_Line__Line_Amount__Control1000000036; "Line Amount")
                {
                }
                column(Sales_Invoice_Header___Bank_Account_; BankAccRec.Name)
                {
                }
                column(BankAccRec__Bank_Account_No__; BankAccRec."Bank Account No.")
                {
                }
                column(BankAccRec_Name; CompInfo.Name)
                {
                }
                column(BankAccRec__Bank_Branch_No__; BankAccRec."Bank Branch No.")
                {
                }
                column(BankAccRec_Address________BankAccRec__Address_2_; BankAccRec.Address + ' ' + BankAccRec."Address 2")
                {
                }
                column(BankAccRec_City_______BankAccRec__Post_Code_; BankAccRec.City + ' ' + BankAccRec."Post Code" + ' ,  ' + bankContr)
                {
                }
                column(BankAccRec__SWIFT_Code_; BankAccRec."SWIFT Code")
                {
                }
                column(DataItem1000000075; ' STD (STANDARD-RATED), ZR (ZERO RATE), OS (OUT OF SCOPE ), M (MFT SCHEME- PAYMENT OF GST NOT REQUIRED UNDER THE APPROVED MFT SCHEME)')
                {
                }
                column(Sales_Invoice_Line__Tax_Amount_; '')
                {
                }
                column(Line_Amount_____Tax_Amount_; '')
                {
                }
                column(AmountInWords_1_; AmountInWords[1])
                {
                }
                column(NewAmtInwords; NewAmtInwords)
                {
                }
                column(BankAccRec_IBAN; BankAccRec.IBAN)
                {
                }
                column(Sales_Invoice_Line__No__Caption; FIELDCAPTION("No."))
                {
                }
                column(TotalCaption; TotalCaptionLbl)
                {
                }
                column(BENEFICIARY_BANKCaption; BENEFICIARY_BANKCaptionLbl)
                {
                }
                column(ACCOUNT_NO_Caption; ACCOUNT_NO_CaptionLbl)
                {
                }
                column(BRANCHCaption; BRANCHCaptionLbl)
                {
                }
                column(SWIFTCaption; SWIFTCaptionLbl)
                {
                }
                column(CORRESPONDING_BANKCaption; CORRESPONDING_BANKCaptionLbl)
                {
                }
                column(SWIFTCaption_Control1000000067; SWIFTCaption_Control1000000067Lbl)
                {
                }
                column(FOR_GULF_PETROCHEM_PTE__LTD_Caption; FOR_GULF_PETROCHEM_PTE__LTD_CaptionLbl)
                {
                }
                column(AUTHORISED_SIGNATORYCaption; AUTHORISED_SIGNATORYCaptionLbl)
                {
                }
                column(FOR_GST_PURPOSE_ONLYCaption; FOR_GST_PURPOSE_ONLYCaptionLbl)
                {
                }
                column(V1__EXCHANGE_RATE_Caption; V1__EXCHANGE_RATE_CaptionLbl)
                {
                }
                column(V2__GST_TYPE_Caption; V2__GST_TYPE_CaptionLbl)
                {
                }
                column(GST_AMOUNTCaption; GST_AMOUNTCaptionLbl)
                {
                }
                column(BENEFICIARY_NameCaption; BENEFICIARY_NameCaptionLbl)
                {
                }
                column(BENEFICIARY_AddressCaption; BENEFICIARY_AddressCaptionLbl)
                {
                }
                column(Incorporate_caption; Incorporate_captionLbl)
                {
                }
                column(Sales_Invoice_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Invoice_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    VATAmt29 := 0;
                    TotalAmount += "Sales Invoice Line"."Amount Including VAT";

                    VATAmt29 := "Sales Invoice Line"."Amount Including VAT" - "Sales Invoice Line".Amount;

                    //RSPL-AR
                    if "Sales Invoice Line".Type <> "Sales Invoice Line".Type::"G/L Account" then // [THEN] Then
                        Sumqty := "Sales Invoice Line".Quantity;

                    SILRec.RESET;
                    SILRec.SETRANGE("Document No.", "Document No.");
                    SILRec.SETRANGE(Type, Type);
                    IF SILRec.FINDFIRST THEN
                        REPEAT
                            //FOB Value
                            if SILRec."Unit of Measure Code" = 'MT' then
                                FOBQty := SILRec."Unit Price" - 100
                            else
                                FOBQty := SILRec."Unit Price" - 0.100;
                            TotalFOBQty := FOBQty * SILRec.Quantity;
                            FOBvalue += TotalFOBQty;
                            //FOB Value

                            //Freight Value
                            if SILRec."Unit of Measure Code" = 'MT' then
                                TotalFreightQty := SILRec.Quantity * 100
                            else
                                TotalFreightQty := SILRec.Quantity * 0.100;
                            Freightvalue += TotalFreightQty;
                            //Freight Value
                            TotalLineAmount += SILRec."Line Amount";
                        UNTIL SILRec.NEXT = 0;

                    TotalBalAmntRecvble := TotalLineAmount - ABS(AdvancedReceived);

                    CheckRep.InitTextVariable;
                    CheckRep.FormatNoText(AmountInWords, TotalBalAmntRecvble, "Sales Invoice Header"."Currency Code");

                    NewAmtInwords := CONVERTSTR(AmountInWords[1], '*', ' ');


                    //RSPL-AR

                    /*
                    CurrExchRate.RESET;
                    TotalAmount := CurrExchRate.ExchangeAmtFCYToLCY("Sales Invoice Header"."Posting Date",
                       "Sales Invoice Header"."Currency Code",TotalAmount,1);
                    */
                    //CheckRep.InitTextVariable;
                    //CheckRep.FormatNoText(AmountInWords,ROUND((TotalAmount ),0.01),"Sales Invoice Header"."Currency Code")

                end;

                trigger OnPreDataItem()
                begin
                    TotalAmount := 0;
                end;
            }
            dataitem("Sales Comment Line Header"; "Sales Comment Line")
            {
                DataItemLink = "No." = field("No.");
                DataItemLinkReference = "Sales Invoice Header";
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
                Clear(Sumqty);
                SILine.Reset();
                SILine.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                SILine.SetFilter(Type, '<>%1', SILine.Type::"G/L Account");
                if SILine.FindSet() then
                    repeat
                        Sumqty += SILine.Quantity;
                    until SILine.Next() = 0;

                CompInfo.GET;
                CompInfo.CALCFIELDS(CompInfo.Picture);

                CountryOrigin.Reset();
                CountryOrigin.SetRange(Code, "REDM Country of Origin");
                if CountryOrigin.FindFirst() then;

                RDMPortMaster.RESET;
                RDMPortMaster.SETRANGE(Code, "REDM Load Port");
                IF RDMPortMaster.FINDFIRST THEN
                    LoadPortDesciption := RDMPortMaster.Decription;

                RDMPortMaster.RESET;
                RDMPortMaster.SETRANGE(Code, "REDM Discharge Port");///"Sales Header"."Port of Discharge");  //temp comment
                IF RDMPortMaster.FINDFIRST THEN
                    DischargePortName := RDMPortMaster.Decription;

                /*
                EntryEXit.RESET;
                EntryEXit.SETRANGE(Code, "Sales Invoice Header"."Port of loading");
                IF EntryEXit.FINDFIRST THEN
                    LoadPortDesciption := EntryEXit.Description;
                EntryEXit.RESET;
                EntryEXit.SETRANGE(Code, "Sales Invoice Header"."Port of Discharge");
                IF EntryEXit.FINDFIRST THEN
                    DischargePortName := EntryEXit.Description;
                    */

                CountryTable.RESET;
                CountryTable.SETRANGE(CountryTable.Code, CompInfo."Country/Region Code");
                IF CountryTable.FINDFIRST THEN
                    CompCountry := CountryTable.Name;

                IF CustomerRec.GET("Sales Invoice Header"."Sell-to Customer No.") THEN
                    CustVATNo := CustomerRec."VAT Registration No.";

                IF CountryTable.GET(CustomerRec."Country/Region Code") THEN
                    CustomerCountry := CountryTable.Name;

                //IF CountryTable.GET("Sales Invoice Header".Origin) THEN 
                IF CountryTable.GET("Sales Invoice Header"."REDM Country of Origin") THEN  //above code commnet
                    Origin_Country := CountryTable.Name;

                IF "Sales Invoice Header"."REDM Payment Conditions" <> '' THEN BEGIN
                    PaymentTermsDesc := "Sales Invoice Header"."REDM Payment Conditions"
                END ELSE BEGIN
                    PaymentTerms.RESET;
                    PaymentTerms.SETRANGE(Code, "Payment Terms Code");
                    IF PaymentTerms.FINDFIRST THEN
                        PaymentTermsDesc := (PaymentTerms.Description);
                END;


                BankAccount.SETRANGE(BankAccount."No.", "Sales Invoice Header"."REDM Bank Account");//"Sales Invoice Header"."Bank to be used");
                IF BankAccount.FINDFIRST THEN BEGIN
                    BenFicname := 'BENEFICIARY: ' + CompInfo.Name;
                    BankAcc := 'Bank Account No. : ' + BankAccount."Bank Account No.";
                    BANKName := BankAccount.Name;
                    BankAdd[1] := 'Bank Address : ' + BankAccount.Address;
                    BankAdd[2] := BankAccount."Address 2" + ', ';
                    BankAdd[3] := BankAccount.City + '- ';
                    BankAdd[4] := BankAccount."Post Code";

                    BankAdd[5] := 'SWIFT : ' + BankAccount."SWIFT Code";
                    BankAdd[6] := BankAccount.IBAN;
                    //BankAdd[7] := bankAccount."Correspondent Bank Name";
                    //BankAdd[8] := bankAccount."Correspondent Bank Branch";
                    //BankAdd[9] := bankAccount."Correspondent Bank Swift Code";
                    BankAdd[10] := CompInfo.Name;
                    BankAdd[11] := 'Currency : ' + BankAccount."Currency Code";
                    BankAdd[12] := BankAccount."No.";
                    BankAdd[13] := bankAccount."Post Code";
                    BankCountry.Reset();
                    BankCountry.SetRange(Code, BankAccount."No.");
                    if BankCountry.FindFirst() then;
                END;

                //CLEAR(AdvancedReceived);
                /* CustLedEntryRec.RESET;
                 CustLedEntryRec.SETRANGE("Customer No.", "Sell-to Customer No.");
                 CustLedEntryRec.SETRANGE("Global Dimension 1 Code", "Sales Invoice Header"."Shortcut Dimension 1 Code");
                 CustLedEntryRec.SETRANGE(CustLedEntryRec."Document Type", CustLedEntryRec."Document Type"::Payment);
                 CustLedEntryRec.SETFILTER("Posting Date", '<%1', "Sales Invoice Header"."Posting Date");
                 IF CustLedEntryRec.FINDSET THEN
                     REPEAT
                         CustLedEntryRec.CALCFIELDS(Amount);
                         AdvancedReceived += CustLedEntryRec.Amount;
                     //MESSAGE('%1',AdvancedReceived);
                     UNTIL CustLedEntryRec.NEXT = 0; */  //temp comment

                //MESSAGE('%1,%2',"Sales Invoice Header"."Shortcut Dimension 1 Code",CustLedEntryRec."Global Dimension 1 Code");


                IF country.GET(BankAccRec."Country/Region Code") THEN
                    bankContr := country.Name;

                recComment.SETRANGE(recComment."Document Type", recComment."Document Type"::"Posted Invoice");
                recComment.SETRANGE(recComment."No.", "No.");
                IF recComment.FINDSET THEN BEGIN
                    i := 1;
                    REPEAT
                        Comm[i] := recComment.Comment;
                        i += 1;
                    UNTIL recComment.NEXT = 0;
                END;
            end;

            trigger OnPreDataItem()
            begin
                //RSPL Resp>>
                //SETFILTER("Shortcut Dimension 1 Code", CUSecurityCenter.SecurityCenter("Shortcut Dimension 1 Code"));
                //RSPL Resp<<
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("FOB Bifurcation value")
                {
                    field("FOB Bifurcation"; FOB_Bifurcation)
                    {
                        Caption = 'FOB Bifurcation';
                        ApplicationArea = all;
                    }
                    field("Advanced Received"; AdvancedReceived)
                    {
                        ApplicationArea = All;
                    }
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
        //showDue := TRUE;
    end;

    var
        CompInfo: Record 79;
        BenFicname: Text;
        PaymTermsRec: Record 3;
        PaymMethodRec: Record 289;
        BankAccRec: Record 270;
        CheckRep: Codeunit 50601;//Report 1401;
        AmountInWords: array[50] of Text[250];
        NewAmtInwords: Text[250];
        TotalAmount: Decimal;
        CurrExchRate: Record 330;
        PostedSalesShipRec: Record 110;
        DoNo: Text[50];
        DoDate: Text[30];
        gBillDate: Text[30];
        gBillNo: Text[250];
        PortName: Text[60];
        PaymentTerm: Record 3;
        SubType: Option;
        SalesOrder: Record 36;
        SODate: Date;
        PaymentTermCode: Text[60];
        FacilittyNo: Text[50];
        IncoTerm: Text[50];
        VessalName: Text[50];
        IncoTermName: Text[50];
        DischargePort: Text[50];
        LoadPort: Text[50];
        showDue: Boolean;
        DueDate: Date;
        recComment: Record 44;
        Comm: array[20] of Text[150];
        i: Integer;
        d: Integer;
        m: Integer;
        y: Integer;
        gBillDt: Date;
        country: Record 9;
        contr: Text[30];
        bankContr: Text[30];
        LCBankName: Text[30];
        TAX_INVOICECaptionLbl: Label 'TAX INVOICE';
        BUYER_APPLICANTCaptionLbl: Label 'BUYER/APPLICANT';
        Sales_Order_No_CaptionLbl: Label 'Sales Order No.';
        DateCaptionLbl: Label 'Date';
        Ext__Doc_No_CaptionLbl: Label 'Ext. Doc No.';
        VESSEL__BARGE__TANKERCaptionLbl: Label 'VESSEL /BARGE /TANKER';
        LOAD_PORT__TERMINALCaptionLbl: Label 'LOAD PORT';
        PAYMENT_TERMS_CaptionLbl: Label 'PAYMENT AT';
        DISCRIPTIONCaptionLbl: Label 'DISCRIPTION';
        PAYMENT_METHODCaptionLbl: Label 'PAYMENT METHOD';
        LC_No____ISSUE_DATE_CaptionLbl: Label 'LC No. ';
        BL_BDN_DO_CQ_DATECaptionLbl: Label 'BL/BDN/DO/CQ DATE';
        BL_BDN_DO_CQ_No_CaptionLbl: Label 'BL/BDN/DO/CQ No.';
        TERMS_OF_DELIVERYCaptionLbl: Label 'TERMS OF DELIVERY';
        AmountCaptionLbl: Label 'Amount';
        Sales_Invoice_Line__Unit_Price_CaptionLbl: Label 'Rate';
        Sales_Invoice_Line_QuantityCaptionLbl: Label 'Quantity';
        Sales_Invoice_Line__Unit_of_Measure_CaptionLbl: Label 'UOM';
        ISSUE_DATELbl: Label 'ISSUE DATE';
        Sales_Order_DateLbl: Label 'Order Date';
        TotalCaptionLbl: Label 'Total';
        BENEFICIARY_BANKCaptionLbl: Label 'BENEFICIARY BANK';
        ACCOUNT_NO_CaptionLbl: Label 'ACCOUNT NO.';
        BRANCHCaptionLbl: Label 'BRANCH';
        SWIFTCaptionLbl: Label 'SWIFT Address';
        CORRESPONDING_BANKCaptionLbl: Label 'CORRESPONDING BANK';
        SWIFTCaption_Control1000000067Lbl: Label 'SWIFT Code';
        FOR_GULF_PETROCHEM_PTE__LTD_CaptionLbl: Label 'FOR GULF PETROCHEM PTE. LTD.';
        AUTHORISED_SIGNATORYCaptionLbl: Label 'AUTHORISED SIGNATORY';
        FOR_GST_PURPOSE_ONLYCaptionLbl: Label 'FOR GST PURPOSE ONLY';
        V1__EXCHANGE_RATE_CaptionLbl: Label '1. EXCHANGE RATE:';
        V2__GST_TYPE_CaptionLbl: Label '2. GST TYPE:';
        GST_AMOUNTCaptionLbl: Label 'GST AMOUNT';
        BENEFICIARY_NameCaptionLbl: Label 'BENEFICIARY Name';
        BENEFICIARY_AddressCaptionLbl: Label 'BENEFICIARY Address';
        Incorporate_captionLbl: Label 'IBAN NO.';
        "-----------------------------------": Integer;
        //FacilityUtlizationRec: Record 50003;      //Temp comment
        VATAmt29: Decimal;
        DischargePortName: Text[60];
        TextBool: Boolean;
        ShipToCountry: Text;
        "---------------------------------------------------------------": Integer;
        CountryTable: Record 9;
        CompCountry: Text[20];
        CustomerRec: Record 18;
        CustVATNo: Text[20];
        CustomerCountry: Text[20];
        PaymentTerms: Record 3;
        PaymentTermsDesc: Text[150];
        BankAccount: Record 270;
        BankAcc: Text[50];
        BANKName: Text[50];
        BankAdd: array[13] of Text[100];
        AdvancedReceived: Decimal;
        CustLedEntryRec: Record 21;
        FOBvalue: Decimal;
        Freightvalue: Decimal;
        FOBQty: Decimal;
        FreightQty: Decimal;
        TotalFOBQty: Decimal;
        TotalFreightQty: Decimal;
        TotalLineAmount: Decimal;
        TotalBalAmntRecvble: Decimal;
        SILRec: Record 113;
        FOB_Bifurcation: Boolean;
        Origin_Country: Text[20];
        LoadPortDesciption: Text[100];
        DichargePort: Text[100];
        EntryEXit: Record 282;
        RDMPortMaster: Record "REDM Port Master";
        CountryOrigin: Record 349;
        BankCountry: Record "Country/Region";
        Srno: Integer;
        Sumqty: Decimal;
        SILine: Record 113;
}

