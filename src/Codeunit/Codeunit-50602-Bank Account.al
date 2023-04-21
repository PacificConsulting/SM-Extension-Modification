codeunit 50602 "Bank Account Alerts"
{
    trigger OnRun()
    begin
        SendMail();
    end;

    var
        VarEmailSender: Text[150];
        EmailAcc: Record 8902;
        VarRecipaint: List of [Text];
        VarcompName: Text[150];
        Varsubject: Text[150];
        NewReceipt: List of [Text];
        UserReceipt: List of [Text];
        srno: Integer;
        GEnLedSetup: Record "General Ledger Setup";
        Emailmessage: Codeunit "Email Message";
        Email: Codeunit Email;
        BodyText: BigText;

    procedure SendMail()
    var
        BankAcc: Record "Bank Account";
    begin
        GEnLedSetup.Get();
        GEnLedSetup.TestField("Email Alerts");

        VarRecipaint.Add(GEnLedSetup."Email Id");
        IF Not VarRecipaint.Contains('') then begin
            VarEmailSender := 'steelmont.erp@steelmont.net';
            Varsubject := 'Bank balance as on: ';
            BodyText.AddText('Dear Sir/Madam');
            BodyText.AddText('<br><Br>');
            BodyText.AddText('Bank balance as on: ' + Format(Today));
            BodyText.AddText('<br><Br>');
            BodyText.AddText('<table border="0">');
            BodyText.AddText('<br><Br>');
            BodyText.AddText('<tr style="background-color:#507CD1; color:#fff">');
            BodyText.AddText('<th> No.           </th>');
            BodyText.AddText('<th> Name     </th>');
            BodyText.AddText('<th> Currency Code       </th>');
            BodyText.AddText('<th> Bank Account No    </th>');
            BodyText.AddText('<th> Balance       </th>');
            BodyText.AddText('<th> Balance (LCY)           </th>');
            BodyText.AddText('</tr>');
            srno := 0;
            Message('hello');
            BankAcc.RESET;
            BankAcc.SetRange("Email Alerts", true);
            IF BankAcc.FindSet() THEN BEGIN
                REPEAT
                    srno += 1;
                    BodyText.AddText('<tr style="background-color:#EFF3FB; color:black">');
                    BodyText.AddText('<td>' + FORMAT(BankAcc."No.") + '</td>');
                    BodyText.AddText('<td>' + BankAcc.Name + '</td>');
                    BodyText.AddText('<td>' + BankAcc."Currency Code" + '</td>');
                    BodyText.AddText('<td>' + BankAcc."Bank Account No." + '</td>');
                    BodyText.AddText('<td>' + format(BankAcc.Balance) + '</td>');
                    BodyText.AddText('<td>' + FORMAT(BankAcc."Balance (LCY)") + '</td>');
                    BodyText.AddText('</tr>');
                UNTIL BankAcc.NEXT = 0;
            END;
            BodyText.AddText('</table>');
            BodyText.AddText('<table border="0">');
            BodyText.AddText('<tr>');
            BodyText.AddText('</tr>');
            BodyText.AddText('</table>');
            BodyText.AddText('<br><Br>');
            BodyText.AddText('<table border="0">');
            BodyText.AddText('<tr>');
            BodyText.AddText('<td style="text-align:left" colspan=8><b>' + 'Thanks & Regards' + '</b></td>');
            BodyText.AddText('</tr>');
            BodyText.AddText('<tr>');
            BodyText.AddText('<td style="text-align:left" colspan=8><b>' + '' + '</b></td>');
            BodyText.AddText('</tr>');
            BodyText.AddText('<tr style= "color:#507CD1">');
            BodyText.AddText('<td style="text-align:left" colspan=8><b> ' + VarcompName + '</b></td>');
            BodyText.AddText('</tr>');
            BodyText.AddText('</table>');
            Emailmessage.Create(VarRecipaint, Varsubject, Format(BodyText), true, UserReceipt, NewReceipt);
            Email.Send(Emailmessage, Enum::"Email Scenario"::Default);
            Message('done');
        End;
    END;

}