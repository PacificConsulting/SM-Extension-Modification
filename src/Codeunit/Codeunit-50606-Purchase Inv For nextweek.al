codeunit 50606 "Purchase Invoice for Next Week"
{
    trigger OnRun()
    begin
        SendMailtoVendor();
        SendMailtoCustomer();
    end;

    var
        VarEmailSender1: Text[150];
        VendPostGrp: Record "Vendor Posting Group";
        CustPostGroup: Record "Customer Posting Group";
        OutStr: OutStream;
        SalreceiveSet: Record "Sales & Receivables Setup";
        SIH: Record "Sales Invoice Header";
        CLE: Record "Cust. Ledger Entry";
        ActivityCue: Record 1313;
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
        EmailDueInvoice: Text;
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

    procedure SendMailtoVendor()
    var
        REcVendor: Record Vendor;
    begin
        Clear(VarRecipaint1);
        Clear(Email1);
        Clear(EmailDueInvoice);
        Clear(BodyText1);
        Clear(Emailmessage);
        PurchPaySet.Get();
        PurchPaySet.TestField("Email Alerts");
        EmailText1 := PurchPaySet."Email Id";
        EmailDueInvoice := PurchPaySet."Email Id for Invoice Due";   //PCPL-25/220523
        VarRecipaint1.AddRange(EmailDueInvoice.Split(';'));   //PCPL-25/220523
        //VarRecipaint1.AddRange(EmailText1.Split(';'));
        // IF EmailText1 <> '' then

        srno := 0;

        Clear(Cnt);
        ActivityCue.Get();
        VLE.Reset();
        VLE.SetRange(Open, true);
        //VLE.SetRange("Due Date", ActivityCue."Due Next Week Filter");
        //Rec.SetFilter("Due Next Week Filter", '%1..%2', CalcDate('<1D>', WorkDate()), CalcDate('<1W>', WorkDate()));
        //VLE.SetFilter("Due Date", '%1', ActivityCue."Due Next Week Filter");
        VLE.SetFilter("Due Date", '%1..%2', CalcDate('<1D>', WorkDate()), CalcDate('<1W>', WorkDate()));
        //VLE.SetFilter("Due Date", '%1..%2', 20230201D, 20230207D);   //temp add code for testing
        VLE.SetFilter("Document Type", '%1|%2', VLE."Document Type"::Invoice, VLE."Document Type"::"Credit Memo");
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
                            Varsubject := 'Payable Invoice Due For Next Week: ';
                            BodyText1.AddText('Hi All,');
                            BodyText1.AddText('<br><Br>');
                            BodyText1.AddText('Payable Invoice Due For Next Week:');
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

    //Payable Invoice Due For Next Week
    procedure SendMailtoCustomer()
    var
        Cust: Record Customer;
    begin
        Clear(VarRecipaint1);
        Clear(Email1);
        Clear(BodyText1);
        Clear(EmailText1);
        Clear(VarEmailSender1);
        Clear(EmailDueInvoice);
        Clear(Varsubject);
        Clear(Emailmessage);
        SalreceiveSet.Get();
        ActivityCue.Get();
        SalreceiveSet.TestField("Email Alerts");
        EmailText1 := SalreceiveSet."Email Id";
        EmailDueInvoice := SalreceiveSet."Email Id for Invoice Due";   //PCPL-25/220523
        VarRecipaint1.AddRange(EmailDueInvoice.Split(';'));   //PCPL-25/220523

        //  IF SalreceiveSet."Email Id for Invoice Due" = '' then
        //    VarRecipaint1.AddRange(EmailText1.Split(';'));
        //IF EmailText1 <> '' then

        srno := 0;
        Clear(Cnt);
        CLE.Reset();
        CLE.SetRange(Open, true);
        //CLE.SetFilter("Due Date",'%1', ActivityCue."Due Next Week Filter");
        CLE.SetFilter("Due Date", '%1..%2', CalcDate('<1D>', WorkDate()), CalcDate('<1W>', WorkDate()));
        //CLE.SetFilter("Due Date", '%1..%2', 20230201D, 20230207D);//temp add code for testing
        CLE.SetFilter("Document Type", '%1|%2', CLE."Document Type"::Invoice, CLE."Document Type"::"Credit Memo");
        IF CLE.FindSet() THEN BEGIN
            REPEAT
                CustPostGroup.Reset();
                CustPostGroup.SetRange(Code, CLE."Customer Posting Group");
                CustPostGroup.SetRange("Email Alert", true);
                if CustPostGroup.FindFirst() then begin
                    CLE.CalcFields(Amount, "Amount (LCY)", "Remaining Amount", "Remaining Amt. (LCY)", "Shortcut Dimension 3 Code");
                    if Cust.Get(CLE."Customer No.") then;
                    SIH.Reset();
                    SIH.SetRange("No.", CLE."Document No.");
                    if SIH.FindFirst() then;
                    cnt := CLE.Count;
                    if (Not VarRecipaint1.Contains('')) then begin
                        if srno = 0 then begin
                            VarEmailSender1 := 'steelmont.erp@steelmont.net';
                            Varsubject := 'Receivable Invoice Due For Next Week :';
                            BodyText1.AddText('Hi All,');
                            BodyText1.AddText('<br><Br>');
                            BodyText1.AddText('Receivable Invoice Due For Next Week :');
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
            UNTIL CLE.Next() = 0;
            if srno <> 0 then begin
                BodyText1.AddText('</table>');
                BodyText1.AddText('<br><Br>');
                BodyText1.AddText('<table border="0">');
                BodyText1.AddText('<tr>');
                BodyText1.AddText('<td style="text-align:left" colspan=8><b>' + 'Thanks & Regards' + '</b></td>');
                BodyText1.AddText('</tr>');
                Emailmessage.Create(VarRecipaint1, Varsubject, Format(BodyText1), true, UserReceipt1, NewReceipt1);
                Email1.Send(Emailmessage, Enum::"Email Scenario"::Default);
                //Message('Done');
            END;
        End;
    END;
}