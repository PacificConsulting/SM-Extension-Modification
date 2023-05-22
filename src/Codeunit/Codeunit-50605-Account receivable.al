codeunit 50605 "Account Receivable Alerts"
{
    trigger OnRun()
    begin
        SendMailtoCustomer();
    end;

    var
        VarEmailSender1: Text[150];
        OutStr: OutStream;
        Recref: RecordRef;
        InStr: InStream;
        TempBlob: Codeunit "Temp Blob";
        CLE: Record "Cust. Ledger Entry";
        EmailAcc1: Record 8902;
        Cnt: Integer;
        VarRecipaint1: List of [Text];
        VarcompName: Text[150];
        Varsubject: Text[150];
        NewReceipt1: List of [Text];
        UserReceipt1: List of [Text];
        srno: Integer;
        SalreceiveSet: Record "Sales & Receivables Setup";
        Emailmessage: Codeunit "Email Message";
        Email1: Codeunit Email;
        BodyText1: BigText;
        DimSetEntry: Record 480;
        EmailText1: Text;
        DecamtLcy: decimal;
        TextAmtLcy: Text;
        CntAmtLcy: Integer;
        fortextAmtLcy: text;
        AmountLcy: Decimal;
        DecInventory: decimal;
        TextInventory: Text;
        CntInventory: Integer;
        fortextInv: text;
        InvTotal: Decimal;
        SIH: Record "Sales Invoice Header";
        SalesName: Text;

    procedure SendMailtoCustomer()
    var
        Cust: Record Customer;
    begin
        Clear(VarRecipaint1);
        Clear(Email1);
        Clear(BodyText1);
        SalreceiveSet.Get();
        SalreceiveSet.TestField("Email Alerts");
        EmailText1 := SalreceiveSet."Email Id";
        VarRecipaint1.AddRange(EmailText1.Split(';'));
        srno := 0;
        Clear(Cnt);

        CLE.Reset();
        CLE.SetRange(Open, true);
        CLE.SetFilter("Due Date", '<%1', Today);
        //CLE.SetFilter("Posting Date", '%1..%2', 20220101D, Today);   //temp filter only for test DB 
        IF CLE.FindSet() THEN BEGIN
            REPEAT
                CLE.CalcFields(Amount, "Amount (LCY)", "Remaining Amount", "Remaining Amt. (LCY)", "Shortcut Dimension 3 Code");
                if Cust.Get(CLE."Customer No.") then;
                SIH.Reset();
                SIH.SetRange("No.", CLE."Document No.");
                if SIH.FindFirst() then;
                Clear(SalesName);
                DimSetEntry.Reset();
                DimSetEntry.SetRange("Dimension Set ID", CLE."Dimension Set ID");
                DimSetEntry.SetRange("Global Dimension No.", 3);
                DimSetEntry.SetRange("Dimension Value Code", CLE."Shortcut Dimension 3 Code");
                if DimSetEntry.FindFirst() then begin
                    SalesName := DimSetEntry."Dimension Value Name";
                end;
                cnt := CLE.Count;
                if (Not VarRecipaint1.Contains('')) then begin
                    if srno = 0 then begin
                        VarEmailSender1 := 'steelmont.erp@steelmont.net';
                        Varsubject := 'Account Receivable as on: ' + FORMAT(TODAY, 0, '<Day,2>/<Month,2>/<Year4>');
                        BodyText1.AddText('Hi All,');
                        BodyText1.AddText('<br><Br>');
                        BodyText1.AddText('Account receivable as on: ' + FORMAT(TODAY, 0, '<Day,2>/<Month,2>/<Year4>') + ' for ' + CompanyName);
                        BodyText1.AddText('<br><Br>');
                        //BodyText1.AddText('<table style="width:180%" border="1">');
                        BodyText1.AddText('<table border="1">');
                        BodyText1.AddText('<tr style="background-color:#507CD1;color:#fff";align="center">');
                        BodyText1.AddText('<th align="center" > Posting Date </th>');
                        BodyText1.AddText('<th align="center" > Document Date </th>');
                        BodyText1.AddText('<th align="center"> Invoice No. </th>');
                        BodyText1.AddText('<th align="center"> Vendor Name </th>');
                        BodyText1.AddText('<th align="center"> Deal </th>');
                        BodyText1.AddText('<th align="center"> Currency Code  </th>');
                        BodyText1.AddText('<th align="center"> Receivable Amount     </th>');
                        BodyText1.AddText('<th align="center"> Receivable Amount (LCY)   </th>');
                        BodyText1.AddText('<th align="center"> Due Date      </th>');
                        BodyText1.AddText('</tr>');
                    end;
                    srno += 1;
                    if srno <> 0 then begin
                        BodyText1.AddText('<td align="center">' + FORMAT(CLE."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>') + '</td>');
                        BodyText1.AddText('<td align="center">' + FORMAT(CLE."Document Date", 0, '<Day,2>/<Month,2>/<Year4>') + '</td>');
                        BodyText1.AddText('<td align="center">' + SIH."External Document No." + '</td>');
                        BodyText1.AddText('<td>' + Cust.Name + '</td>');
                        BodyText1.AddText('<td>' + CLE."Global Dimension 1 Code" + '</td>');
                        BodyText1.AddText('<td align="center">' + CLE."Currency Code" + '</td>');
                        BodyText1.AddText('<td align="right">' + Format(CLE."Remaining Amount") + '</td>');
                        BodyText1.AddText('<td align="right">' + Format(CLE."Remaining Amt. (LCY)") + '</td>');
                        BodyText1.AddText('<td align="center">' + FORMAT(CLE."Due Date", 0, '<Day,2>/<Month,2>/<Year4>') + '</td>');
                        BodyText1.AddText('</tr>');
                    end;
                    if srno = Cnt then begin
                        BodyText1.AddText('</table>');
                        BodyText1.AddText('<br><Br>');
                        BodyText1.AddText('<table border="0">');
                        BodyText1.AddText('<tr>');
                        BodyText1.AddText('<td style="text-align:left" colspan=8><b>' + 'Thanks & Regards' + '</b></td>');
                        BodyText1.AddText('</tr>');
                        Emailmessage.Create(VarRecipaint1, Varsubject, Format(BodyText1), true, UserReceipt1, NewReceipt1);
                        Email1.Send(Emailmessage, Enum::"Email Scenario"::Default);
                        Message('Done');
                    END;
                end;
            UNTIL CLE.Next() = 0;
        End;
    END;
}