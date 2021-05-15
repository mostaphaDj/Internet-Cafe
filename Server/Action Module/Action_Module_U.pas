unit Action_Module_U;

interface

uses
  Windows, SysUtils, Classes, ActnList, XPStyleActnCtrls, ActnMan, Controls,
  StdActns,
  ImgList, Forms, ExtCtrls;

type
  TAction_Module = class(TDataModule)
    ActionManager: TActionManager;
    UnLock: TAction;
    Change_Use: TAction;
    Restart: TAction;
    ShutDown: TAction;
    LockPayment: TAction;
    ImageList1: TImageList;
    ImageList2: TImageList;
    HidePostX: TAction;
    HidePostShotDown: TAction;
    procedure UnLockExecute(Sender: TObject);
    procedure ShutDownExecute(Sender: TObject);
    procedure RestartExecute(Sender: TObject);
    procedure LockPaymentExecute(Sender: TObject);
    procedure Change_UseExecute(Sender: TObject);
  private
    { DÈclarations privÈes }
  public
    { DÈclarations publiques }
  end;

procedure ActionEnabledTimeUnlimited;
procedure ActionEnabledTimelimited;
procedure ActionEnabledSuspend;
procedure ActionEnabledLock;

//procedure ActionDisabled;

var
  Action_Module: TAction_Module;

implementation

uses Form_ListView_Post_Client_U, Form_Payment_U,
  Form_Change_Use_U, ComCtrls,
  Type_U,
  Post_Client_Ser_U, Classes_U, Form_Limitation_Time_Ser_U,
  DataModuleBase_U;
{$R *.dfm}

procedure TAction_Module.UnLockExecute(Sender: TObject);
begin
  try
    Form_Limitation_Time := TForm_Limitation_Time.Create(Application);
    Form_Limitation_Time.Frame_Limitation_Time.Use_Account.PriceHour := TUser.GetPriceHour(Unknown);
    if Form_Limitation_Time.ShowModal = mrOk then
    begin
      TUser.Create(UnitObjets_Active);
      TUse.Create(UnitObjets_Active);
      UnitObjets_Active.Use.PriceHour :=
        Form_Limitation_Time.Frame_Limitation_Time.Use_Account.PriceHour;
      UnitObjets_Active.Use.CostVirtual :=
        Form_Limitation_Time.Frame_Limitation_Time.Use_Account.CostVirtual;
      if UnitObjets_Active.Use.CostVirtual <> 0 then
        if Form_Limitation_Time.Frame_Limitation_Time.CheckBox1.Checked then
          UnitObjets_Active.User.Computation :=
            UnitObjets_Active.User.Computation + StrFormatToCurr
            (Form_Limitation_Time.Frame_Limitation_Time.EditPayment.Text);
      UnitObjets_Active.Use.Start;
    end
    else
      FreeAndNil(Form_Limitation_Time.Frame_Limitation_Time.Use_Account.FRound);
    FreeAndNil(Form_Limitation_Time);
  except
  end;
end;

procedure TAction_Module.ShutDownExecute(Sender: TObject);
begin
  Try
    Try
      Form_ListView_Post_Client.ListView1.Cursor := crHourGlass;
      UnitObjets_Active.Post_Client.ShutDown;
      Form_ListView_Post_Client.ListView1.Cursor := crDefault;
    finally
      Form_ListView_Post_Client.ListView1.Cursor := crDefault;
    end;
  except
    Form_ListView_Post_Client.ListView1.Cursor := crDefault;
  end;
end;

procedure TAction_Module.RestartExecute(Sender: TObject);
begin
  Try
    Try
      Form_ListView_Post_Client.ListView1.Cursor := crHourGlass;
      UnitObjets_Active.Post_Client.Restart;
    finally
      Form_ListView_Post_Client.ListView1.Cursor := crDefault;
    end;
  except
    Form_ListView_Post_Client.ListView1.Cursor := crDefault;
  end;
end;

procedure TAction_Module.LockPaymentExecute(Sender: TObject);
begin
  Form_Payment := TForm_Payment.Create(Form_ListView_Post_Client,UnitObjets_Active);
  Form_Payment.Edit_Payment.Text:=CurrToStr(UnitObjets_Active.Use.Payment);
  Form_Payment.ShowModal;
  FreeAndNil(Form_Payment);
end;

procedure TAction_Module.Change_UseExecute(Sender: TObject);
begin
  Form_Change_Use := TForm_Change_Use.Create(Application);
  if Form_Change_Use.ShowModal = mrOk then
  begin
    Form_ListView_Post_Client.ListView1.Cursor := crHourGlass;
    if Assigned(Form_Change_Use.ListView1.Selected) then
      UnitObjets_Active.ChangeUserUseTo
        (Form_Change_Use.ListView1.Selected.Data);
    Form_ListView_Post_Client.ListView1.Cursor := crDefault;
  end;
  Form_Change_Use.Free;
end;

procedure ActionEnabledTimeUnlimited; // «Ìﬁ«› «·œÊ«· ⁄‰œ «·› Õ «·⁄«œÌ
begin
  Action_Module.UnLock.Enabled := False;
  Action_Module.LockPayment.Enabled := True;
  Action_Module.Change_Use.Enabled := True;
end;

procedure ActionEnabledTimelimited;
begin
  Action_Module.UnLock.Enabled := False;
  Action_Module.LockPayment.Enabled := True;
  Action_Module.Change_Use.Enabled := True;
end;

procedure ActionEnabledSuspend;
begin
  Action_Module.UnLock.Enabled := True;
  Action_Module.LockPayment.Enabled := False;
  Action_Module.Change_Use.Enabled := False;
end;

procedure ActionEnabledLock;
begin
  Action_Module.UnLock.Enabled := True;
  Action_Module.LockPayment.Enabled := False;
  Action_Module.Change_Use.Enabled := False;
end;

//procedure ActionDisabled;
//begin
//  Action_Module.ShutDown.Enabled := False;
//  Action_Module.Restart.Enabled := False;
//
//  Action_Module.UnLock.Enabled := False;
//  Action_Module.UnLockPartTime.Enabled := False;
//  Action_Module.LockPayment.Enabled := False;
//  Action_Module.LockCancel.Enabled := False;
//  Action_Module.Change_Use.Enabled := False;
//end;

end.
