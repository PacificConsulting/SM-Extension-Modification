codeunit 50602 "Bank Account Alerts"
{
    trigger OnRun()
    begin
        SendMail();
    end;

    var
        VarEmailSender: Text[150];
        EmailAcc: Record 8902;
        Cnt: Integer;
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
        EmailText: Text;
        DecamtLcy: decimal;
        TextAmtLcy: Text;
        CntAmtLcy: Integer;
        fortextAmtLcy: text;
        AmountLcy: Decimal;

    procedure SendMail()
    var
        BankAcc: Record "Bank Account";
    begin
        GEnLedSetup.Get();
        GEnLedSetup.TestField("Email Alerts");
        EmailText := GEnLedSetup."Email Id";
        VarRecipaint.AddRange(EmailText.Split(';'));
        // VarRecipaint.Add(GEnLedSetup."Email Id");
        srno := 0;
        Clear(Cnt);
        BankAcc.RESET;
        BankAcc.SetRange("Email Alerts", true);
        BankAcc.SetFilter(Balance, '<>%1', 0);
        IF BankAcc.FindSet() THEN BEGIN
            REPEAT
                BankAcc.CalcFields(Balance);
                BankAcc.CalcFields("Balance (LCY)");
                cnt := BankAcc.Count;
                if (BankAcc.Balance <> 0) And (Not VarRecipaint.Contains('')) then begin
                    if srno = 0 then begin
                        VarEmailSender := 'steelmont.erp@steelmont.net';
                        Varsubject := 'Bank balance as on: ' + FORMAT(TODAY, 0, '<Day,2>/<Month,2>/<Year4>');
                        BodyText.AddText('Hi All,');
                        BodyText.AddText('<br><Br>');
                        BodyText.AddText('Bank balance as on: ' + FORMAT(TODAY, 0, '<Day,2>/<Month,2>/<Year4>') + ' for ' + CompanyName);
                        BodyText.AddText('<br><Br>');
                        BodyText.AddText('<table border="1">');
                        BodyText.AddText('<tr style="background-color:#507CD1; color:#fff">');
                        BodyText.AddText('<th align="center"> Name                             </th>');
                        BodyText.AddText('<th align="center"> Currency Code       </th>');
                        BodyText.AddText('<th align="center"> Bank Account No    </th>');
                        BodyText.AddText('<th align="center"> Balance       </th>');
                        BodyText.AddText('<th align="center"> Balance (LCY)           </th>');
                        BodyText.AddText('</tr>');
                    end;
                    srno += 1;
                    Clear(DecamtLcy);
                    Clear(AmountLcy);
                    clear(TextAmtLcy);
                    Clear(CntAmtLcy);
                    Clear(fortextAmtLcy);
                    AmountLcy := Round(BankAcc."Balance (LCY)", 0.01);
                    DecamtLcy := ABS((AmountLcy) - Round(AmountLcy, 1));
                    TextAmtLcy := CopyStr(Format(DecamtLcy), 3);
                    CntAmtLcy := StrLen(Format(TextAmtLcy));
                    IF CntAmtLcy = 1 then
                        fortextAmtLcy := '0';
                    // IF CntAmtLcy = 1 then
                    //     fortextAmtLcy := '00';
                    IF CntAmtLcy = 0 then
                        fortextAmtLcy := '.00';

                    if srno <> 0 then begin
                        //BodyText.AddText('<tr style="background-color:#EFF3FB; color:black">');
                        BodyText.AddText('<td>' + BankAcc.Name + '</td>');
                        BodyText.AddText('<td align="center">' + BankAcc."Currency Code" + '</td>');
                        BodyText.AddText('<td align="center"> ' + BankAcc."Bank Account No." + '</td>');
                        BodyText.AddText('<td align="right" >' + format(BankAcc.Balance) + '</td>');
                        BodyText.AddText('<td align="right" >' + Format(AmountLcy) + fortextAmtLcy + '</td>');
                        BodyText.AddText('</tr>');
                    end;
                    if srno = Cnt then begin
                        BodyText.AddText('</table>');
                        BodyText.AddText('<br><Br>');
                        BodyText.AddText('<table border="0">');
                        BodyText.AddText('<tr>');
                        BodyText.AddText('<td style="text-align:left" colspan=8><b>' + 'Thanks & Regards' + '</b></td>');
                        BodyText.AddText('</tr>');
                        Emailmessage.Create(VarRecipaint, Varsubject, Format(BodyText), true, UserReceipt, NewReceipt);
                        Email.Send(Emailmessage, Enum::"Email Scenario"::Default);
                        Message('Done');
                    end;
                end;
            UNTIL BankAcc.NEXT = 0;
        End;
    END;

}