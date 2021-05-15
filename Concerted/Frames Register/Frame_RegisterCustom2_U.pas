unit Frame_RegisterCustom2_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DateUtils;

type
  TFrame_RegisterCustom2 = class(TFrame)
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Edit_Adresse: TEdit;
    Edit_N_mobile: TEdit;
    Label_N_Telephone: TLabel;
    Label_Sexe: TLabel;
    ComboBox_Sexe: TComboBox;
    Label_Adresse: TLabel;
    Label_Date_de_Neconce: TLabel;
    DateTimePicker_Date_DateNescience: TDateTimePicker;
    Bevel1: TBevel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    ImageTelephone: TImage;
    ImageAdresse: TImage;
    ImageDate_DateNescience: TImage;
    Edit_Email2: TEdit;
    Edit_Email: TEdit;
    ImageEmail2: TImage;
    ImageEmail: TImage;
    Image6: TImage;
    Label_Confirm: TLabel;
    Label_Email: TLabel;
    Label_Message: TLabel;
    procedure Edit_N_mobileExit(Sender: TObject);
    procedure DateTimePicker_Date_DateNescienceExit(Sender: TObject);
    procedure Edit_EmailExit(Sender: TObject);
    procedure Edit_Email2Exit(Sender: TObject);
    procedure Edit_EmailKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function IsEmail: Boolean;
    function DateNescienceValid: Boolean;
    function N_MobileValid: Boolean;
    function EmailValid: Boolean;
    function Email2Valid: Boolean; // «· √ﬂœ „‰ ’Õ… «·≈„Ì·
  public
    { Public declarations }
    function AllValid2: Boolean; //  Õﬁﬁ „‰ ’Õ… ﬂ· «·»Ì«‰« 
  end;

implementation

uses Char_U, Type_U, Classes_U, DataModuleImages_U;
{$R *.dfm}
{ TFrame_Recording2 }

function TFrame_RegisterCustom2.AllValid2: Boolean;
begin
  Result := False;

  if not DateNescienceValid then
  begin
    MessageBox(Application.Handle, PChar(MsgText9), PChar(MsgCaptionError),
      MB_OK + MsgType);
    Windows.SetFocus(DateTimePicker_Date_DateNescience.Handle);
    Exit;
  end;

  if not N_MobileValid then
  begin
    MessageBox(Application.Handle, PChar(MsgText6), PChar(MsgCaptionError),
      MB_OK + MsgType);
    Windows.SetFocus(Edit_N_mobile.Handle);
    Exit;
  end;

  if not EmailValid then
  begin
    MessageBox(Application.Handle, PChar(MsgText8), PChar(MsgCaptionError),
      MB_OK + MsgType);
    Windows.SetFocus(Edit_Email.Handle);
    Exit;
  end;

  if not Email2Valid then
  begin
    MessageBox(Application.Handle, PChar(MsgText7), PChar(MsgCaptionError),
      MB_OK + MsgType);
    Windows.SetFocus(Edit_Email2.Handle);
    Exit;
  end;
  Result := True;
end;

function TFrame_RegisterCustom2.Email2Valid: Boolean;
begin
  Result := True;
  if (Edit_Email2.Text <> '') and (Edit_Email.Text <> '') then
  begin
    if (Edit_Email.Text = Edit_Email2.Text) and IsEmail then
    begin
      ImageEmail2.Picture.Assign(PngImageTrue);
    end
    else
    begin
      ImageEmail2.Picture.Assign(PngImageFalse);
      Result := False;
    end;
  end
  else
    ImageEmail2.Picture.Assign(nil);
end;

function TFrame_RegisterCustom2.EmailValid: Boolean;
begin
Result := True;
  if Edit_Email.Text <> '' then
  begin
    if IsEmail then
    begin
      ImageEmail.Picture.Assign(PngImageTrue);
    end
    else
    begin
       ImageEmail.Picture.Assign(PngImageFalse);
         Result := False;
    end;

  end
  else
    ImageEmail.Picture.Assign(nil);

end;

function TFrame_RegisterCustom2.N_MobileValid: Boolean;
begin

  if Edit_N_mobile.Text <> '' then
  begin
    if Length(Edit_N_mobile.Text) = 9 then
    begin
      ImageTelephone.Picture.Assign(PngImageTrue);
      Result := True;
    end
    else
    begin
      ImageTelephone.Picture.Assign(PngImageFalse);
      Result := False;
    end;
  end
  else
  begin
    ImageTelephone.Picture.Assign(nil);
    Result := True;
  end;
end;

function TFrame_RegisterCustom2.DateNescienceValid: Boolean;
begin
  Result := False;
  if YearOf(DateTimePicker_Date_DateNescience.Date) < (YearOf(Now) - 11) then
  begin
    ImageDate_DateNescience.Picture.Assign(PngImageTrue);
    Result := True;
  end
  else
    ImageDate_DateNescience.Picture.Assign(PngImageFalse);
end;

procedure TFrame_RegisterCustom2.Edit_N_mobileExit(Sender: TObject);
begin
  N_MobileValid;
end;

function TFrame_RegisterCustom2.IsEmail: Boolean; // «· √ﬂœ „‰ ’Õ… «·≈„Ì·
var
  I: Integer;
begin
  Result := False;
  if Edit_Email.Text <> '' then
    if CharAnglesh(Edit_Email.Text[1]) then
    begin
      for I := 2 to Length(Edit_Email.Text) do
      begin
        if (Edit_Email.Text[I] = '@') then
        begin
          if (CharAnglesh(Edit_Email.Text[I + 1])) then
          begin
            if copy(Edit_Email.Text, Length(Edit_Email.Text) - 3, Length
                (Edit_Email.Text)) = '.com' then
            begin
              Result := True;
            end;
          end;
        end;
      end;
    end;
end;

procedure TFrame_RegisterCustom2.Edit_Email2Exit(Sender: TObject);
begin
  Email2Valid;
end;

procedure TFrame_RegisterCustom2.Edit_EmailExit(Sender: TObject);
begin
  EmailValid;
end;

procedure TFrame_RegisterCustom2.DateTimePicker_Date_DateNescienceExit
  (Sender: TObject);
begin
  DateNescienceValid;
end;

procedure TFrame_RegisterCustom2.Edit_EmailKeyPress
  (Sender: TObject; var Key: Char);
begin
  if not (CharAnglesh(Key) or (Key in ['0'..'9']) or (Key in ['@', '.',#8])) then
  begin
    Key := #0;
    Label_Message.Left := TWinControl(Sender).Left ;
    Label_Message.Top := TWinControl(Sender).BoundsRect.Bottom;
    Label_Message.Visible := True;
  end
  else
    Label_Message.Visible := False;
end;

end.
