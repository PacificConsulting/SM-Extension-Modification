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
        }
        field(50610; "Sales Contract Validity Date"; Date)
        {
            Caption = 'Sales Contract Validity Date';
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