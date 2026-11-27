namespace Cronus.CronusFreight;

page 50102 "CRF Shipment List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CRF Shipment Header";
    Caption = 'Cronus Freight Shipment List';
    CardPageId = "CRF Shipment Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Shipments)
            {
                field("Total Weight"; Rec."Total Weight")
                {
                    ToolTip = 'Specifies the value of the Total Weight (kg) field.', Comment = '%';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field(Carrier; Rec.Carrier)
                {
                    ToolTip = 'Specifies the value of the Carrier field.', Comment = '%';
                    ApplicationArea = All;
                }
            }
        }
    }
}