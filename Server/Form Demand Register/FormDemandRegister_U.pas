unit FormDemandRegister_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DB, ADODB, Type_U,
  Frame_RegisterCustom2_U, Frame_RegisterCustom1_U;

type
  TFormDemandRegister = class(TForm)
    ButtonCancel: TButton;
    ButtonOK: TButton;
    CheckBox1: TCheckBox;
    Table_User: TADOTable;
    Table_Userpseudonyme: TWideStringField;
    Table_UserPrenom: TWideStringField;
    Table_UserNom: TWideStringField;
    Table_UserPassword: TWideStringField;
    Table_UserEmail: TWideStringField;
    Table_UserAdresse: TMemoField;
    Table_UserDateNescience: TDateTimeField;
    Table_UserDate_Register: TDateTimeField;
    Table_UserN_mobile: TSmallintField;
    Table_UserNiveau_Informatique: TWideStringField;
    Table_UserVocation: TWideStringField;
    Table_UserSexe: TBooleanField;
    DS_User: TDataSource;
    Frame_RegisterCustom11: TFrame_RegisterCustom1;
    Frame_RegisterCustom21: TFrame_RegisterCustom2;
    Table_UserRate: TWideStringField;
    Table_UserComputation: TBCDField;
    procedure ButtonOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FRecordUser: TRecordUser;
  end;

var
  FormDemandRegister: TFormDemandRegister;

implementation

{$R *.dfm}

procedure TFormDemandRegister.ButtonOKClick(Sender: TObject);
begin
  if Frame_RegisterCustom11.AllValid1 and Frame_RegisterCustom21.AllValid2 then
  begin
    try
      Table_User.Open;
      Table_User.Insert;
      with Frame_RegisterCustom11 do
      begin
        Table_Userpseudonyme.Value := Edit_pseudonyme.Text;
        Table_UserPrenom.Value := Edit_Prenam.Text;
        Table_UserNom.Value := Edit_Nam.Text;
        Table_UserPassword.Value := Edit_Mot_Passe1.Text;
      end;

      with Frame_RegisterCustom21 do
      begin
        Table_UserEmail.Value := Edit_Email.Text;
        Table_UserAdresse.Value := Edit_Adresse.Text;
        Table_UserDateNescience.Value := DateTimePicker_Date_DateNescience.Date;
        Table_UserN_mobile.Value := StrToIntDef(Edit_N_mobile.Text,0);
        Table_UserNiveau_Informatique.Value := ComboBox1.Text;
        Table_UserVocation.Value := ComboBox2.Text;
        if ComboBox_Sexe.ItemIndex<>2 then
        Table_UserSexe.Value := Boolean(ComboBox_Sexe.ItemIndex);
      end;
      Table_UserDate_Register.Value := FRecordUser.Date_Register;
      Table_UserRate.Value := Common;

      Table_User.Post;
      Table_User.Close;
      ModalResult := mrOk;
    except
    end;
  end;
end;

procedure TFormDemandRegister.FormShow(Sender: TObject);
begin
  with FormDemandRegister.FRecordUser do
  begin
    with Frame_RegisterCustom11 do
    begin
      Edit_pseudonyme.Text := pseudonyme; // ≈”„  «·œŒÊ·
      Edit_Mot_Passe1.Text := Password;
      Edit_Mot_Passe2.Text := Password;
      Edit_Prenam.Text := Prename; // ≈”„ «·„” ⁄„·
      Edit_Nam.Text := FormDemandRegister.FRecordUser.Name; // ≈”„ «·⁄∆·…
    end;

    with Frame_RegisterCustom21 do
    begin
    if Sexe then
      ComboBox_Sexe.ItemIndex := 1
    else
      ComboBox_Sexe.ItemIndex := 0;

      Edit_Email.Text := Email; // «·»—Ìœ «·≈·ﬂ —Ê‰Ì
      Edit_Email2.Text := Email; // «·»—Ìœ «·≈·ﬂ —Ê‰Ì
      Edit_Adresse.Text := Adresse; // «·⁄‰Ê«‰
      DateTimePicker_Date_DateNescience.Date := DateNescience;

      //  «—ÌŒ «· ”ÃÌ·
      if N_mobile<>0 then
      Edit_N_mobile.Text := IntToStr(N_mobile); // «·Â« › «·ÃÊ«·

      ComboBox2.Text := Niveau_Informatique;
      // «·Ê” ÊÏ ›Ì «·≈⁄·«„ «·¬·Ì
      ComboBox1.Text := Vocation; // «·„Â‰…
    end;
  end;
end;

end.
