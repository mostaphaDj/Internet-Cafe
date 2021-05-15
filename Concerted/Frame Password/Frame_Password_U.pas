unit Frame_Password_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrame_Password = class(TFrame)
    RadioButton1: TRadioButton;
    Edit_Entere_pseudonyme: TEdit;
    Label_Entere_Nam: TLabel;
    Edit_Mot_Passe: TEdit;
    Label_MotPasse: TLabel;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Button1: TButton;
    Label1: TLabel;
    Bevel1: TBevel;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    ImageEntere_pseudonyme: TImage;
    ImagePassword: TImage;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    Label_Message: TLabel;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Edit_Entere_pseudonymeKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Mot_PasseKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Entere_pseudonymeExit(Sender: TObject);
    procedure Edit_Mot_PasseExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ValidityPassword, ValidityPseudonyme: Boolean;
    // ’Õ… ﬂ·„… «·„—Ê— Ê «”„ «·œŒÊ·
    procedure Next; // «· Õﬁﬁ „‰ ’Õ… „⁄·Ê„«  «·„ﬂ Ê»… ﬁ»· «·„—Ê— ≈·Ï «·’›Õ… «·„Ê«·Ì…
  end;

implementation

uses Char_U, Type_U, Classes_U, DataModuleImages_U, Form_Welcoming_U,
  Form_Lock_U;
{$R *.dfm}

procedure TFrame_Password.Next;
resourcestring
  MsgText1 = 'ﬂ·„… «·„—Ê— ·« ﬁ· ⁄‰  4 Õ—Ê›';
  MsgText2 = '≈”„ «·„” Œœ„ ·« Ìﬁ· ⁄‰ 4 Õ—Ê›';
  MsgText3 = '«”„ «·„” Œœ„ €Ì— ’ÕÌÕ';
  MsgText4 = '⁄›Ê« ﬂ·„… «·„—Ê— €Ì— ’ÕÌÕ… ..';
begin
  if RadioButton1.Checked then
  begin
    if (Length(Edit_Entere_pseudonyme.Text) > 3) then
    begin
      if ValidityPseudonyme then
      begin
        if Length(Edit_Mot_Passe.Text) > 3 then
        begin
          if ValidityPassword then
          begin
            if TUser.IsAdministrator(Edit_Entere_pseudonyme.Text) then
              Form_Lock.UnLock_Windows
            else
            begin
              Form_Welcoming.Notebook1.ActivePage := 'Page_Limitation_Time';
              Form_Welcoming.Frame_Limitation_Time.Use_Account.PriceHour :=
                TUser.GetPriceHour(UnitObjets_Active,
                Edit_Entere_pseudonyme.Text);
              Form_Welcoming.Frame_Limitation_Time.Label_PriceHour.Caption :=
                CurrToStr
                (Form_Welcoming.Frame_Limitation_Time.Use_Account.PriceHour);
              Label1.Visible := False;
              Button1.Visible := False;
            end;
          end
          else
          begin
            MessageBox(Application.Handle, PChar(MsgText4), PChar
                (MsgCaptionError), MB_OK + MsgType);
            Label1.Visible := True;
            Button1.Visible := True;
          end;
        end
        else
        begin
          MessageBox(Application.Handle, PChar(MsgText1), PChar(MsgCaptionError)
              , MB_OK + MsgType);
          Label1.Visible := True;
          Button1.Visible := True;
        end;
      end
      else
      begin
        MessageBox(Application.Handle, PChar(MsgText4), PChar(MsgCaptionError),
          MB_OK + MsgType);
        Label1.Visible := True;
        Button1.Visible := True;
      end;
    end
    else
    begin
      MessageBox(Application.Handle, PChar(MsgText2), PChar(MsgCaptionError),
        MB_OK + MsgType);
    end;
  end
  else if RadioButton2.Checked then
    Form_Welcoming.Notebook1.ActivePage := 'Page_Recording1'
  else if RadioButton3.Checked then
  begin
    Form_Welcoming.Notebook1.ActivePage := 'Page_Limitation_Time';
    Form_Welcoming.Frame_Limitation_Time.Use_Account.PriceHour :=
      TUser.GetPriceHour(UnitObjets_Active, 'undefined');
    Form_Welcoming.Frame_Limitation_Time.Label_PriceHour.Caption := CurrToStr
      (Form_Welcoming.Frame_Limitation_Time.Use_Account.PriceHour);
    Label1.Visible := True;
    Button1.Visible := True;
  end;
end;

procedure TFrame_Password.RadioButton1Click(Sender: TObject);
begin
  Edit_Mot_Passe.Enabled := True;
  Edit_Entere_pseudonyme.Enabled := True;
  Edit_Mot_Passe.Color := clWindow;
  Edit_Entere_pseudonyme.Color := clWindow;
  Label_MotPasse.Font.Color := clWindowText;
  Label_Entere_Nam.Font.Color := clWindowText;
  Label1.Font.Color := clWindowText;
  Button1.Enabled := True;
end;

procedure TFrame_Password.RadioButton2Click(Sender: TObject);
begin
  Edit_Mot_Passe.Enabled := False;
  Edit_Entere_pseudonyme.Enabled := False;
  Edit_Mot_Passe.Color := clBtnFace;
  Edit_Entere_pseudonyme.Color := clBtnFace;
  Label_MotPasse.Font.Color := $0099A8AC;
  Label_Entere_Nam.Font.Color := $0099A8AC;
  Label1.Font.Color := $0099A8AC;
  Button1.Enabled := False;
end;

procedure TFrame_Password.RadioButton3Click(Sender: TObject);
resourcestring
  MsgText3 = '≈‰ ·„  ”Ã· «·œŒÊ· »≈”„ﬂ ›” ›ﬁœ ≈„ Ì«“«  ⁄œÌœ…';
begin
  if MessageBox(Application.Handle, PChar(MsgText3), PChar(MsgCaptionWarning),
    MB_OKCANCEL + MB_ICONWARNING + MB_DEFBUTTON2 + MB_SYSTEMMODAL + MB_RIGHT +
      MB_RTLREADING) = mrOK then
  begin
    Edit_Mot_Passe.Enabled := False;
    Edit_Entere_pseudonyme.Enabled := False;
    Edit_Mot_Passe.Color := clBtnFace;
    Edit_Entere_pseudonyme.Color := clBtnFace;
    Label_MotPasse.Font.Color := $0099A8AC;
    Label_Entere_Nam.Font.Color := $0099A8AC;
    Label1.Font.Color := $0099A8AC;
    Button1.Enabled := False;
  end
  else
  begin
    Form_Welcoming.ActiveControl := RadioButton1;
    RadioButton1.Checked := True;
  end;
end;

procedure TFrame_Password.Edit_Entere_pseudonymeKeyPress
  (Sender: TObject; var Key: Char);
begin
  if CharTalisman(Key) or CharMath(Key) or CharSignText(Key) or (Key in [' '])
    then
  begin
    Key := #0;
    Label_Message.Left := TWinControl(Sender).Left;
    Label_Message.Top := TWinControl(Sender).BoundsRect.Bottom;
    Label_Message.Visible := True;
  end
  else
    Label_Message.Visible := False;
end;

procedure TFrame_Password.Edit_Mot_PasseKeyPress
  (Sender: TObject; var Key: Char);
begin
  if CharArabic(Key) or CharFrenshe(Key) or CharTalisman(Key) or CharSignText
    (Key) or CharMath(Key) then
  begin
    Key := #0;
    Label_Message.Left := TWinControl(Sender)
      .Left + Form_Welcoming.Notebook1.Left;
    Label_Message.Top := TWinControl(Sender).BoundsRect.Bottom;
    Label_Message.Visible := True;
  end
  else
    Label_Message.Visible := False;
end;

procedure TFrame_Password.Edit_Entere_pseudonymeExit(Sender: TObject);
begin
  if Edit_Entere_pseudonyme.Text <> '' then
  begin
    if (Length(Edit_Entere_pseudonyme.Text) > 3) and
      (TUser.UsernameExists(Edit_Entere_pseudonyme.Text)) then
    begin
      ValidityPseudonyme := True;
      ImageEntere_pseudonyme.Picture.Assign(PngImageTrue);
    end
    else
    begin
      ValidityPseudonyme := False;
      ImageEntere_pseudonyme.Picture.Assign(PngImageFalse);
    end;
  end
  else
    ImageEntere_pseudonyme.Picture.Assign(nil);
end;

procedure TFrame_Password.Edit_Mot_PasseExit(Sender: TObject);
begin
  if Edit_Mot_Passe.Text <> '' then
  begin
    if (Length(Edit_Mot_Passe.Text) > 3) and
      (TUser.checkPassword(Edit_Entere_pseudonyme.Text, Edit_Mot_Passe.Text))
      then
    begin
      ValidityPassword := True;
      ImagePassword.Picture.Assign(PngImageTrue);

    end
    else
    begin
      ValidityPassword := False;
      ImagePassword.Picture.Assign(PngImageFalse);
    end;
  end
  else
    ImagePassword.Picture.Assign(nil);
end;

end.
