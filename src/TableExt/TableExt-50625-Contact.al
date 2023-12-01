tableextension 50625 ContactExt extends Contact
{
    fields
    {
        // Add changes to table fields here
        field(50600; "Date of Meeting"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50601; "Type of Meeting"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}