namespace Cronus.CronusFreight;

permissionset 50101 "CRF Freight Admin"
{
    Assignable = true;
    Caption = 'Cronus Freight - Admin';
    IncludedPermissionSets = "CRF Freight Basic";

    Permissions = tabledata "CRF Freight Setup" = RIMD,
        codeunit "CRF Freight Ass. Setup Subscr." = X,
        page "CRF Freight Setup" = X,
        page "CRF Freight Wizard" = X;
}