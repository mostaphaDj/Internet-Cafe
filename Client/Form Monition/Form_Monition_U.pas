unit Form_Monition_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm_Monition = class(TForm)
    Button_Close: TButton;
    Label1: TLabel;
    Button1: TButton;
    Label_Time: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_CloseClick(Sender: TObject);
  private
    { Private declarations }
    Monition: Boolean;
  public
    { Public declarations }
  end;

var
  Form_Monition: TForm_Monition;

implementation

uses Form_Limitation_Time_Cli_U, Frame_Cost_Cli_U;
{$R *.dfm}

procedure TForm_Monition.Button1Click(Sender: TObject);
begin
  if Assigned(Form_Limitation_Time) then
  begin
    Form_Limitation_Time := TForm_Limitation_Time.Create(Application);
    Form_Limitation_Time.ShowModal;
  end;
end;

procedure TForm_Monition.Button_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_Monition.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Form_Monition);
end;

end.
