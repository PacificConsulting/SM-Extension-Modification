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
        field(50607; "Purchase Contract Number"; code[50])
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
        }
        field(50610; "Purch Contract Validity Date"; Date)
        {
            Caption = 'Purchase Contract Validity Date';
            DataClassification = ToBeClassified;
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