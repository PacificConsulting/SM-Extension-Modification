tableextension 50603 "Value Entry EXT" extends "Value Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50600; "VAT Transaction Type"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50601; Thickness; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50602; "Length (MM)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50603; "Width (MM)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50604; "Diameter"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50605; "Profile Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}