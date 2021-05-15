unit Form_Main_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ToolWin, Menus, StdCtrls;

type
  TForm_Main = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    ools1: TMenuItem;
    Option1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Help2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Option1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form_Main: TForm_Main;

implementation

uses Form_ListView_Post_Client_U, Action_Module_U, FormOptions_U;
{$R *.dfm}

procedure TForm_Main.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_Main.FormShow(Sender: TObject);
begin
  Form_ListView_Post_Client := TForm_ListView_Post_Client.Create(Self);
end;

procedure TForm_Main.Option1Click(Sender: TObject);
begin
  FormOptions := TFormOptions.Create(Self);
  FormOptions.ShowModal;
  FreeAndNil(FormOptions);
end;

end.
