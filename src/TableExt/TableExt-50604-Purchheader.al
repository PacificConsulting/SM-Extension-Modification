tableextension 50604 "Purchase Header_Ext" extends "Purchase Header"
{
    fields
    {
        // Add changes to table fields here
        field(50600; "Invoiced Quantity"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Line".Quantity WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
            Editable = false;
        }

    }

    var
        myInt: Integer;
}