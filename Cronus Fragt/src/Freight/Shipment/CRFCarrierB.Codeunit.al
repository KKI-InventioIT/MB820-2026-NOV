namespace Cronus.CronusFreight;

codeunit 50102 "CRF Carrier B" implements "CRF ICarrier"
{
    Access = Internal;
    procedure GetRate(ShipmentHeader: Record "CRF Shipment Header"): Decimal
    var
        ShipmentLine: Record "CRF Shipment Line";
        CarrierRate: Record "CRF Carrier Rate";
        TotalPrice: Decimal;
        NoRateErr: Label 'Carrier B has no rate for a shipment of %1 kg.', Comment = '%1 = total weight';
    begin
        ShipmentLine.SetRange("Shipment No.", ShipmentHeader."No.");
        if ShipmentLine.FindSet() then
            repeat
                CarrierRate.SetRange(Carrier, "CRF Carrier"::"Carrier B");
                CarrierRate.SetFilter("Weight Limit", '>=%1', ShipmentLine."Weight");
                if not CarrierRate.FindFirst() then
                    Error(NoRateErr, ShipmentLine."Weight");
                TotalPrice += CarrierRate.Price;
            until ShipmentLine.Next() = 0;
        exit(TotalPrice);
    end;

    procedure GetStatus(ShipmentHeader: Record "CRF Shipment Header"): Enum "CRF Shipment Status"
    begin
        exit(ShipmentHeader.Status);
    end;
}