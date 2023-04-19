tableextension 50608 "Sales Credit Memo Head_Ext" extends "Sales Cr.Memo Header"
{
    fields
    {
        // Add changes to table fields here
        field(50605; "Invoiced Quantity"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Cr.Memo Line".Quantity WHERE("Document No." = FIELD("No.")));
            Editable = false;
        }
        field(50606; "Invoice Amount(LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    var
        myInt: Integer;
}