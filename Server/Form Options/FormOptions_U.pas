unit FormOptions_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, FrameRound_U, FrameOptionsConnexion_U;

type
  TFormOptions = class(TForm)
    TreeView1: TTreeView;
    Panel1: TPanel;
    Button1: TButton;
    ButtonApply: TButton;
    Button3: TButton;
    Notebook: TNotebook;
    FrameRound1: TFrameRound;
    FrameOptionsConnexion1: TFrameOptionsConnexion;
    procedure ButtonApplyClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TreeView1Changing(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOptions: TFormOptions;

implementation

{$R *.dfm}

procedure TFormOptions.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormOptions.Button3Click(Sender: TObject);
begin
  if ButtonApply.Enabled then
    ButtonApplyClick(Sender);
  Close;
end;

procedure TFormOptions.ButtonApplyClick(Sender: TObject);
begin
  FrameRound1.Apply;
  FrameOptionsConnexion1.Apply;
  ButtonApply.Enabled := False;
end;

procedure TFormOptions.TreeView1Changing(Sender: TObject; Node: TTreeNode;
  var AllowChange: Boolean);
begin
  Notebook.PageIndex := Node.Index
end;

end.
