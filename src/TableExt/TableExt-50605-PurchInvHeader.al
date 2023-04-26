tableextension 50605 "Purchase Invoice Header_Ext" extends "Purch. Inv. Header"
{
    fields
    {
        // Add changes to table fields here
        field(50600; "Invoiced Quantity"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Purch. Inv. Line".Quantity WHERE("Document No." = FIELD("No.")));
            Editable = false;
        }
        field(50601; "Invoice Amount(LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    // trigger OnAfterInsert()
    // var
    //     myInt: Integer;
    // begin
    //     Rec.CalcFields(Amount);
    //     if Rec."Currency Factor" <> 0 then
    //         Rec."Invoice Amount(LCY)" := Rec.Amount / Rec."Currency Factor";
    // end;

    var
        myInt: Integer;
}