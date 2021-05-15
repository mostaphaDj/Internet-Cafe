unit Form_Demand_Use_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ValEdit, ExtCtrls, pngimage, NxPropertyItemClasses,
  NxPropertyItems, NxScrollControl, NxInspector;

type
  TForm_Demand_Use = class(TForm)
    OK: TButton;
    ButtonCancel: TButton;
    Label8: TLabel;
    Image1: TImage;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    NextInspector1: TNextInspector;
    NxToolbarItem1: TNxToolbarItem;
    NxButtonItemPoste: TNxButtonItem;
    NxButtonItemUser: TNxButtonItem;
    NxButtonItemTimeDesired: TNxButtonItem;
    EditPayment: TEdit;
    Label4: TLabel;
    CheckBox3: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Demand_Use: TForm_Demand_Use;

implementation

{$R *.dfm}

procedure TForm_Demand_Use.CheckBox1Click(Sender: TObject);
begin
  CheckBox2.Visible := CheckBox1.Checked;
end;

end.
