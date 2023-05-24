tableextension 50622 vendorPostingGroup extends "Vendor Posting Group"
{
    fields
    {
        // Add changes to table fields here
        field(50601; "Email Alert"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}