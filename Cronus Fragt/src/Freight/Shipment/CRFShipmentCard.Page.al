namespace Cronus.CronusFreight;

page 50103 "CRF Shipment Card"
{
    PageType = Document;
    ApplicationArea = All;
    SourceTable = "CRF Shipment Header";
    Caption = 'Shipment';

    layout
    {
        area(Content)
        {
            group(General)
            {
                AboutTitle = 'More Shipment Details';
                AboutText = 'This section provides more details about the shipment.';
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field(Carrier; Rec.Carrier)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Carrier field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Tracking No."; Rec."Tracking No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tracking No. field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Total Weight"; Rec."Total Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Weight (kg) field.', Comment = '%';
                }
            }
            part(Lines; "CRF Shipment Subform")
            {
                Caption = 'Packages';
                SubPageLink = "Shipment No." = field("No.");
                UpdatePropagation = Both;
            }
            group(Shipping)
            {
                Caption = 'Ship-to';
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ship-to Name field.', Comment = '%';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ship-to Address field.', Comment = '%';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ship-to Post Code field.', Comment = '%';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ship-to City field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(UpdateStatus)
            {
                Caption = 'Update Status';
                ToolTip = 'Updates the status of the shipment.';
                ApplicationArea = All;
                Image = Refresh;
                trigger OnAction()
                var
                    FreightMgt: Codeunit "CRF Freight Mgt.";
                begin
                    FreightMgt.UpdateStatus(Rec);
                    CurrPage.Update(false);
                end;
            }
        }
    }
}