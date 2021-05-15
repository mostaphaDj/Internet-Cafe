unit Form_Main_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, Frame_Cost_U, Frame_Cost_Cli_U;

type
  TForm_Main = class(TForm)
    ListBox1: TListBox;
    Panel1: TPanel;
    Button_Chonge_PC: TButton;
    Button_Terminate: TButton;
    ButtonOption: TButton;
    Frame_Cost_Cli1: TFrame_Cost_Cli;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form_Main: TForm_Main;

implementation

{$R *.dfm}

end.
