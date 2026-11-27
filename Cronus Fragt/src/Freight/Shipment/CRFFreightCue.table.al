namespace Cronus.CronusFreight;

table 50104 "CRF Freight Cue"
{
    DataClassification = CustomerContent;
    Caption = 'Freight Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Open Shipments"; Integer)
        {
            Caption = 'Open Shipments';
            FieldClass = FlowField;
            CalcFormula = count("CRF Shipment Header" where(Status = const(Open)));
            Editable = false;
        }
        field(3; "Open with Default Carrier"; Integer)
        {
            Caption = 'Open with Default Carrier';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}