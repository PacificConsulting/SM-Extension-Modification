tableextension 50615 "Bank Account EXT" extends "Bank Account"
{
    fields
    {
        // Add changes to table fields here
        field(50600; "Email Alerts"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    trigger OnBeforeInsert()
    var
        myInt: Integer;
    begin
        "Email Alerts" := true;
    end;


    var
        myInt: Integer;
}