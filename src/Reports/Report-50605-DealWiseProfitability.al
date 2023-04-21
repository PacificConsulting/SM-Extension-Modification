report 50605 "Deal Wise Profitability"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\DealWiseProfitNew.rdl';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            RequestFilterFields = "Global Dimension 1 Code";
            //DataItemTableView = where("REDM Expens DealWise Statement" = filter(true));
            column(GLprodgroup; GenPrdgrp.Description)
            {

            }
            column(GLDeal_No_; "REDM Deal No.")
            {

            }
            column(GLDocument_No_; "Document No.") { }
            column(Amount; Amount)
            { }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                GenPrdgrp.Reset();
                GenPrdgrp.SetRange(Code, "Gen. Prod. Posting Group");
                if GenPrdgrp.FindFirst() then;

                CountryTable.RESET;
                CountryTable.SETRANGE(CountryTable.Code, CompInfo."Country/Region Code");
                IF CountryTable.FINDFIRST THEN
                    CompCountry := CountryTable.Name;

                CompInfo.GET;
                CompInfo.CALCFIELDS(CompInfo.Picture);
            end;
        }
    }


    var
        myInt: Integer;
        CompInfo: Record 79;
        CountryTable: Record 9;
        CompCountry: Text;
        GenPrdgrp: Record 251;
        ValueEntry: Record "Value Entry";
        PIH: Record 122;
        SIH: Record 112;
        COGSvalue: Decimal;
}