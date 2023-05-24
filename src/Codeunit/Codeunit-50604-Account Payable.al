codeunit 50604 "Account Payable Alerts"
{
    trigger OnRun()
    begin
        SendMailtoVendor();
    end;

    var
        VarEmailSender1: Text[150];
        VLE1: Record "Vendor Ledger Entry";
        OutStr: OutStream;
        TotalInv: Decimal;
        Recref: RecordRef;
        InStr: InStream;
        TempBlob: Codeunit "Temp Blob";
        VLE: Record "Vendor Ledger Entry";
        EmailAcc1: Record 8902;
        Cnt: Integer;
        VarRecipaint1: List of [Text];
        VarcompName: Text[150];
        Varsubject: Text[150];
        NewReceipt1: List of [Text];
        UserReceipt1: List of [Text];
        srno: Integer;
        PurchPaySet: Record "Purchases & Payables Setup";
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
        PIH: Record "Purch. Inv. Header";
        SalesName: Text;
        VendPostGrp: Record "Vendor Posting Group";

    procedure SendMailtoVendor()
    var
        REcVendor: Record Vendor;
    begin
        Clear(VarRecipaint1);
        Clear(Email1);
        Clear(BodyText1);
        PurchPaySet.Get();
        PurchPaySet.TestField("Email Alerts");
        EmailText1 := PurchPaySet."Email Id";
        VarRecipaint1.AddRange(EmailText1.Split(';'));
        srno := 0;
        Clear(Cnt);


        VLE.Reset();
        VLE.SetRange(Open, true);
        VLE.SetFilter("Posting Date", '<%1', Today);
        //VLE.SetFilter("Posting Date", '%1..%2', 20220101D, Today);   //temp filter only for test DB 
        IF VLE.FindSet() THEN BEGIN
            REPEAT
                VendPostGrp.Reset();
                VendPostGrp.SetRange(Code, VLE."Vendor Posting Group");
                VendPostGrp.SetRange("Email Alert", true);
                if VendPostGrp.FindFirst() then begin
                    VLE.CalcFields(Amount, "Amount (LCY)", "Remaining Amount", "Remaining Amt. (LCY)", "Shortcut Dimension 3 Code");
                    if REcVendor.Get(VLE."Vendor No.") then;
                    PIH.Reset();
                    PIH.SetRange("No.", VLE."Document No.");
                    if PIH.FindFirst() then;
                    Clear(SalesName);
                    DimSetEntry.Reset();
                    DimSetEntry.SetRange("Dimension Set ID", VLE."Dimension Set ID");
                    DimSetEntry.SetRange("Global Dimension No.", 3);
                    DimSetEntry.SetRange("Dimension Value Code", VLE."Shortcut Dimension 3 Code");
                    if DimSetEntry.FindFirst() then begin
                        SalesName := DimSetEntry."Dimension Value Name";
                    end;
                    cnt := VLE.Count;
                    if (Not VarRecipaint1.Contains('')) then begin
                        if srno = 0 then begin
                            VarEmailSender1 := 'steelmont.erp@steelmont.net';
                            Varsubject := 'Account Payable as on: ' + FORMAT(TODAY, 0, '<Day,2>/<Month,2>/<Year4>');
                            BodyText1.AddText('Hi All,');
                            BodyText1.AddText('<br><Br>');
                            BodyText1.AddText('Account payable as on: ' + FORMAT(TODAY, 0, '<Day,2>/<Month,2>/<Year4>') + ' for ' + CompanyName);
                            BodyText1.AddText('<br><Br>');
                            BodyText1.AddText('<table border="1">');
                            BodyText1.AddText('<tr style="background-color:#507CD1;color:#fff">');
                            BodyText1.AddText('<th > Posting Date </th>');
                            BodyText1.AddText('<th > Document Date </th>');
                            BodyText1.AddText('<th align="center"> Vendor Invoice No. </th>');
                            BodyText1.AddText('<th align="center"> Vendor Name     </th>');
                            BodyText1.AddText('<th align="center"> Currency Code  </th>');
                            BodyText1.AddText('<th align="center"> Deal </th>');
                            BodyText1.AddText('<th align="center"> Payable Amount     </th>');
                            BodyText1.AddText('<th align="center"> Payable Amount (LCY)   </th>');
                            BodyText1.AddText('<th align="center"> Due Date      </th>');
                            BodyText1.AddText('</tr>');
                        end;
                        srno += 1;
                        if srno <> 0 then begin
                            BodyText1.AddText('<td align="center">' + FORMAT(VLE."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>') + '</td>');
                            BodyText1.AddText('<td align="center">' + FORMAT(VLE."Document Date", 0, '<Day,2>/<Month,2>/<Year4>') + '</td>');
                            BodyText1.AddText('<td align="center">' + format(PIH."Vendor Invoice No.") + '</td>');
                            BodyText1.AddText('<td>' + REcVendor.Name + '</td>');
                            BodyText1.AddText('<td align="center">' + VLE."Currency Code" + '</td>');
                            BodyText1.AddText('<td>' + format(VLE."Global Dimension 1 Code") + '</td>');
                            BodyText1.AddText('<td align="right">' + Format(VLE."Remaining Amount") + '</td>');
                            BodyText1.AddText('<td align="right">' + Format(VLE."Remaining Amt. (LCY)") + '</td>');
                            BodyText1.AddText('<td align="center">' + FORMAT(VLE."Due Date", 0, '<Day,2>/<Month,2>/<Year4>') + '</td>');
                            BodyText1.AddText('</tr>');
                        end;
                        /*if srno = Cnt then begin
                            BodyText1.AddText('</table>');
                            BodyText1.AddText('<br><Br>');
                            BodyText1.AddText('<table border="0">');
                            BodyText1.AddText('<tr>');
                            BodyText1.AddText('<td style="text-align:left" colspan=8><b>' + 'Thanks & Regards' + '</b></td>');
                            BodyText1.AddText('</tr>');
                            Emailmessage.Create(VarRecipaint1, Varsubject, Format(BodyText1), true, UserReceipt1, NewReceipt1);
                            Email1.Send(Emailmessage, Enum::"Email Scenario"::Default);
                            Message('Done');
                        END; */
                    end;
                end;
            UNTIL VLE.Next() = 0;
            if srno <> 0 then begin
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
        End;
    END;
}