unit Frame_Register2_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Frame_RegisterCustom2_U, ComCtrls, StdCtrls, ExtCtrls;

type
  TFrame_Register2 = class(TFrame_RegisterCustom2)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Next;
    procedure Prior; // ··Œ·›
  end;

var
  Frame_Register2: TFrame_Register2;

implementation

uses Form_Welcoming_U, Classes_U;
{$R *.dfm}
{ TFrame_Register2 }

procedure TFrame_Register2.Next;
begin
  if AllValid2 then
  begin
    with Form_Welcoming do
    begin
      RecordUser.DateNescience := DateTimePicker_Date_DateNescience.DateTime;
      RecordUser.N_mobile := StrToIntDef(Edit_N_mobile.Text, 0);
      RecordUser.Adresse := Edit_Adresse.Text;
      RecordUser.sexe := Boolean(ComboBox_Sexe.ItemIndex);
      RecordUser.Vocation := ComboBox1.Text;
      RecordUser.Niveau_Informatique := ComboBox2.Text;
      RecordUser.Date_Register := Now;
      RecordUser.Computation := 0;
      RecordUser.Email := Edit_Email.Text;

      Notebook1.ActivePage := 'Page_Recording3';
      if TUser.Recording(RecordUser, nil) then
      begin
        Button_Next.Enabled := False;
        Button_Prior.Enabled := False;
      end
    end;
  end;
end;

procedure TFrame_Register2.Prior;
begin
  Form_Welcoming.Notebook1.ActivePage := 'Page_Recording1';
end;

end.
