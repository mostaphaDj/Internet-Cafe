unit Form_Payment_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Frame_Cost_Ser_U, Frame_Cost_U, Classes_U;

type
  TForm_Payment = class(TForm)
    Panel1: TPanel;
    ButtonClose: TButton;
    Panel2: TPanel;
    Edit_Payment: TEdit;
    Label10: TLabel;
    ButtonTerminate: TButton;
    Frame_Cost: TFrame_Cost_Ser;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonTerminateClick(Sender: TObject);
    procedure Frame_CostTimer1Timer(Sender: TObject);
    procedure Frame_Cost_Ser1Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { DÈclarations privÈes }
    FUnitObjets: TUnitObjets;
  public
    { DÈclarations publiques }
    constructor Create(AOwner: TComponent; AUnitObjets: TUnitObjets);
  end;

var
  Form_Payment: TForm_Payment;

implementation

uses Form_Main_U, Form_ListView_Post_Client_U,
  Connexion_Module_U, ComCtrls, Char_U, Type_U, DataModuleBase_U;
{$R *.dfm}

procedure TForm_Payment.Button1Click(Sender: TObject);
begin
  FUnitObjets.Use.StopAndCancel;
        Frame_Cost.Stop;
  Close;
end;

procedure TForm_Payment.ButtonTerminateClick(Sender: TObject);
begin
    FUnitObjets.Use.Payment := FUnitObjets.User.Computation + StrFormatToCurr
      (Form_Payment.Edit_Payment.Text);
      Frame_Cost.Stop;
    FUnitObjets.Use.Terminate;
      Close;
end;

constructor TForm_Payment.Create(AOwner: TComponent; AUnitObjets: TUnitObjets);
begin
  inherited Create(AOwner);
  FUnitObjets := AUnitObjets;
end;

procedure TForm_Payment.FormCreate(Sender: TObject);
begin
  // if FUnitObjets.User.Computation > 0 then
  // begin
  // Edit_Payment.Visible := False;
  // Edit_Payment.Text := CurrToStrFormat(0,
  // { ffCurrency } ffNumber, CurrencyDecimals) + ' ' + CurrencyString;
  // end
  // else
  // begin
  // Edit_Payment.Text := CurrToStrFormat
  // (FUnitObjets.Use.Cost - FUnitObjets.User.Computation,
  // { ffCurrency } ffNumber, CurrencyDecimals) + ' ' + CurrencyString;
  // { „»€ «·œ›⁄⁄ „»·€ Â–Â «·Ã·”… + «·œÌ‰ }
  // end;
  Frame_Cost.Start;
end;

procedure TForm_Payment.Frame_CostTimer1Timer(Sender: TObject);
begin
  Frame_Cost.Timer1Timer(Sender);
end;

procedure TForm_Payment.Frame_Cost_Ser1Timer1Timer(Sender: TObject);
begin
  Frame_Cost.Timer1Timer(Sender);

end;

end.
