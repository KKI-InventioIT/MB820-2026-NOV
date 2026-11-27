namespace Cronus.CronusFreight;

page 50104 "CRF Shipment Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "CRF Shipment Line";
    Caption = 'Packages';
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(Packages)
            {

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Weight; Rec.Weight)
                {
                    ToolTip = 'Specifies the value of the Weight (kg) field.', Comment = '%';
                }
                field(Length; Rec.Length)
                {
                    ToolTip = 'Specifies the value of the Length (cm) field.', Comment = '%';
                }
                field(Width; Rec.Width)
                {
                    ToolTip = 'Specifies the value of the Width (cm) field.', Comment = '%';
                }
                field(Height; Rec.Height)
                {
                    ToolTip = 'Specifies the value of the Height (cm) field.', Comment = '%';
                }
            }
        }
    }
}