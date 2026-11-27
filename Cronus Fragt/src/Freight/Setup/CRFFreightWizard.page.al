namespace Cronus.CronusFreight;

page 50101 "CRF Freight Wizard"
{
    Caption = 'Cronus Freight Wizard';
    PageType = NavigatePage;
    SourceTable = "CRF Freight Setup";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(StepWelcome)
            {
                Caption = 'Welcome to Cronus Freight Setup';
                InstructionalText = 'This guide sets up the default carrier and the numbering of shipments.';
                Visible = Step = Step::Welcome;
            }
            group(StepCarrier)
            {
                Caption = 'Default Carrier';
                InstructionalText = 'Specify the default carrier for new shipments.';
                Visible = Step = Step::Carrier;
                field("Default Carrier"; Rec."Default Carrier")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the carrier that new shipments get by default.';
                }
            }
            group(StepShipmentNos)
            {
                Caption = 'Shipment numbers';
                InstructionalText = 'Specify the number series for new shipments.';
                Visible = Step = Step::ShipmentNos;
                field("Shipment Nos."; Rec."Shipment Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series that is used to number new shipments.';
                }
            }
            group(StepFinish)
            {
                Caption = 'Finished';
                InstructionalText = 'The setup is now complete. To save this setup, choose Finish.';
                Visible = Step = Step::Finish;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionBack)
            {
                ApplicationArea = All;
                Caption = 'Back';
                Enabled = Step <> Step::Welcome;
                Image = PreviousRecord;
                InFooterBar = true;
                trigger OnAction()
                begin
                    NextStep(true);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = All;
                Caption = 'Next';
                Enabled = Step <> Step::Finish;
                Image = NextRecord;
                InFooterBar = true;
                trigger OnAction()
                begin
                    NextStep(false);
                end;
            }
            action(ActionFinish)
            {
                ApplicationArea = All;
                Caption = 'Finish';
                Enabled = Step = Step::Finish;
                Image = Approve;
                InFooterBar = true;
                trigger OnAction()
                begin
                    FinishAction();
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        CRFFreightSetup: Record "CRF Freight Setup";
    begin
        Rec.Init();
        if CRFFreightSetup.Get() then
            Rec.TransferFields(CRFFreightSetup);

        Rec.Insert();

        Step := Step::Welcome;
    end;

    var
        Step: Option Welcome,Carrier,ShipmentNos,Finish;

    local procedure StoreRecordVar()
    var
        CRFFreightSetup: Record "CRF Freight Setup";
    begin
        if not CRFFreightSetup.Get() then begin
            CRFFreightSetup.Init();
            CRFFreightSetup.Insert();
        end;

        CRFFreightSetup.TransferFields(Rec, false);
        CRFFreightSetup.Modify(true);
    end;

    local procedure FinishAction()
    begin
        StoreRecordVar();
        CurrPage.Close();
    end;

    local procedure NextStep(Backwards: Boolean)
    begin
        if Backwards then
            Step := Step - 1
        else
            Step := Step + 1;
    end;
}