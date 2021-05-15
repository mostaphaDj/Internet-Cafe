unit FormGridUse_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles,  cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  TFormGridUse = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1pseudonymeUser: TcxGridDBColumn;
    cxGrid1DBTableView1HostName: TcxGridDBColumn;
    cxGrid1DBTableView1TimeStart: TcxGridDBColumn;
    cxGrid1DBTableView1TimeUse: TcxGridDBColumn;
    cxGrid1DBTableView1CostPayment: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGridUse: TFormGridUse;

implementation

uses DataModuleBaseSynchronization_U;

{$R *.dfm}

end.
