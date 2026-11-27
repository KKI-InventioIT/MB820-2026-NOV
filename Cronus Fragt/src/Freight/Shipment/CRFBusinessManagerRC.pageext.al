namespace Cronus.CronusFreight;

using Microsoft.Finance.RoleCenters;

pageextension 50101 "CRF Business Manager RC" extends "Business Manager Role Center"
{
    layout
    {
        addbefore(Control16)
        {
            part(CRFFreightActivities; "CRF Freight Activities")
            {
                ApplicationArea = All;
            }
        }
    }
}