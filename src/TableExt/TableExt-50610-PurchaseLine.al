tableextension 50610 "Purchase Line EXT" extends "Purchase Line"
{
    fields
    {
        // Add changes to table fields here
        field(50600; "Invoice Value"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        modify("Qty. to Receive")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                "Invoice Value" := "Qty. to Receive" * "Direct Unit Cost";
            end;
        }
        modify("Direct Unit Cost")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                "Invoice Value" := "Qty. to Receive" * "Direct Unit Cost";
            end;
        }
    }

    var
        myInt: Integer;
}