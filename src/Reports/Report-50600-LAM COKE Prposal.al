report 50600 "PROPOSAL-COAL/COKE"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\LAM COKE -2.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";
            column(logo; CompInfo.Picture)
            {

            }
            column(Currency_Code; "Currency Code")
            {

            }
            column(UOM; UOM)
            {

            }
            column(REDM_Document_Tolerance; "REDM Document Tolerance")
            {

            }
            column(REDM_Discharge_Terms; "REDM Discharge Terms")
            {

            }
            column(Delivery_Terms; "REDM Delivery Time")
            {

            }
            column(REDM_Load_Port; REDMPort.Decription)
            {

            }

            column(CountryDesc; RecCountry.Name)
            {

            }
            column(Compadd; CompInfo.Address)
            {

            }
            column(CompAdd2; CompInfo."Address 2")
            {

            }
            column(Postcode; CompInfo."Post Code")
            {

            }
            column(CompCity; CompInfo.City)
            {

            }
            column(CompPhoneNo; CompInfo."Phone No.")
            {

            }
            column(CompEmail; CompInfo."E-Mail")
            {

            }

            column(No_; "No.")
            {
            }
            column(Shipping_Conditions; "Shipping Conditions")
            {

            }
            column(Payment_Term_Condition; "Payment Term/Condition")
            {

            }
            column(ItemDesc; ItemDesc)
            {

            }
            column(REDM_Country_of_Origin; RedmCountry.Name)
            {
            }
            column(Quality_And_Weight; "Quality And Weight")
            {

            }
            column(Validity_And_Subject; "Validity And Subject")
            {

            }
            column(Other_Terms_And_Condition; "Other Terms And Condition")
            {

            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(Sell_to_Address; "Sell-to Address")
            {

            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }
            column(Sell_to_Customer_Name_2; "Sell-to Customer Name 2")
            {

            }
            column(Ship_to_Name; "Ship-to Name")
            {

            }
            column(Ship_to_Name_2; "Ship-to Name 2")
            {

            }
            column(REDM_Inco_Terms_Delivery_Terms; "REDM Inco Terms/Delivery Terms")
            {

            }
            column(SHAmount; Amount)
            {

            }
            column(Qty; Qty)
            {

            }
            column(UnitPrice; UnitPrice)
            {

            }
            // dataitem("Sales Line"; "Sales Line")
            // {
            //     DataItemLink = "Document No." = FIELD("No.");
            //     DataItemLinkReference = "Sales Header";

            //     column(Item_No_; "Sales Line"."No.")
            //     {

            //     }
            // }
            dataitem("REDM Item Specification (Sale)"; "REDM Item Specification (Sale)")
            {
                DataItemLink = "REDM Document No." = field("No.");
                DataItemLinkReference = "Sales Header";
                column(REDM_Parameter_Code; "REDM Parameter Code")
                {

                }
                column(REDM_Parameter_UOM; "REDM Parameter UOM")
                {

                }

                column(REDM_Guaranteed_Value; "REDM Guaranteed Value")
                {

                }
                column(REDM_Rejected_Value; "REDM Rejected Value")
                {

                }
                column(REDM_Additional_Description; "REDM Additional Description")
                {

                }
                column(REDM_Parameter_Description; "REDM Parameter Description")
                {

                }
                column(Srno; Srno)
                {

                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    Srno += 1;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                if RecCountry.Get(CompInfo."Country/Region Code") then;
                if RedmCountry.Get("REDM Country of Origin") then;
                REDMPort.Reset();
                REDMPort.SetRange(Code, "REDM Load Port");
                if REDMPort.FindFirst() then;
                Clear(ItemDesc);
                Clear(UnitPrice);
                Clear(Qty);
                Clear(UOM);
                SL.Reset();
                SL.SetRange("Document No.", "No.");
                SL.SetFilter("No.", '<>%1', '');
                if SL.FindSet() then
                    repeat
                        UOM := SL."Unit of Measure";
                        Qty += SL.Quantity;
                        UnitPrice += SL."Unit Price";

                        if ItemDesc = '' then
                            ItemDesc := SL.Description
                        else
                            ItemDesc := ItemDesc + ',' + SL.Description;
                    until SL.Next() = 0;
            end;
        }
    }

    trigger OnInitReport();
    begin
        CompInfo.GET;
        CompInfo.CALCFIELDS(Picture);
    end;

    var
        Srno: Integer;
        CompInfo: Record 79;
        ItemDesc: text;
        SL: Record 37;
        Qty: Decimal;
        UnitPrice: Decimal;
        RecCountry: Record "Country/Region";
        RedmCountry: Record "Country/Region";
        UOM: Text;
        REDMPort: Record "REDM Port Master";// 51411006
                                            //REDmIcoterm : Record 

}