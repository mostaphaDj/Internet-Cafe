unit Frame_Cost_Cli_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, ValEdit, DateUtils, Frame_Cost_U, Buttons,
  NxPropertyItemClasses, NxPropertyItems, NxScrollControl, NxInspector;

type
  TFrame_Cost_Cli = class(TFrame_Cost)
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    Monition: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

var
  Frame_Cost_Cli: TFrame_Cost_Cli;

implementation

Uses Form_Limitation_Time_Cli_U, Form_Monition_U, Classes_U, Type_U;
{$R *.dfm}

constructor TFrame_Cost_Cli.Create(AOwner: TComponent);
begin
  inherited;
  Monition := True;
end;

procedure TFrame_Cost_Cli.Timer1Timer(Sender: TObject);
begin
  inherited;
  if Monition and (UnitObjets_Active.Use.StateTime = stTimelimited) and
    (CompareDateTime(UnitObjets_Active.Use.TimeFin - StrToTime
        ('00:05:00'), Now) = -1) then
  begin
    Form_Monition := TForm_Monition.Create(Application);
    Form_Monition.Show;
    Monition := False;
  end;

  if Form_Monition <> nil then
  begin
    Form_Monition.Label_Time.Caption := TimeToStr
      (UnitObjets_Active.Use.TimeFin - Now);
  end;

  if (UnitObjets_Active.Use.StateTime = stTimelimited) and
    (CompareDateTime(UnitObjets_Active.Use.TimeFin, Now) = -1) then
  begin
    UnitObjets_Active.Use.Terminate;
  end;
end;

end.
