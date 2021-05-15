unit Form_Welcoming_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  jpeg, Frame_Password_U, Frame_Register3_U, Frame_Register2_U,
  Frame_Register1_U, Frame_Limitation_Time_Cli_U,
  Frame_Demand_Use_U, Buttons, Type_U, Frame_Limitation_Time_U,
  Frame_Password2_U, Frame_RegisterCustom2_U, Frame_RegisterCustom1_U;

type
  TForm_Welcoming = class(TForm)
    Notebook1: TNotebook;
    Button_Next: TBitBtn;
    Button_Cancel: TBitBtn;
    Image4: TImage;
    Frame_Demand_Use: TFrame_Demand_Use;
    Bevel1: TBevel;
    Image1: TImage;
    Frame_Limitation_Time: TFrame_Limitation_Time_Cli;
    Button_Prior: TBitBtn;
    Frame_Password: TFrame_Password;
    Frame_Password2: TFrame_Password2;
    Frame_Register1: TFrame_Register1;
    Frame_Register2: TFrame_Register2;
    Frame_Register3: TFrame_Register3;
    procedure Button_PriorClick(Sender: TObject);
    procedure Button_NextClick(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure Button_CancelClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    RecordUser: TRecordUser;
  end;

var
  Form_Welcoming: TForm_Welcoming;

implementation

uses Connexion_Module_U, Classes_U;
{$R *.dfm}

procedure TForm_Welcoming.Button_PriorClick(Sender: TObject);
begin
  if Notebook1.ActivePage = 'Page_Recording1' then
    Frame_Register1.Prior
  else if Notebook1.ActivePage = 'Page_Recording2' then
    Frame_Register2.Prior
  else if Notebook1.ActivePage = 'Page_Recording3' then
    Frame_Register3.Prior
  else if Notebook1.ActivePage = 'Page_Limitation_Time' then
    Frame_Limitation_Time.Prior;


end;

procedure TForm_Welcoming.Button_NextClick(Sender: TObject);
begin
  if Notebook1.ActivePage = 'Page_Password' then
    Frame_Password.Next
  else if Notebook1.ActivePage = 'Page_Password2' then
    Frame_Password2.Next
  else if Notebook1.ActivePage = 'Page_Recording1' then
    Frame_Register1.Next
  else if Notebook1.ActivePage = 'Page_Recording2' then
    Frame_Register2.Next
  else if Notebook1.ActivePage = 'Page_Recording3' then
    Frame_Register3.Next
  else if Notebook1.ActivePage = 'Page_Limitation_Time' then
    Frame_Limitation_Time.Start;
end;

procedure TForm_Welcoming.Notebook1PageChanged(Sender: TObject);
begin
  if Notebook1.ActivePage = 'Page_Password' then
  begin
    // Form_Welcoming.ActiveControl := Frame_Password.Edit_Entere_pseudonyme;
    Form_Welcoming.Button_Prior.Enabled := False;
    Form_Welcoming.Button_Next.Enabled := True;
  end
  else if Notebook1.ActivePage = 'Page_Recording1' then
  begin
    // Form_Welcoming.ActiveControl := Frame_Recording1.Edit_Nam;
    Form_Welcoming.Button_Prior.Enabled := True;
    Form_Welcoming.Button_Next.Enabled := True;
  end
  else if Notebook1.ActivePage = 'Page_Recording2' then
  begin
    // Form_Welcoming.ActiveControl := Frame_Recording2.DateTimePicker_Date_DateNescience;
    Form_Welcoming.Button_Prior.Enabled := True;
    Form_Welcoming.Button_Next.Enabled := True;
  end
  else if Notebook1.ActivePage = 'Page_Recording3' then
  begin
    // Form_Welcoming.ActiveControl := Form_Welcoming.Button_Next;
    Form_Welcoming.Button_Prior.Enabled := False;
    Form_Welcoming.Button_Next.Enabled := True;
  end
  else if Notebook1.ActivePage = 'Page_Limitation_Time' then
  begin
    // Form_Welcoming.ActiveControl := Frame_Limitation_Time.DateTimePicker_TimeDesired;
    Form_Welcoming.Button_Prior.Enabled := True;
    Form_Welcoming.Button_Next.Enabled := True;
  end
  else if Notebook1.ActivePage = 'Page_Demand_Use' then
  begin
    Form_Welcoming.Button_Prior.Enabled := False;
    Form_Welcoming.Button_Next.Enabled := False;
  end;
end;

procedure TForm_Welcoming.Button_CancelClick(Sender: TObject);
begin
  UnitObjets_Active.Use.Free;
  UnitObjets_Active.User.Free;
  ModalResult := mrCancel;
end;

end.
