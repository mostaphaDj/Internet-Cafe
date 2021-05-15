unit Frame_Limitation_Time_Ser_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Frame_Limitation_Time_U, StdCtrls, ComCtrls, ExtCtrls;

type
  TFrame_Limitation_Time_Ser = class(TFrame_Limitation_Time)
    Button1: TButton;
    procedure Edit_CostKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Frame_Limitation_Time_Ser: TFrame_Limitation_Time_Ser;

implementation

uses Char_U, Form_Limitation_Time_Ser_U,  Round_U, Classes_U,
  Type_U;
{$R *.dfm}

constructor TFrame_Limitation_Time_Ser.Create(AOwner: TComponent);
begin
  inherited;
  Use_Account.PriceHour := TUser.GetPriceHour(Unknown);
  Label_PriceHour.Caption := CurrToStrFormat(Use_Account.PriceHour);
end;

destructor TFrame_Limitation_Time_Ser.Destroy;
begin

  inherited;
end;

procedure TFrame_Limitation_Time_Ser.Edit_CostKeyPress
  (Sender: TObject; var Key: Char);
begin
  inherited;
//  if Form_Limitation_Time <> nil then
//    if (Key <> Chr(8)) And (Key <> '.') then
//      Key := #0;
end;

end.
