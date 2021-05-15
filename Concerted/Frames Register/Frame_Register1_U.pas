unit Frame_Register1_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Frame_RegisterCustom1_U, StdCtrls, ExtCtrls;

type
  TFrame_Register1 = class(TFrame_RegisterCustom1)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Next; // «· Õﬁﬁ „‰ ’Õ… „⁄·Ê„«  «·„ﬂ Ê»… ﬁ»· «·„—Ê— ≈·Ï «·’›Õ… «·„Ê«·Ì…
    procedure Prior; // ··Œ·›
  end;

var
  Frame_Register1: TFrame_Register1;

implementation

uses Form_Welcoming_U;
{$R *.dfm}
{ TFrame_Register1 }

procedure TFrame_Register1.Next;
begin
  if AllValid1 then
  begin
    with Form_Welcoming do
    begin
      RecordUser.Name := Edit_Nam.Text;
      RecordUser.Prename := Edit_Prenam.Text;
      RecordUser.pseudonyme := Edit_pseudonyme.Text;
      RecordUser.Password := Edit_Mot_Passe2.Text;
      RecordUser.Rate := 'common';
      Notebook1.ActivePage := 'Page_Recording2';
    end;
  end;
end;

procedure TFrame_Register1.Prior;
begin
  Form_Welcoming.Notebook1.ActivePage := 'Page_Password';
  Form_Welcoming.Button_Prior.Enabled := False;
end;

end.
