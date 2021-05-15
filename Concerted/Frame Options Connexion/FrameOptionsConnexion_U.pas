unit FrameOptionsConnexion_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxPropertyItemClasses, NxPropertyItems, NxScrollControl, NxInspector;

type
  TFrameOptionsConnexion = class(TFrame)
    NextInspector1: TNextInspector;
    NxToolbarItem1: TNxToolbarItem;
    NxTextItem1: TNxTextItem;
    NxTextItem2: TNxTextItem;
    NxTextItem3: TNxTextItem;
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Apply;
  end;

implementation

{$R *.dfm}
{ TFrameOptionsConnexion }

procedure TFrameOptionsConnexion.Apply;
begin

end;

end.
