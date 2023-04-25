codeunit 50603 "Stock Position Alerts"
{
    trigger OnRun()
    begin
        SendMail();
    end;

    var
        VarEmailSender1: Text[150];
        OutStr: OutStream;
        TextFinalAmtLcy: Text;
        DecFinalAmtLcy: Decimal;
        TotalInv: Decimal;
        Recref: RecordRef;
        InStr: InStream;
        TempBlob: Codeunit "Temp Blob";
        ILE: Record "Item Ledger Entry";
        EmailAcc1: Record 8902;
        Cnt: Integer;
        VarRecipaint1: List of [Text];
        VarcompName: Text[150];
        Varsubject: Text[150];
        NewReceipt1: List of [Text];
        UserReceipt1: List of [Text];
        srno: Integer;
        InvSetup: Record "Inventory Setup";
        Emailmessage: Codeunit "Email Message";
        Email1: Codeunit Email;
        BodyText1: BigText;
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

    procedure SendMail()
    var
        RecItem: Record Item;
    begin
        Clear(VarRecipaint1);
        Clear(Email1);
        Clear(BodyText1);
        InvSetup.Get();
        InvSetup.TestField("Email Alerts");
        EmailText1 := InvSetup."Email Id";
        VarRecipaint1.AddRange(EmailText1.Split(';'));
        // VarRecipaint.Add(GEnLedSetup."Email Id");
        srno := 0;
        Clear(Cnt);
        Clear(TotalInv);
        RecItem.RESET;
        RecItem.SetFilter(Inventory, '<>%1', 0);
        RecItem.SetFilter(Type, '<>%1', RecItem.Type::"Non-Inventory");
        IF RecItem.FindSet() THEN BEGIN
            REPEAT
                RecItem.CalcFields(Inventory);
                cnt := RecItem.Count;
                if (RecItem.Inventory <> 0) And (Not VarRecipaint1.Contains('')) then begin
                    if srno = 0 then begin
                        VarEmailSender1 := 'steelmont.erp@steelmont.net';
                        Varsubject := 'Stock position as on: ' + FORMAT(TODAY, 0, '<Day,2>/<Month,2>/<Year4>');
                        BodyText1.AddText('Hi All,');
                        BodyText1.AddText('<br><Br>');
                        BodyText1.AddText('Stock position as on: ' + FORMAT(TODAY, 0, '<Day,2>/<Month,2>/<Year4>') + ' for ' + CompanyName);
                        BodyText1.AddText('<br><Br>');
                        BodyText1.AddText('<table border="1">');
                        BodyText1.AddText('<tr style="background-color:#507CD1; color:#fff">');
                        BodyText1.AddText('<th align="center"> Name                             </th>');
                        BodyText1.AddText('<th align="center"> Unit of Measure      </th>');
                        BodyText1.AddText('<th align="center"> Inventory      </th>');
                        BodyText1.AddText('</tr>');
                    end;
                    srno += 1;
                    Clear(DecamtLcy);
                    Clear(AmountLcy);
                    clear(TextAmtLcy);
                    Clear(CntAmtLcy);
                    Clear(fortextAmtLcy);
                    AmountLcy := Round(RecItem.Inventory, 0.001);
                    DecamtLcy := ABS((AmountLcy) - Round(AmountLcy, 1));
                    TextAmtLcy := CopyStr(Format(DecamtLcy), 3);
                    CntAmtLcy := StrLen(Format(TextAmtLcy));
                    IF CntAmtLcy = 2 then
                        fortextAmtLcy := '0';
                    IF CntAmtLcy = 1 then
                        fortextAmtLcy := '00';
                    IF CntAmtLcy = 0 then
                        fortextAmtLcy := '.000';

                    TotalInv += AmountLcy;

                    if srno <> 0 then begin
                        BodyText1.AddText('<td>' + RecItem.Description + '</td>');
                        BodyText1.AddText('<td align="center">' + RecItem."Base Unit of Measure" + '</td>');
                        BodyText1.AddText('<td align="right" >' + format(AmountLcy) + fortextAmtLcy + '</td>');
                        BodyText1.AddText('</tr>');
                    end;

                    if srno = Cnt then begin
                        InvTotal := Round(TotalInv, 0.001);
                        DecInventory := ABS((InvTotal) - Round(InvTotal, 1));
                        TextInventory := CopyStr(Format(DecInventory), 3);
                        CntInventory := StrLen(Format(TextInventory));
                        IF CntInventory = 2 then
                            fortextInv := '0';
                        IF CntInventory = 1 then
                            fortextInv := '00';
                        IF CntInventory = 0 then
                            fortextInv := '.000';

                        BodyText1.AddText('<td> <B>' + 'Total' + '</td>');
                        BodyText1.AddText('<td> <B>' + '' + '</td>');
                        BodyText1.AddText('<td align="right"> <B>' + Format(InvTotal) + fortextInv + '</td>');
                        BodyText1.AddText('</table>');
                        BodyText1.AddText('<br><Br>');
                        BodyText1.AddText('<table border="0">');
                        BodyText1.AddText('<tr>');
                        BodyText1.AddText('<td style="text-align:left" colspan=8><b>' + 'Thanks & Regards' + '</b></td>');
                        BodyText1.AddText('</tr>');
                        Emailmessage.Create(VarRecipaint1, Varsubject, Format(BodyText1), true, UserReceipt1, NewReceipt1);
                        ILE.Reset();
                        ILE.SetFilter("Remaining Quantity", '<>%1', 0);
                        IF ILE.FINDFIRST THEN BEGIN
                            Recref.GetTable(ILE);
                            TempBlob.CreateOutStream(OutStr);
                            Report.SaveAs(Report::"Stock Position", '', ReportFormat::Pdf, OutStr, Recref);
                            TempBlob.CreateInStream(InStr);
                            EmailMessage.AddAttachment('STOCK POSITION AS ON.pdf', '.pdf', InStr);
                        END;
                        Email1.Send(Emailmessage, Enum::"Email Scenario"::Default);
                        Message('Done');
                    END;

                end;
            UNTIL RecItem.NEXT = 0;
        End;
    END;
}