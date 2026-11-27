namespace Cronus.CronusFreight;

using System.Upgrade;

codeunit 50107 "CRF Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany();
    var
        myAppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo);

        if myAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then
            HandleFreshInstall()
        else
            HandleReinstall();
    end;

    local procedure HandleFreshInstall()
    var
        FreightSetup: Record "CRF Freight Setup";
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        FreightSetup.InsertIfNotExists();

        UpgradeTag.SetAllUpgradeTags();
    end;

    local procedure HandleReinstall()
    begin

    end;
}