unit Frame_Limitation_Time_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls,
  Classes_U, Use_Account_U;

type
  TFrame_Limitation_Time = class(TFrame)
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label_PriceHour: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox1: TGroupBox;
    DateTimePicker_TimeDesired: TDateTimePicker;
    Image2: TImage;
    LabelTimeDesired: TLabel;
    LabelCost: TLabel;
    Edit_Cost: TEdit;
    Image5: TImage;
    Image3: TImage;
    DateTimePicker_TimeFinVirtual: TDateTimePicker;
    LabelTimeFin: TLabel;
    EditPayment: TEdit;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    Bevel1: TBevel;
    LabelUserName: TLabel;
    procedure Edit_CostChange(Sender: TObject);
    procedure Edit_CostEnter(Sender: TObject);
    procedure Edit_CostExit(Sender: TObject);
    procedure DateTimePicker_TimeDesiredChange(Sender: TObject);
    procedure DateTimePicker_TimeDesiredEnter(Sender: TObject);
    procedure DateTimePicker_TimeDesiredExit(Sender: TObject);
    procedure DateTimePicker_TimeFinVirtualChange(Sender: TObject);
    procedure DateTimePicker_TimeFinVirtualEnter(Sender: TObject);
    procedure DateTimePicker_TimeFinVirtualExit(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure EditPaymentExit(Sender: TObject);
  private
    { DÈclarations privÈes }
  public
    { DÈclarations publiques }
    FUserName : string;
    Use_Account: TUse_Account;
    constructor Create(AOwner: TComponent); override;
    function IfTimeFinLaterNow: Boolean; // «–« ﬂ«‰ «·Êﬁ  «·„Õœœ √ﬂ»— „‰ «·Êﬁ  «·Õ«·Ì
    destructor Destroy; override;
  end;

implementation

uses DateUtils, Char_U, Type_U, IdTCPConnection;
{$R *.dfm}

procedure TFrame_Limitation_Time.EditPaymentExit(Sender: TObject);
begin
  EditPayment.text := CurrToStrFormat(StrFormatToCurr(EditPayment.text));
end;

procedure TFrame_Limitation_Time.Edit_CostChange(Sender: TObject);
resourcestring
  MsgText = 'ÌÃ» √‰ ÌﬂÊ‰ «·„»·€ «ﬁ· „‰ 120000';
begin
  if Edit_Cost.text <> '' then
  begin
    if StrFormatToCurr(Edit_Cost.text) <= 1195 then
    begin
      Use_Account.CostVirtual := StrFormatToCurr(Edit_Cost.text);
      EditPayment.text := CurrToStrFormat(Use_Account.CostVirtual);
      DateTimePicker_TimeDesired.Time := Use_Account.TimeDesired;
      DateTimePicker_TimeFinVirtual.DateTime := Use_Account.TimeFin;
    end
    else
      MessageBox(Application.Handle, PChar(MsgText), PChar(MsgCaptionWarning),
        MB_OK + MsgType);
  end;
end;

procedure TFrame_Limitation_Time.Edit_CostEnter(Sender: TObject);
begin
  Edit_Cost.OnChange := Edit_CostChange;
end;

procedure TFrame_Limitation_Time.Edit_CostExit(Sender: TObject);
begin
  Edit_Cost.OnChange := nil;
  Edit_Cost.text := CurrToStrFormat(Use_Account.CostVirtual);
  EditPayment.text := Edit_Cost.text;
end;

procedure TFrame_Limitation_Time.DateTimePicker_TimeDesiredChange
  (Sender: TObject);
begin
  Use_Account.TimeDesired := DateTimePicker_TimeDesired.Time;
  Edit_Cost.text := CurrToStrFormat(Use_Account.CostVirtual);
  EditPayment.text := Edit_Cost.text;
  DateTimePicker_TimeFinVirtual.DateTime := Use_Account.TimeFin;
end;

procedure TFrame_Limitation_Time.DateTimePicker_TimeDesiredEnter
  (Sender: TObject);
begin
  DateTimePicker_TimeDesired.OnChange := DateTimePicker_TimeDesiredChange;
end;

procedure TFrame_Limitation_Time.DateTimePicker_TimeDesiredExit
  (Sender: TObject);
begin
  DateTimePicker_TimeDesired.OnChange := nil;
end;

procedure TFrame_Limitation_Time.DateTimePicker_TimeFinVirtualChange
  (Sender: TObject);
begin
  if DateTimePicker_TimeFinVirtual.DateTime > Now + 1 then
    DateTimePicker_TimeFinVirtual.Date := Now;
  if DateTimePicker_TimeFinVirtual.DateTime < Now then
    DateTimePicker_TimeFinVirtual.Date := Now + 1;

  Use_Account.TimeFin := DateTimePicker_TimeFinVirtual.DateTime; ;
  Edit_Cost.text := CurrToStrFormat(Use_Account.CostVirtual);
  EditPayment.text := Edit_Cost.text;
  DateTimePicker_TimeDesired.Time := Use_Account.TimeDesired;
end;

procedure TFrame_Limitation_Time.DateTimePicker_TimeFinVirtualEnter
  (Sender: TObject);
begin
  DateTimePicker_TimeFinVirtual.OnChange := DateTimePicker_TimeFinVirtualChange;
end;

procedure TFrame_Limitation_Time.DateTimePicker_TimeFinVirtualExit
  (Sender: TObject);
begin
  DateTimePicker_TimeFinVirtual.OnChange := nil;
end;

procedure TFrame_Limitation_Time.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    CheckBox1.Caption := ''
  else
    CheckBox1.Caption := ' „ œ›⁄ ”⁄— Â–Â «·Ã·”…';
  EditPayment.Visible := CheckBox1.Checked;
  Label4.Visible := CheckBox1.Checked;
end;

constructor TFrame_Limitation_Time.Create(AOwner: TComponent);
begin
  inherited;
  DateTimePicker_TimeFinVirtual.Time := TimeOf(Now);
  DateTimePicker_TimeFinVirtual.MinDate := TimeOf(Now);
  FUserName := Unknown;
  LabelUserName.Caption := 'UserName: '+ FUserName;
  Use_Account := TUse_Account.Create;
  RadioButton2Click(AOwner);
end;

destructor TFrame_Limitation_Time.Destroy;
begin
  inherited;
  Use_Account.Free;
end;

procedure TFrame_Limitation_Time.RadioButton1Click(Sender: TObject);
begin
  GroupBox1.Enabled := RadioButton1.Checked;
  DateTimePicker_TimeDesired.Enabled := RadioButton1.Checked;
  LabelTimeDesired.Font.Color := clRed;
  Edit_Cost.Enabled := RadioButton1.Checked;
  LabelCost.Font.Color := clRed;
  DateTimePicker_TimeFinVirtual.Enabled := RadioButton1.Checked;
  LabelTimeFin.Font.Color := clRed;

  CheckBox1.Enabled := RadioButton1.Checked;
  CheckBox1.Font.Color := clWindowText;
  EditPayment.Enabled := RadioButton1.Checked;
  Label4.Font.Color := clRed;
end;

procedure TFrame_Limitation_Time.RadioButton2Click(Sender: TObject);
begin
  GroupBox1.Enabled := RadioButton1.Checked;
  DateTimePicker_TimeDesired.Enabled := RadioButton1.Checked;
  LabelTimeDesired.Font.Color := $0099A8AC;
  Edit_Cost.Enabled := RadioButton1.Checked;
  LabelCost.Font.Color := $0099A8AC;
  DateTimePicker_TimeFinVirtual.Enabled := RadioButton1.Checked;
  LabelTimeFin.Font.Color := $0099A8AC;

  CheckBox1.Enabled := RadioButton1.Checked;
  CheckBox1.Font.Color := $0099A8AC;
  EditPayment.Enabled := RadioButton1.Checked;
  Label4.Font.Color := $0099A8AC;
end;

function TFrame_Limitation_Time.IfTimeFinLaterNow: Boolean;
resourcestring
  String_Message = '«·Êﬁ  «·–Ì Õœœ Â √ﬁ· „‰ «·Êﬁ  «·Õ«·Ì';
begin
  if CompareDateTime(DateTimePicker_TimeFinVirtual.DateTime, Now) = 1 then
  begin
    Result := True;
  end
  else
  begin
    MessageBox(Handle, PChar(String_Message), PChar(MsgCaptionError), $180000);
    Result := False;
  end;
end;

end.
