tableextension 50624 Vend_ext extends Vendor
{
    fields
    {
        // Add changes to table fields here
        field(50600; "ISCC Certificate Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }


    var
        myInt: Integer;
}