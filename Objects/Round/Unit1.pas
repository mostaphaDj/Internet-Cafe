unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Edit_Value: TEdit;
    Edit_ValueRound: TEdit;
    Edit_UnitRound: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Edit_ValueNiveauRound: TEdit;
    Label1: TLabel;
    Label_PercentageMinDisadvantage: TLabel;
    Edit_PercentageNiveauRound: TEdit;
    UpDown1: TUpDown;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Edit_ValueChange(Sender: TObject);
    procedure Edit_ValueNiveauRoundChange(Sender: TObject);
    procedure Edit_UnitRoundChange(Sender: TObject);
    procedure Edit_PercentageNiveauRoundChange(Sender: TObject);
    procedure Edit_ValueNiveauRoundEnter(Sender: TObject);
    procedure Edit_ValueNiveauRoundExit(Sender: TObject);
    procedure Edit_PercentageNiveauRoundEnter(Sender: TObject);
    procedure Edit_PercentageNiveauRoundExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Round_U, Math;

{$R *.dfm}
var
  RoundCost: TRound;

procedure TForm1.FormCreate(Sender: TObject);
begin        
  RoundCost := TRound.Create;
  RoundCost.Value := StrToCurr(Edit_Value.Text);
  RoundCost.UnitRound := StrToCurr(Edit_UnitRound.Text);
  RoundCost.ValueNiveauRound := StrToCurr(Form1.Edit_ValueNiveauRound.Text);
end;

procedure TForm1.Edit_ValueChange(Sender: TObject);
begin
  if TEdit(Sender).Text <> '' then
  begin
    RoundCost.Value := StrToCurr(Edit_Value.Text);
    Edit_ValueRound.Text := CurrToStr(RoundCost.ValueRound);
  end;
end;

procedure TForm1.Edit_ValueNiveauRoundChange(Sender: TObject);
begin
  if TEdit(Sender).Text <> '' then
  begin
    RoundCost.ValueNiveauRound := StrToCurr(Form1.Edit_ValueNiveauRound.Text);
    Edit_PercentageNiveauRound.Text := CurrToStr(RoundCost.PercentageNiveauRound);
    Edit_ValueRound.Text := CurrToStr(RoundCost.ValueRound);
  end;
end;

procedure TForm1.Edit_UnitRoundChange(Sender: TObject);
begin
  if TEdit(Sender).Text <> '' then
  begin
    RoundCost.UnitRound := StrToCurr(Edit_UnitRound.Text);
    Edit_ValueNiveauRound.Text := CurrToStr(RoundCost.ValueNiveauRound);
    Edit_PercentageNiveauRound.Text := CurrToStr(RoundCost.PercentageNiveauRound);
    Edit_ValueRound.Text := CurrToStr(RoundCost.ValueRound);
  end;
end;

procedure TForm1.Edit_PercentageNiveauRoundChange(Sender: TObject);
begin
  if TEdit(Sender).Text <> '' then
  begin
    RoundCost.PercentageNiveauRound := StrToCurr(Edit_PercentageNiveauRound.Text);
    Edit_ValueNiveauRound.Text := CurrToStr(RoundCost.ValueNiveauRound);
    Edit_ValueRound.Text := CurrToStr(RoundCost.ValueRound);
  end;

end;

procedure TForm1.Edit_ValueNiveauRoundEnter(Sender: TObject);
begin
  Edit_ValueNiveauRound.OnChange := Edit_ValueNiveauRoundChange;
end;

procedure TForm1.Edit_ValueNiveauRoundExit(Sender: TObject);
begin
  Edit_ValueNiveauRound.OnChange := nil;
end;

procedure TForm1.Edit_PercentageNiveauRoundEnter(Sender: TObject);
begin
  Edit_PercentageNiveauRound.OnChange := Edit_PercentageNiveauRoundChange;

end;

procedure TForm1.Edit_PercentageNiveauRoundExit(Sender: TObject);
begin
  Edit_PercentageNiveauRound.OnChange := nil
end;

end.

