tableextension 50609 "Sales Line EXT" extends "Sales Line"
{
    fields
    {
        // Add changes to table fields here
        field(50600; "Invoice Value"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        modify("Qty. to Ship")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                "Invoice Value" := "Qty. to Ship" * "Unit Price";
            end;
        }
        modify("Unit Price")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                "Invoice Value" := "Qty. to Ship" * "Unit Price";
            end;
        }
    }


    var
        myInt: Integer;
}