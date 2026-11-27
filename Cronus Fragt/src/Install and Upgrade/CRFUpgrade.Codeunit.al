namespace Cronus.CronusFreight;

using Microsoft.Sales.Customer;
using System.Upgrade;

codeunit 50108 "CRF Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        this.CarrierOnCustomer();
    end;

    local procedure CarrierOnCustomer()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        if UpgradeTag.HasUpgradeTag(this.CarrierOnCustomerLbl) then
            exit;

        SelectCarrierOnCustomer();

        UpgradeTag.SetUpgradeTag(this.CarrierOnCustomerLbl);
    end;

    local procedure SelectCarrierOnCustomer()
    var
        ShipmentHeader: Record "CRF Shipment Header";
        Customer: Record Customer;
    begin
        if Customer.FindSet() then
            repeat
                ShipmentHeader.Reset();
                ShipmentHeader.SetRange("Customer No.", Customer."No.");
                ShipmentHeader.SetFilter(Carrier, '<>%1', ShipmentHeader.Carrier::" ");
                if ShipmentHeader.FindLast() then begin
                    Customer."CRF Default Carrier" := ShipmentHeader.Carrier;
                    Customer.Modify();
                end;
            until Customer.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyUpgradeTags(var PerCompanyUpgradeTags: List of [Code[250]])
    begin
        PerCompanyUpgradeTags.Add(this.CarrierOnCustomerLbl);
    end;

    var
        CarrierOnCustomerLbl: Label 'CRF-Carrier-On-Customer-ID-20261127', Locked = true;
}