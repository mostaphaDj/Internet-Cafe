unit Frame_Cost_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  Type_U, Grids, ValEdit, Buttons, NxPropertyItemClasses, NxPropertyItems,
  NxScrollControl, NxInspector;

type
  TFrame_Cost = class(TFrame)
    Timer1: TTimer;
    NextInspector1: TNextInspector;
    NxToolbarItemUse: TNxToolbarItem;
    NxTextItemTimeStart: TNxTextItem;
    NxTextItemTimeNow: TNxTextItem;
    NxTextItemTimeUse: TNxTextItem;
    NxToolbarItemUser: TNxToolbarItem;
    NxTextItemHostName: TNxTextItem;
    NxTextItemPseudonyme: TNxTextItem;
    NxTextItemFirstName: TNxTextItem;
    NxTextItemLastName: TNxTextItem;
    NxSpinItemPriceHour: TNxSpinItem;
    NxSpinItemComputation: TNxSpinItem;
    NxSpinItemCostTotal: TNxSpinItem;
    NxSpinItemCostVirtual: TNxSpinItem;
    NxButtonItemTimeDesired: TNxButtonItem;
    NxButtonItemTimeFin: TNxButtonItem;
    SpeedButton1: TSpeedButton;
    procedure Timer1Timer(Sender: TObject);
    procedure Panel11MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel11MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ValueListEditor1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    Procedure Start;
    Procedure Stop;
  end;

implementation

uses Classes_U, Char_U;
{$R *.dfm}

procedure TFrame_Cost.SpeedButton1Click(Sender: TObject);
var
  i: Integer;
begin
  if SpeedButton1.Down then
  begin
    NextInspector1.Height := 2;
    i := 0;
    while i < NextInspector1.Items.Count do
    begin
      if NextInspector1.Items[i].Visible then
      begin
        NextInspector1.Height := NextInspector1.Height +
          NextInspector1.RowHeight + 1;
      end
      else
      begin
        if NextInspector1.Items[i].Name = 'NxToolbarItemUser' then
          Inc(i, 5);
      end;
      Inc(i);
    end;

  end;
  NextInspector1.Visible := SpeedButton1.Down;
end;

procedure TFrame_Cost.Start;
begin
  inherited;
  NxTextItemHostName.Value := UnitObjets_Active.Post_Client.HostName;
  if UnitObjets_Active.User.Pseudonyme <> Unknown then
  begin
    NxToolbarItemUser.Visible := True;
    NxTextItemPseudonyme.Value := UnitObjets_Active.User.pseudonyme;
    NxTextItemFirstName.Value := UnitObjets_Active.User.Prename;
    NxTextItemLastName.Value := UnitObjets_Active.User.Name;
    NxSpinItemPriceHour.Value := CurrToStr(UnitObjets_Active.Use.PriceHour);
    NxSpinItemComputation.Value := CurrToStr
      (UnitObjets_Active.User.Computation);
  end
  else
    NxToolbarItemUser.Visible := False;

  if UnitObjets_Active.User.Computation < 0 then
  begin
    NxSpinItemCostTotal.Visible := True;
    NxSpinItemCostTotal.Value := CurrToStr
      (UnitObjets_Active.Use.Cost - UnitObjets_Active.User.Computation);
  end
  else
    NxSpinItemCostTotal.Visible := False;

  NxTextItemTimeStart.Value := FormatDateTime
    ('HH:mm', UnitObjets_Active.Use.TimeStart);
  NxTextItemTimeNow.Value := FormatDateTime('HH:mm', Now);
  if UnitObjets_Active.Use.StateTime = stTimeUnlimited then
  begin
    NxButtonItemTimeDesired.Visible := False;
    NxButtonItemTimeFin.Visible := False;
    NxSpinItemCostVirtual.Visible := False;
    // NxButtonItemTimeDesired.Value := '√‰ﬁ— Â‰« ·· ÕœÌœ';
    // NxButtonItemTimeFinVirtual.Value := '√‰ﬁ— Â‰« ·· ÕœÌœ';
    // NxSpinItemCostVirtual.Value := '√‰ﬁ— Â‰« ·· ÕœÌœ';
    NxSpinItemCostVirtual.Visible := False;
    SpeedButton1.Caption := '„»·€ «·Ã·”…' + ' : ' + CurrToStrFormat
      (UnitObjets_Active.Use.Cost);
  end
  else
  begin
    NxButtonItemTimeDesired.Visible := True;
    NxButtonItemTimeFin.Visible := True;
    NxSpinItemCostVirtual.Visible := True;
    NxButtonItemTimeDesired.Value := FormatDateTime
      ('HH:mm', UnitObjets_Active.Use.TimeDesired);
    NxButtonItemTimeFin.Value := FormatDateTime
      ('HH:mm', UnitObjets_Active.Use.TimeFin);
    NxSpinItemCostVirtual.Visible := True;
    NxSpinItemCostVirtual.Value := CurrToStr(UnitObjets_Active.Use.CostVirtual);
    SpeedButton1.Caption := ' «·„Êﬁ  «·„ »ﬁÌ' + FormatDateTime
      ('HH:mm', UnitObjets_Active.Use.TimeDesired -
        UnitObjets_Active.Use.TimeUse);
  end;

  // ******************************************************************************
  SpeedButton1.Down:=False;
  NextInspector1.Visible:=False;
  Timer1Timer(nil);
  Timer1.Enabled := True;
end;

procedure TFrame_Cost.Stop;
begin
  Timer1.Enabled := False;
end;

constructor TFrame_Cost.Create(AOwner: TComponent);
begin
  inherited;
  NextInspector1.Visible := False;
  NxSpinItemPriceHour.FormatMask := '### ### ###.00' + ' ' + CurrencyString;
  NxSpinItemComputation.FormatMask := '### ### ###.00' + ' ' + CurrencyString;
  NxSpinItemCostVirtual.FormatMask := '### ### ###.00' + ' ' + CurrencyString;
  NxSpinItemCostTotal.FormatMask := '### ### ###.00' + ' ' + CurrencyString;
end;

procedure TFrame_Cost.Panel11MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TPanel(Sender).BevelInner := bvLowered;
  TPanel(Sender).BevelOuter := bvLowered;
end;

procedure TFrame_Cost.Panel11MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  TPanel(Sender).BevelInner := bvRaised;
  TPanel(Sender).BevelOuter := bvRaised;
end;

procedure TFrame_Cost.Timer1Timer(Sender: TObject);
begin
  NxTextItemTimeNow.Value := FormatDateTime('HH:mm', Now);
  NxTextItemTimeUse.Value := FormatDateTime
    ('HH:mm', UnitObjets_Active.Use.TimeUse);
  if UnitObjets_Active.Use.StateTime = stTimeUnlimited then
  begin
    if UnitObjets_Active.User.Computation < 0 then
      NxSpinItemCostTotal.Value := CurrToStr
        (UnitObjets_Active.Use.Cost - UnitObjets_Active.User.Computation)
    else
      NxSpinItemComputation.Value := CurrToStr
        (UnitObjets_Active.User.Computation - UnitObjets_Active.Use.Cost);

    SpeedButton1.Caption := '„»·€ «·Ã·”…' + ' : ' + CurrToStrFormat
      (UnitObjets_Active.Use.Cost);
  end
  else
  begin
    if UnitObjets_Active.User.Computation > 0 then
      NxSpinItemComputation.Value := CurrToStr
        (UnitObjets_Active.User.Computation -
          UnitObjets_Active.Use.CostVirtual);
    SpeedButton1.Caption := ' «·„Êﬁ  «·„ »ﬁÌ' + FormatDateTime
      ('HH:mm', UnitObjets_Active.Use.TimeDesired -
        UnitObjets_Active.Use.TimeUse);
  end;
  // if (UnitObjets_Active.User.Computation - UnitObjets_Active.Use.Cost) > 0 then
  // begin
  // SpeedButton1.Caption := '»ﬁÌ ›Ì —’Ìœﬂ' + ' : ' + CurrToStrFormat
  // (UnitObjets_Active.User.Computation - UnitObjets_Active.Use.Cost,
  // { ffCurrency } ffNumber, CurrencyDecimals) + ' ' + CurrencyString;
  // end
  // else
  // begin
  // SpeedButton1.Caption := '«·„»·€ «·≈Ã„«·Ì' + ' : ' + CurrToStrFormat
  // (UnitObjets_Active.Use.Cost - UnitObjets_Active.User.Computation,
  // { ffCurrency } ffNumber, CurrencyDecimals) + ' ' + CurrencyString;
  // end;
end;

procedure TFrame_Cost.ValueListEditor1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key <> Chr(8)) And (Key <> '.') then
    Key := #0;
end;

end.
