tableextension 50623 Cust_ext extends Customer
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