codeunit 50607 "Opportunity Alerts"
{
    trigger OnRun()
    begin
        SendMail();
    end;

    var
        VarEmailSender1: Text[150];
        OutStr: OutStream;
        Recref: RecordRef;
        InStr: InStream;
        TempBlob: Codeunit "Temp Blob";
        EmailAcc1: Record 8902;
        Cnt: Integer;
        VarRecipaint1: List of [Text];
        VarcompName: Text[150];
        Varsubject: Text[150];
        NewReceipt1: List of [Text];
        UserReceipt1: List of [Text];
        srno: Integer;
        SalRec: Record "Sales & Receivables Setup";
        Emailmessage: Codeunit "Email Message";
        Email1: Codeunit Email;
        BodyText1: BigText;
        EmailText1: Text;

    procedure SendMail()
    var
        EnqList: Record "REDM Deal Header";
    begin
        Clear(VarRecipaint1);
        Clear(Email1);
        Clear(BodyText1);
        SalRec.Get();
        SalRec.TestField("Email ID for Opportunity");
        EmailText1 := SalRec."Email ID for Opportunity";
        VarRecipaint1.AddRange(EmailText1.Split(';'));

        EnqList.Reset();
        EnqList.SetFilter(Status, '%1|%2|%3', EnqList.Status::Open, EnqList.Status::Lost, EnqList.Status::Confirmed);
        EnqList.SetRange(Type, EnqList.Type::Quote);
        IF EnqList.FINDFIRST THEN BEGIN
            Message('hi');
            VarEmailSender1 := 'steelmont.erp@steelmont.net';
            Varsubject := 'Opportunity as on: ' + FORMAT(TODAY, 0, '<Day,2>/<Month,2>/<Year4>');
            BodyText1.AddText('Hi All,');
            BodyText1.AddText('<br><Br>');
            BodyText1.AddText('Opportunity as on: ' + FORMAT(TODAY, 0, '<Day,2>/<Month,2>/<Year4>') + ' for ' + CompanyName);
            BodyText1.AddText('<br><Br>');

            Emailmessage.Create(VarRecipaint1, Varsubject, Format(BodyText1), true, UserReceipt1, NewReceipt1);
            Recref.GetTable(EnqList);
            TempBlob.CreateOutStream(OutStr);
            Report.SaveAs(Report::"Enquiry Report", '', ReportFormat::Excel, OutStr, Recref);
            TempBlob.CreateInStream(InStr);
            EmailMessage.AddAttachment('OPPORTUNITY AS ON.xlsx', '.xlsx', InStr);
        END;
        Email1.Send(Emailmessage, Enum::"Email Scenario"::Default);
        Message('Done');
    END;


}