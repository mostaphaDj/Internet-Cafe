unit Form_Limitation_Time_Cli_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Frame_Limitation_Time_Cli_U, Frame_Limitation_Time_U;

type
  TForm_Limitation_Time = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Frame_Limitation_Time: TFrame_Limitation_Time_Cli;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Limitation_Time: TForm_Limitation_Time;

implementation

uses Type_U, Form_Main_U, Classes_U, DateUtils;
{$R *.dfm}

var
  VTimeDesired: TDateTime;

procedure TForm_Limitation_Time.FormCreate(Sender: TObject);
begin
  VTimeDesired := UnitObjets_Active.Use.TimeDesired;
end;

procedure TForm_Limitation_Time.Button1Click(Sender: TObject);
resourcestring
  MsgText = '·„  Õœœ «·„œ… Â·  —ÌÌœ «·„ «»⁄… »Êﬁ  €Ì— „ÕœÊœ';
begin
  if Frame_Limitation_Time.RadioButton1.Checked then
  begin
    if Frame_Limitation_Time.Use_Account.CostVirtual = 0 then
    begin
      if MessageBox(Application.Handle, PChar(MsgText), PChar(MsgCaptionWarning)
          , MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2 + MB_SYSTEMMODAL +
          MB_RIGHT + MB_RTLREADING) = IDYES then
      begin
        UnitObjets_Active.Use.TimeDesired := 0;
        UnitObjets_Active.Use.StateTime := stTimeUnlimited;
      end
      else
        ModalResult := mrNone;
    end
    else
    begin
      if not Frame_Limitation_Time.IfTimeFinLaterNow then
        Exit; // «–« ﬂ«‰ «·Êﬁ  «·„Õœœ √ﬂ»— „‰ «·Êﬁ  «·Õ«·Ì
      UnitObjets_Active.Use.StateTime := stTimelimited;
      ModalResult := mrOk;
    end;
  end
  else
  begin
    UnitObjets_Active.Use.TimeDesired := 0;
    UnitObjets_Active.Use.StateTime := stTimeUnlimited;
  end;
end;

procedure TForm_Limitation_Time.Button2Click(Sender: TObject);
begin
  UnitObjets_Active.Use.TimeDesired := VTimeDesired;
  ModalResult := mrCancel;
end;

end.
