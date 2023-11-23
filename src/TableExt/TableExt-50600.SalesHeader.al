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
        field(50607; "Sales Contract Number"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50608; "Sales Contract Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50609; "Sales Contract Validity Days"; Integer)
        {
            Caption = 'Sales Contract Validity Days';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if Rec."Sales Contract Validity Days" <> 0 then
                    Rec.Validate("Sales Contract Validity Date", Rec."Sales Contract Date" + Rec."Sales Contract Validity Days");
            end;
        }
        field(50610; "Sales Contract Validity Date"; Date)
        {
            Caption = 'Sales Contract Validity Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "Sales Contract Validity Date" <> 0D Then
                    Rec."Sales Contract Validity Days" := ABS(Rec."Sales Contract Date" - Rec."Sales Contract Validity Date");
            end;
        }
        field(50611; "ISCC Claim"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ISCC Claim";
        }
    }

    var
        myInt: Integer;
}