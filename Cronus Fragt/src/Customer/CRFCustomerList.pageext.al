namespace Cronus.CronusFreight;

using Microsoft.Sales.Customer;

pageextension 50100 "CRF Customer List" extends "Customer List"
{
    actions
    {
        addlast(processing)
        {
            action(CRFHello)
            {
                ApplicationArea = All;
                Caption = 'Hello from Cronus Fragt';
                ToolTip = 'Shows a greeting from the Cronus Fragt extension.';
                Image = AboutNav;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction();
                var
                    GreetingTxt: Label 'Hello %1, Cronus Fragt is running.', Comment = '%1 = the user ID';
                    Greeting: Text;
                begin
                    Greeting := StrSubstNo(GreetingTxt, UserId());
                    Message(Greeting);
                end;
            }
        }
    }
}