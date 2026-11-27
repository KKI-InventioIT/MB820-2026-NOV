namespace Cronus.CronusFreight;

using Cronus.CronusFreight;

permissionset 50100 "CRF Freight Basic"
{
    Assignable = true;
    Caption = 'Cronus Freight - Basic';

    Permissions = tabledata "CRF Freight Setup" = R,
        tabledata "CRF Shipment Header" = RIMD,
        tabledata "CRF Shipment Line" = RIMD,
        tabledata "CRF Carrier Rate" = RIMD,
        tabledata "CRF Freight Cue" = R,
        table "CRF Freight Setup" = X,
        table "CRF Shipment Header" = X,
        table "CRF Shipment Line" = X,
        table "CRF Carrier Rate" = X,
        table "CRF Freight Cue" = X,
        page "CRF Shipment API" = X,
        page "CRF Shipment Card" = X,
        page "CRF Shipment Line API" = X,
        page "CRF Shipment List" = X,
        page "CRF Shipment Subform" = X,
        codeunit "CRF Carrier A" = X,
        codeunit "CRF Carrier B" = X,
        codeunit "CRF Freight Ass. Setup Subscr." = X,
        codeunit "CRF Freight Mgt." = X,
        codeunit "CRF Install" = X,
        codeunit "CRF No Carrier" = X,
        codeunit "CRF Sales Post Subs" = X,
        codeunit "CRF Update Status" = X,
        codeunit "CRF Upgrade" = X,
        xmlport "CRF Import Carrier Rates" = X,
        page "CRF Carrier Rates" = X,
        page "CRF Freight Activities" = X,
        page "CRF Freight Setup" = X,
        page "CRF Freight Wizard" = X;
}