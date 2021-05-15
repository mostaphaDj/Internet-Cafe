unit Form_Limitation_Time_Ser_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Frame_Limitation_Time_Ser_U, Frame_Limitation_Time_U;

type
  TForm_Limitation_Time = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Frame_Limitation_Time: TFrame_Limitation_Time_Ser;
    procedure Button1Click(Sender: TObject);
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

procedure TForm_Limitation_Time.Button1Click(Sender: TObject);
resourcestring
  MsgText = '·„  Õœœ «·„œ… Â·  —ÌÌœ «·„ «»⁄… »Êﬁ  €Ì— „ÕœÊœ';
begin
  if Frame_Limitation_Time.RadioButton1.Checked then
  begin
    if Frame_Limitation_Time.Use_Account.CostVirtual = 0 then
    begin
      if MessageBox(Application.Handle, PChar(MsgText), PChar(MsgCaptionWarning)
          , MB_OKCANCEL + MB_ICONWARNING + MB_DEFBUTTON2 + MB_SYSTEMMODAL +
          MB_RIGHT + MB_RTLREADING) = IDOK then
        Frame_Limitation_Time.Use_Account.TimeDesired := 0
      else
        ModalResult := mrNone;
    end
    else
    begin
      if not Frame_Limitation_Time.IfTimeFinLaterNow then
        Exit // «–« ﬂ«‰ «·Êﬁ  «·„Õœœ √ﬂ»— „‰ «·Êﬁ  «·Õ«·Ì
      else
        ModalResult := mrOk;
    end;
  end
  else
    Frame_Limitation_Time.Use_Account.TimeDesired := 0;
end;

end.
