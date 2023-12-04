report 50610 "Enquiry Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Enquiry - 1.rdl';

    dataset
    {
        dataitem("REDM Deal Header"; "REDM Deal Header")
        {
            RequestFilterFields = "Enquiry Date", "Deal No.";
            DataItemTableView = where("REDM Created Dt" = filter(010123 ..), Status = filter(Open | Lost | COnfirmed), Type = filter(Quote));

            column(Deal_No_; "Deal No.")
            {
            }
            column(DataShow; DataShow)
            {

            }
            column(Deal_Date; "Enquiry Date")
            { }

            column(Purchases; Purchases)
            { }
            column(Deal_Description; "Deal Description")
            { }
            column(Deal_Remarks; "Deal Remarks")
            { }
            column(Status; Status)
            { }
            column(Sales_Cycle_Stages; "Sales Cycle Stages")
            { }
            column(Customer_Name; "Customer Name")
            { }
            column(REDM_Destination_Country; DimValName)
            { }
            column(REDM_Country_Of_Origin; DimValctrName)
            { }
            column(Load_Port; LoadPortDecription)
            { }
            column(Discharge_Port; DisPortDecription)
            { }
            column(Vessel_Code; VesselPortDecription)
            {
            }
            column(Trader; SalPerName)
            { }
            column(System_Created_By_Name; "System Created By Name")
            {

            }
            column(REDM_Created_Dt; "REDM Created Dt")
            { }
            trigger OnAfterGetRecord()
            begin

                CreatDate := DT2DATE("REDM Created Dt");
                CYear := Date2DMY(Today, 3);
                varDate := DMY2Date(01, 01, CYear);
                //Message(Format(varDate));

                IF CreatDate < 20230101D then
                    CurrReport.Skip();

                IF ("REDM Deal Header".Status = "REDM Deal Header".Status::Lost) AND (CreatDate < varDate) then
                    CurrReport.Skip();

                RDate := CalcDate('-6D', today);

                Clear(DataShow);
                if CreatDate >= RDate then begin
                    DataShow := true;
                end;

                Clear(DimValName);
                DimVal.Reset();
                DimVal.SetRange("Dimension Code", 'DEST_CO');
                DimVal.SetRange(Blocked, false);
                DimVal.SetRange(Code, "REDM Destination Country");
                if DimVal.FindFirst() then
                    DimValName := DimVal.Name;

                Clear(DimValctrName);
                DimValctr.Reset();
                DimValctr.SetRange("Dimension Code", 'ORIG_CO');
                DimValctr.SetRange(Blocked, false);
                DimValctr.SetRange(Code, "REDM Country Of Origin");
                if DimValctr.FindFirst() then
                    DimValctrName := DimValctr.Name;

                Clear(LoadPortDecription);
                LoadPort.Reset();
                LoadPort.SetRange(Type, LoadPort.Type::"Load Port");
                LoadPort.SetRange(Code, "REDM Load Port");
                if LoadPort.FindFirst() then
                    LoadPortDecription := LoadPort.Decription;

                Clear(DisPortDecription);
                DisPort.Reset();
                DisPort.SetRange(Type, DisPort.Type::"Discharge Port");
                DisPort.SetRange(Code, "REDM Discharge Port");
                if DisPort.FindFirst() then
                    DisPortDecription := DisPort.Decription;

                Clear(VesselPortDecription);
                VesselPort.Reset();
                VesselPort.SetRange(Type, VesselPort.Type::Vessel);
                VesselPort.SetRange(Code, "REDM Vessel Code");
                if VesselPort.FindFirst() then
                    VesselPortDecription := VesselPort.Decription;

                Clear(SalPerName);
                SalPer.Reset();
                SalPer.SetRange(Code, "REDM Trader");
                if SalPer.FindFirst() then
                    SalPerName := SalPer.Name;

            end;
        }
    }


    var
        myInt: Integer;
        DimVal: Record 349;
        DimValctr: Record 349;
        LoadPort: record 51411006;
        SalPer: Record "Salesperson/Purchaser";
        VesselPort: Record "REDM Port Master";
        DisPort: Record "REDM Port Master";
        varDate: Date;
        CreatDate: date;
        CYear: Integer;
        DimValName: Text;
        DimValctrName: Text;
        LoadPortDecription: Text;
        DisPortDecription: Text;
        VesselPortDecription: Text;
        SalPerName: Text;
        RDate: Date;
        DataShow: Boolean;

}