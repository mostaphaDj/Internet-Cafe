unit FrameRound_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, Registry, NxPropertyItemClasses, NxPropertyItems,
  NxScrollControl, NxInspector;

type
  TFrameRound = class(TFrame)
    NextInspectorNiveauRound: TNextInspector;
    NxToolbarItem1: TNxToolbarItem;
    NxSpinItemUnitRound: TNxSpinItem;
    NxSpinItemNiveauRound: TNxSpinItem;
    procedure NextInspectorNiveauRoundKeyPress(Sender: TObject; var Key: Char);
    procedure NextInspectorNiveauRoundChange(Sender: TObject;
      Item: TNxPropertyItem; Value: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    Procedure Apply;
  end;

implementation

uses Char_U, Type_U;
{$R *.dfm}
{ TFrameValuation }

procedure TFrameRound.Apply;
resourcestring
  MsgCaptionRegistryRead = 'Œÿ√  ›Ì «” ⁄„«· ”Ã· «·‰Ÿ«„';
  MsgTextRegistryRead = 'Œÿ√ ⁄‰œ «·ﬁ—«¡… „‰ ”Ã· «·‰Ÿ«„';
Var
  Registry: TRegistry;
begin
  inherited;
  Registry := TRegistry.Create;
  with Registry do
  begin
    try
      RootKey := HKEY_CURRENT_USER;
      OpenKey('Software\DJ_group\MyCafe\Round', True);
      WriteCurrency('UnitRound', StrToCurrDef(NxSpinItemUnitRound.Value, 0)); //
      VRecordRound.UnitRound := StrFormatToCurr(NxSpinItemUnitRound.Value);
      WriteCurrency('NiveauRound', StrToCurrDef(NxSpinItemNiveauRound.Value, 0)
        ); //
      VRecordRound.ValueNiveauRound := StrFormatToCurr(NxSpinItemNiveauRound.Value);
      CloseKey;
      Free;
    except
      MessageBox(Application.Handle, PChar(MsgTextRegistryRead), PChar
          (MsgCaptionRegistryRead), $180000);
      Free;
    end;
  end;
end;

constructor TFrameRound.Create(AOwner: TComponent);
begin
  inherited;
  NxSpinItemUnitRound.FormatMask := '### ### ###.00' + ' ' + CurrencyString;
  NxSpinItemUnitRound.Value := CurrToStr(VRecordRound.UnitRound);
  NxSpinItemNiveauRound.FormatMask := '### ### ###.00' + ' ' + CurrencyString;
  NxSpinItemNiveauRound.Value := CurrToStr(VRecordRound.ValueNiveauRound);
end;

procedure TFrameRound.NextInspectorNiveauRoundChange
  (Sender: TObject; Item: TNxPropertyItem; Value: WideString);
begin
  if Item.Name = NxSpinItemUnitRound.Name then
  begin
    NxSpinItemNiveauRound.Value := CurrToStr
      (Round(StrFormatToCurr(NxSpinItemUnitRound.Value) / 2))
  end;
end;

procedure TFrameRound.NextInspectorNiveauRoundKeyPress
  (Sender: TObject; var Key: Char);
begin
  if (Key <> Chr(8)) And (Key <> '.') then
    Key := #0;
end;

end.
