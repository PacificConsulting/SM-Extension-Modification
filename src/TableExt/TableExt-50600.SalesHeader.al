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
        field(50607; "Purchase Contract Number"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50608; "Purchase Contract Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50609; "Purch Contract Validity Days"; Integer)
        {
            Caption = 'Purchase Contract Validity Days';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if Rec."Purch Contract Validity Days" <> 0 then
                    Rec.Validate("Purch Contract Validity Date", Rec."Purchase Contract Date" + Rec."Purch Contract Validity Days");
            end;
        }
        field(50610; "Purch Contract Validity Date"; Date)
        {
            Caption = 'Purchase Contract Validity Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "Purch Contract Validity Date" <> 0D Then
                    Rec."Purch Contract Validity Days" := ABS(Rec."Purchase Contract Date" - Rec."Purch Contract Validity Date");
            end;
        }
        field(50611; "ISCC Claim"; Enum "ISCC Claim List")
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}