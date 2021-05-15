unit Frame_Demand_Use_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFrame_Demand_Use = class(TFrame)
    LabelDemand: TLabel;
    ProgressBar2: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
{ TFrame_Demand_Use }

end.
