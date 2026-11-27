namespace Cronus.CronusFreight;

page 50100 "CRF Freight Setup"
{
    PageType = Card;
    SourceTable = "CRF Freight Setup";
    Caption = 'Cronus Freight Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Default Carrier"; Rec."Default Carrier")
                {
                    ApplicationArea = All;
                }
                field("API Base URL"; Rec."API Base URL")
                {
                    ApplicationArea = All;
                }
                field(ApiKey; this.ApiKeyText)
                {
                    Caption = 'API Key';
                    ExtendedDatatype = Masked;
                    ToolTip = 'Specifies the key that the carrier service gave Cronus. The key is stored in isolated storage, not in this table.';

                    trigger OnValidate()
                    begin
                        Rec.SetApiKey(this.ApiKeyText);
                        this.ShowApiKeyPlaceholder();
                    end;
                }
            }
            group(NoSeries)
            {
                Caption = 'No. Series';
                field("Shipment Nos."; Rec."Shipment Nos.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        ApiKeyText: Text;

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;

    trigger OnAfterGetRecord()
    begin
        ShowApiKeyPlaceholder();
    end;

    local procedure ShowApiKeyPlaceholder()
    begin
        if Rec.HasApiKey() then
            this.ApiKeyText := '********'
        else
            this.ApiKeyText := '';
    end;
}