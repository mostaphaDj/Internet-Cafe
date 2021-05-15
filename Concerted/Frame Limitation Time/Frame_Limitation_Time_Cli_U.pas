unit Frame_Limitation_Time_Cli_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Frame_Limitation_Time_U;

type
  TFrame_Limitation_Time_Cli = class(TFrame_Limitation_Time)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Prior; // ··Œ·›
    procedure Start; // «· Õﬁﬁ „‰ ’Õ… „⁄·Ê„«  «·„ﬂ Ê»… ﬁ»· «·„—Ê— ≈·Ï «·’›Õ… «·„Ê«·Ì…
    constructor Create(AOwner: TComponent); override;
  end;

var
  Frame_Limitation_Time_Cli: TFrame_Limitation_Time_Cli;

implementation

uses Form_Welcoming_U, Char_U, Type_U, Classes_U;
{$R *.dfm}

constructor TFrame_Limitation_Time_Cli.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TFrame_Limitation_Time_Cli.Prior;
begin
  Form_Welcoming.Notebook1.ActivePage := 'Page_Password';
end;

procedure TFrame_Limitation_Time_Cli.Start;
resourcestring
  MsgText = '·„  Õœœ «·„œ… Â·  —ÌÌœ «·„ «»⁄… »Êﬁ  €Ì— „ÕœÊœ';
begin
  if RadioButton2.Checked then
    Use_Account.TimeDesired := 0
  else if Use_Account.CostVirtual = 0 then
    if MessageBox(Application.Handle, PChar(MsgText), PChar(MsgCaptionWarning),
      MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2 + MB_SYSTEMMODAL + MB_RIGHT +
        MB_RTLREADING) = IDYES then
      Use_Account.TimeDesired := 0;

  Form_Welcoming.Notebook1.ActivePage := 'Page_Demand_Use';
  Form_Welcoming.Button_Next.Enabled := False;
  Form_Welcoming.Button_Prior.Enabled := False;
  if Form_Welcoming.Frame_Password.RadioButton1.Checked then
    TUser.Demand_Use(Form_Welcoming.Frame_Password.Edit_Entere_pseudonyme.Text,
      Use_Account.TimeDesired, UnitObjets_Active)
  else
    TUser.Demand_Use('undefined', Use_Account.TimeDesired, UnitObjets_Active);
end;

end.
