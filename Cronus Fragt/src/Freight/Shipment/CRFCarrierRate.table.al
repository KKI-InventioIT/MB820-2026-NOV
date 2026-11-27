namespace Cronus.CronusFreight;

table 50103 "CRF Carrier Rate"
{
    DataClassification = CustomerContent;
    Caption = 'Freight Carrier Rate';

    fields
    {
        field(1; Carrier; Enum "CRF Carrier")
        {
            Caption = 'Carrier';
            DataClassification = CustomerContent;
        }
        field(2; "Weight Limit"; Decimal)
        {
            Caption = 'Weight Limit (kg)';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
        }
        field(3; Price; Decimal)
        {
            Caption = 'Price';
            DataClassification = CustomerContent;
            AutoFormatType = 2;
        }
    }

    keys
    {
        key(PK; Carrier, "Weight Limit")
        {
            Clustered = true;
        }
    }
}