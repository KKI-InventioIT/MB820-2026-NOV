namespace Cronus.CronusFreight;

page 50105 "CRF Carrier Rates"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CRF Carrier Rate";
    Caption = 'Freight Carrier Rates';

    layout
    {
        area(Content)
        {
            repeater(Rates)
            {
                field(Carrier; Rec.Carrier)
                {
                    ToolTip = 'Specifies the value of the Carrier field.', Comment = '%';
                }
                field("Weight Limit"; Rec."Weight Limit")
                {
                    ToolTip = 'Specifies the value of the Weight Limit (kg) field.', Comment = '%';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportRates)
            {
                Caption = 'Import Rates';
                ToolTip = 'Imports carrier rates from an XML file.';
                Image = Import;

                trigger OnAction()
                begin
                    Xmlport.Run(Xmlport::"CRF Import Carrier Rates", false, true);
                    CurrPage.Update(false);
                end;
            }
        }
    }
}