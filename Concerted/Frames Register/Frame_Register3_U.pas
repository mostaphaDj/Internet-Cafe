unit Frame_Register3_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TFrame_Register3 = class(TFrame)
    LabelRecording: TLabel;
    ProgressBar2: TProgressBar;
  private
    { Private declarations }
    procedure ClearEdit;
  public
    { Public declarations }
    procedure Next; // «· Õﬁﬁ „‰ ’Õ… „⁄·Ê„«  «·„ﬂ Ê»… ﬁ»· «·„—Ê— ≈·Ï «·’›Õ… «·„Ê«·Ì…
    procedure Prior; // ··Œ·›
  end;

implementation

uses Char_U, Form_Welcoming_U, Type_U, Frame_Password_U;
{$R *.dfm}
{ TFrame_Recording3 }

procedure TFrame_Register3.ClearEdit;
var
  i: integer;
begin
  // ------  «›—«€ Ã„Ì⁄ edit „‰ «·»Ì«‰« 
  for i := 0 to Form_Welcoming.Frame_Register1.ComponentCount - 1 do
    if (Form_Welcoming.Frame_Register1.Components[i] is TEdit) then
      TEdit(Form_Welcoming.Frame_Register1.Components[i]).Clear;
  for i := 0 to Form_Welcoming.Frame_Register1.ComponentCount - 1 do
    if (Form_Welcoming.Frame_Register1.Components[i] is TImage) then
      TImage(Form_Welcoming.Frame_Register1.Components[i]).Visible := False;
  for i := 0 to Form_Welcoming.Frame_Register1.ComponentCount - 1 do
    if (Form_Welcoming.Frame_Register2.Components[i] is TEdit) then
      TEdit(Form_Welcoming.Frame_Register2.Components[i]).Clear;
  for i := 0 to Form_Welcoming.Frame_Register2.ComponentCount - 1 do
    if (Form_Welcoming.Frame_Register2.Components[i] is TImage) then
      TImage(Form_Welcoming.Frame_Register2.Components[i]).Visible := False;
  for i := 0 to Form_Welcoming.Frame_Register2.ComponentCount - 1 do
    if (Form_Welcoming.Frame_Register2.Components[i] is TComboBox) then
      TComboBox(Form_Welcoming.Frame_Register2.Components[i]).ItemIndex := -1;
  Form_Welcoming.Frame_Register2.DateTimePicker_Date_DateNescience.DateTime :=now;
end;

procedure TFrame_Register3.Next;
begin
  Form_Welcoming.Notebook1.ActivePage := 'Page_Password';
  Form_Welcoming.Frame_Password.RadioButton1.Checked := True;
  Form_Welcoming.Frame_Password.RadioButton2.Enabled := False;
  ClearEdit;
end;

procedure TFrame_Register3.Prior;
begin
  Form_Welcoming.Notebook1.ActivePage := 'Page_Recording2';
  ClearEdit;
end;

end.
