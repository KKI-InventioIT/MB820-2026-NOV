namespace Cronus.CronusFreight;

page 50106 "CRF Freight Activities"
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "CRF Freight Cue";
    Caption = 'Freight Activities';

    layout
    {
        area(Content)
        {
            cuegroup(Shipments)
            {
                Caption = 'Shipments';
                field("Open Shipments"; Rec."Open Shipments")
                {
                    ToolTip = 'Specifies the value of the Open Shipments field.', Comment = '%';
                    DrillDownPageId = "CRF Shipment List";
                }
                field("Open with Default Carrier"; Rec."Open with Default Carrier")
                {
                    ToolTip = 'Specifies the value of the Open with Default Carrier field.', Comment = '%';
                }
                actions
                {
                    action(AllShipments)
                    {
                        Caption = 'All Shipments';
                        ToolTip = 'Shows all shipments';
                        RunObject = page "CRF Shipment List";
                        Image = TileNew;
                    }
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

    trigger OnAfterGetRecord()
    var
        FreightSetup: Record "CRF Freight Setup";
        ShipmentHeader: Record "CRF Shipment Header";
    begin
        Rec."Open with Default Carrier" := 0;
        if not FreightSetup.Get() then
            exit;

        ShipmentHeader.SetRange(Status, "CRF Shipment Status"::Open);
        ShipmentHeader.SetRange(Carrier, FreightSetup."Default Carrier");
        Rec."Open with Default Carrier" := ShipmentHeader.Count;
    end;


}