unit Frame_RegisterCustom1_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, ComCtrls, Type_U;

type
  TFrame_RegisterCustom1 = class(TFrame)
    Label6: TLabel;
    Edit_pseudonyme: TEdit;
    Label_pseudonyme: TLabel;
    Label7: TLabel;
    Edit_Mot_Passe1: TEdit;
    Label_Mot_De_Passe1: TLabel;
    Label8: TLabel;
    Edit_Mot_Passe2: TEdit;
    Label_Mot_De_Passe2: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    Edit_Nam: TEdit;
    Label3: TLabel;
    Edit_Prenam: TEdit;
    Label4: TLabel;
    Label_Last_Name: TLabel;
    Label_First_Name: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Image5: TImage;
    Image6: TImage;
    Image1: TImage;
    Image3: TImage;
    ImageNam: TImage;
    ImagePrenam: TImage;
    ImageUsername: TImage;
    ImagePassword: TImage;
    ImagePassword2: TImage;
    Label_Message: TLabel;
    procedure Edit_pseudonymeKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_Mot_Passe1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit_NamKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_NamExit(Sender: TObject);
    procedure Edit_pseudonymeExit(Sender: TObject);
    procedure Edit_Mot_Passe1Exit(Sender: TObject);
    procedure Edit_PrenamExit(Sender: TObject);
    procedure Edit_Mot_Passe2Exit(Sender: TObject);
  private
    function pseudonymeValid: Boolean;
    function PassWord1Valid: Boolean;
    function PasseWord2Valid: Boolean;
    function NameValid: Boolean;
    function PrenamValid:Boolean;
    { Private declarations }
  public
    { Public declarations }
    function AllValid1: Boolean; //  Õﬁﬁ „‰ ’Õ… ﬂ· «·»Ì«‰« 
  end;

implementation

uses Connexion_Module_U, Char_U,
  IdTCPConnection, Classes_U, DataModuleImages_U;
{$R *.dfm}

function TFrame_RegisterCustom1.AllValid1: Boolean;
begin
  Result := False;

  if not pseudonymeValid then
  begin
    MessageBox(Application.Handle, PChar(MsgText3), PChar(MsgCaptionError),
      MB_OK + MsgType);
    Windows.SetFocus(Edit_pseudonyme.Handle);
    Exit;
  end;

  if not PassWord1Valid then
  begin
    MessageBox(Application.Handle, PChar(MsgText2), PChar(MsgCaptionError),
      MB_OK + MsgType);
      Windows.SetFocus(Edit_Mot_Passe1.Handle);
    Exit;
  end;

  if not PasseWord2Valid then
  begin
    MessageBox(Application.Handle, PChar(MsgText1), PChar(MsgCaptionError),
      MB_OK + MsgType);
      Windows.SetFocus(Edit_Mot_Passe1.Handle);
    Exit;
  end;

  if not NameValid then
  begin
    MessageBox(Application.Handle, PChar(MsgText5), PChar(MsgCaptionError),
      MB_OK + MsgType);
      Windows.SetFocus(Edit_Nam.Handle);
    Exit;
  end;

  if not PrenamValid then
  begin
    MessageBox(Application.Handle, PChar(MsgText4), PChar(MsgCaptionError),
      MB_OK + MsgType);
    Windows.SetFocus(Edit_Prenam.Handle);
    Exit;
  end;

  Result := True;
end;

function TFrame_RegisterCustom1.PrenamValid:Boolean;
begin
Result:=False;
  if Edit_Prenam.Text <> '' then
  begin
    if (Length(Edit_Prenam.Text) > 3) then
    begin
      ImagePrenam.Picture.Assign(PngImageTrue);
      Result:=True;
    end
    else
      ImagePrenam.Picture.Assign(PngImageFalse);
  end
  else
    ImagePrenam.Picture.Assign(nil);
end;

function TFrame_RegisterCustom1.NameValid: Boolean;
begin
  Result := False;
  if Edit_Nam.Text <> '' then
  begin
    if (Length(Edit_Nam.Text) > 3) then
    begin
      ImageNam.Picture.Assign(PngImageTrue);
      Result := True;
    end
    else
      ImageNam.Picture.Assign(PngImageFalse);
  end
  else
    ImageNam.Picture.Assign(nil);
end;

function TFrame_RegisterCustom1.PasseWord2Valid: Boolean;
begin
  result := False;
  if Edit_Mot_Passe2.Text <> '' then
  begin
    if (Edit_Mot_Passe2.Text = Edit_Mot_Passe1.Text) and
      (Length(Edit_Mot_Passe1.Text) > 3) then
    begin
      ImagePassword2.Picture.Assign(PngImageTrue);
      result := True;
    end
    else
      ImagePassword2.Picture.Assign(PngImageFalse);
  end
  else
    ImagePassword2.Picture.Assign(nil);
end;

function TFrame_RegisterCustom1.PassWord1Valid: Boolean;
begin
  result := False;
  if Edit_Mot_Passe1.Text <> '' then
  begin
    if Length(Edit_Mot_Passe1.Text) > 3 then
    begin
      ImagePassword.Picture.Assign(PngImageTrue);
      result := True;
    end
    else
      ImagePassword.Picture.Assign(PngImageFalse);
  end
  else
    ImagePassword.Picture.Assign(nil);
end;

function TFrame_RegisterCustom1.pseudonymeValid: Boolean;
resourcestring
  MsgText1 = '«”„ «·œŒÊ· Â–« „ÕÃÊ“ √œŒ· «”„ œŒÊ· ¬Œ—';
begin
  Result := False;
  if Edit_pseudonyme.Text <> '' then
  begin
    if (Length(Edit_pseudonyme.Text) > 3) then
    begin
      if not TUser.UsernameExists(Edit_pseudonyme.Text) then
      begin
        ImageUsername.Picture.Assign(PngImageTrue);
        Result := True;
      end
      else
      begin
        MessageBox(Application.Handle, PChar(MsgText1), PChar(MsgCaptionError),
          MB_OK + MsgType);
        Edit_pseudonyme.Clear;
        Windows.SetFocus(Edit_pseudonyme.Handle);
      end;
    end
    else
      ImageUsername.Picture.Assign(PngImageFalse);
  end
  else
    ImageUsername.Picture.Assign(nil);
end;

procedure TFrame_RegisterCustom1.Edit_pseudonymeKeyPress
  (Sender: TObject; var Key: Char);
begin
  if CharTalisman(Key) or CharMath(Key) or CharSignText(Key) or (Key in [' '])
    then
  begin
    Key := #0;
    Label_Message.Left := TWinControl(Sender).Left ;
    Label_Message.Top := TWinControl(Sender).BoundsRect.Bottom ;
    Label_Message.Visible := True;
  end
  else
    Label_Message.Visible := False;
end;

procedure TFrame_RegisterCustom1.Edit_Mot_Passe1KeyPress
  (Sender: TObject; var Key: Char);
begin
  if CharArabic(Key) or CharFrenshe(Key) or CharTalisman(Key) or CharSignText
    (Key) or CharMath(Key) then
  begin
    Key := #0;
    Label_Message.Left := TWinControl(Sender).Left;
    Label_Message.Top := TWinControl(Sender).BoundsRect.Bottom;
    Label_Message.Visible := True;
  end
  else
    Label_Message.Visible := False;
end;

procedure TFrame_RegisterCustom1.Edit_NamKeyPress
  (Sender: TObject; var Key: Char);
begin
  if not (CharArabic(Key) or CharAnglesh(Key) or CharFrenshe(Key) or (Key in [' ',#8])) then
  begin
    Key := #0;
    Label_Message.Left := TWinControl(Sender).Left;
    Label_Message.Top := TWinControl(Sender).BoundsRect.Bottom;
    Label_Message.Visible := True;
  end
  else
    Label_Message.Visible := False;
end;

procedure TFrame_RegisterCustom1.Edit_NamExit(Sender: TObject);
begin
  NameValid;
end;

procedure TFrame_RegisterCustom1.Edit_pseudonymeExit(Sender: TObject);

begin
  pseudonymeValid;

end;

procedure TFrame_RegisterCustom1.Edit_Mot_Passe1Exit(Sender: TObject);
begin
  PassWord1Valid;
end;

procedure TFrame_RegisterCustom1.Edit_PrenamExit(Sender: TObject);
begin
  PrenamValid;
end;

procedure TFrame_RegisterCustom1.Edit_Mot_Passe2Exit(Sender: TObject);
begin
  PasseWord2Valid;
end;

end.
