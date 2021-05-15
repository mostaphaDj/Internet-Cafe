unit Frame_Udit_User_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Frame_Recording2_U, Frame_Recording1_U,
  Classes_U;
type
  TFrame_Udit_User = class(TFrame)
    Frame_Recording11: TFrame_Recording1;
    Frame_Recording21: TFrame_Recording2;
    Bevel1: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent;VUnitObjets:TUnitObjets);
  end;

implementation

{$R *.dfm}



{ TFrame_Udit_User }

constructor TFrame_Udit_User.Create(AOwner: TComponent;VUnitObjets:TUnitObjets);
begin

end;

end.

