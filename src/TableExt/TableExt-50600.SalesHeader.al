tableextension 50600 "Sales header_Ext" extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(50600; "Shipping Conditions"; Text[2048])
        {

            DataClassification = ToBeClassified;
        }
        field(50601; "Payment Term/Condition"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50602; "Quality And Weight"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50603; "Validity And Subject"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50604; "Other Terms And Condition"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50605; "Invoiced Quantity"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line".Quantity WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
            Editable = false;
        }
    }

    var
        myInt: Integer;
}