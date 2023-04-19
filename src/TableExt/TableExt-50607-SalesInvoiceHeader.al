tableextension 50607 "Sales Invoice Header_Ext" extends "Sales Invoice Header"
{
    fields
    {
        // Add changes to table fields here
        field(50605; "Invoiced Quantity"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Invoice Line".Quantity WHERE("Document No." = FIELD("No.")));
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