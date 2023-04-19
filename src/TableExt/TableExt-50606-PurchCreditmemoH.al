tableextension 50606 "Purchase credit Memo_Ext" extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        // Add changes to table fields here
        field(50600; "Invoiced Quantity"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Purch. Cr. Memo Line".Quantity WHERE("Document No." = FIELD("No.")));
            Editable = false;
        }
        field(50601; "Invoice Amount(LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    var
        myInt: Integer;
}