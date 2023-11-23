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
        }
        field(50610; "Purch Contract Validity Date"; Date)
        {
            Caption = 'Purchase Contract Validity Date';
            DataClassification = ToBeClassified;
        }
        field(50611; "ISCC Claim"; Enum "ISCC Claim List")
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}