namespace Cronus.CronusFreight.Test;

using Cronus.CronusFreight;

codeunit 50201 "CRF Freight Tests"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure CarrierStatusInTransitMapsToInTransit()
    var
        CarrierA: Codeunit "CRF Carrier A";
        NewStatus: Enum "CRF Shipment Status";
    begin
        // [SCENARIO] Carrier A's in_transit status maps to In Transit
        // [GIVEN] The status text that the carrier sends for a parcel on its way
        // [WHEN] Cronus Fragt maps the text
        NewStatus := CarrierA.StatusFromText('in_transit');
        // [THEN] The shipment status is In Transit
        if NewStatus <> "CRF Shipment Status"::"In Transit" then
            Error('in_transit must map to In Transit. Actual status: %1.', NewStatus);
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure CarrierStatusDeliveredMapsToDelivered()
    var
        CarrierA: Codeunit "CRF Carrier A";
        NewStatus: Enum "CRF Shipment Status";
    begin
        // [SCENARIO] Carrier A's delivered status maps to Delivered
        // [GIVEN] The status text that the carrier sends for a parcel that has been delivered
        // [WHEN] Cronus Fragt maps the text
        NewStatus := CarrierA.StatusFromText('delivered');
        // [THEN] The shipment status is Delivered
        if NewStatus <> "CRF Shipment Status"::"Delivered" then
            Error('delivered must map to Delivered. Actual status: %1.', NewStatus);
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure CarrierStatusBookedMapsToBooked()
    var
        CarrierA: Codeunit "CRF Carrier A";
        NewStatus: Enum "CRF Shipment Status";
    begin
        // [SCENARIO] Carrier A's booked status maps to Booked
        // [GIVEN] The status text that the carrier sends for a parcel that has been booked
        // [WHEN] Cronus Fragt maps the text
        NewStatus := CarrierA.StatusFromText('booked');
        // [THEN] The shipment status is Booked
        if NewStatus <> "CRF Shipment Status"::"Booked" then
            Error('booked must map to Booked. Actual status: %1.', NewStatus);
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure PackageWeightMustBePositive()
    var
        ShipmentLine: Record "CRF Shipment Line";
    begin
        // [SCENARIO] A package can't weigh zero
        // [GIVEN] A new shipment line
        ShipmentLine.Init();
        // [WHEN] The weight is set to 0
        asserterror ShipmentLine.Validate(Weight, 0);
        // [THEN] The weight validation error is raised
        if GetLastErrorText() <> 'The weight of a package must be greater than zero.' then
            Error('Unexpected error message: %1', GetLastErrorText());
    end;
}