unit Form_ListView_Post_Client_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, ExtCtrls, ComCtrls, ImgList, IdBaseComponent,
  IdComponent, IdTCPServer, Menus, StdCtrls, IdAntiFreezeBase, IdAntiFreeze,
  ToolWin, ActnMan, ActnCtrls, PlatformDefaultStyleActnCtrls, ActnPopup;

type
  TForm_ListView_Post_Client = class(TForm)
    ListView1: TListView;
    TimerPayment: TTimer;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    StatusBar1: TStatusBar;
    PopupActionBarPost: TPopupActionBar;
    PopupActionBarUser: TPopupActionBar;
    PopupActionBarListViewShowPost: TPopupActionBar;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    UnLockPartTime1: TMenuItem;
    LockPayment1: TMenuItem;
    Control1: TMenuItem;
    System1: TMenuItem;
    Restart2: TMenuItem;
    ShutDown2: TMenuItem;
    View: TMenuItem;
    Report: TMenuItem;
    btnList: TMenuItem;
    SmallIcon: TMenuItem;
    Icon: TMenuItem;
    N11: TMenuItem;
    ArrangeIconsby: TMenuItem;
    Refresh: TMenuItem;
    N12: TMenuItem;
    HidePost: TMenuItem;
    HidePostShotDown: TMenuItem;
    HidePostX: TMenuItem;
    HidePostX1: TMenuItem;
    ChongePC1: TMenuItem;
    procedure ListView1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListView1DblClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListView1Resize(Sender: TObject);
    procedure TimerPaymentTimer(Sender: TObject);
    procedure PopupMenuListViewShowPostPopup(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
  private
    { DÈclarations privÈes }
    procedure ItemArrangeOnClick(Sender: TObject);
  public
    { DÈclarations publiques }
    procedure LeadAllPostsForDataBase;
  end;

var
  Form_ListView_Post_Client: TForm_ListView_Post_Client;

implementation

{$R *.dfm}

uses IdTCPConnection, Connexion_Module_U,
  Action_Module_U, Form_Main_U, Type_U, DataModuleImages_U,
  User_Concerted_U, Classes_U, DateUtils,
  UnitObjets_Ser_U, DataModuleBase_U;

procedure TForm_ListView_Post_Client.LeadAllPostsForDataBase;
var
  HostInfo: TRecordHostInfo;
  VUnitObjets: TUnitObjets;
begin

  with DataModuleBase do
  begin
    Table_Post_Client.First;
    ListUnitObjets := TListUnitObjets.Create;
    Table_Post_Client.Last;
    while not Table_Post_Client.Eof do
    begin
      HostInfo.HostName := Table_Post_ClientHostName.Value;
      VUnitObjets := TUnitObjets.Create(nil, HostInfo);
      TUnitObjets(VUnitObjets).Connexion.StateConnect := scDisconnect;
      ListUnitObjets.Add(VUnitObjets);
      with VUnitObjets do
      begin
        if Table_Post_ClientTimeStart.Value <> 0 then
        // «–« ﬂ«‰   ÊÃœ Ã·”… ⁄·Ï «·Õ«”Ê»
        begin
          Use := TUse.Create(VUnitObjets);
          TUse(Use).LoadRecord('„‰ »⁄«⁄œ', HostInfo.HostName,
            Table_Post_ClientTimeStart.Value);
          VUnitObjets.User := TUser.Create
            (VUnitObjets, Table_UsepseudonymeUser.Value);

          if Table_UseTimeUse.Value = 0 then // «–« ﬂ«‰ “„‰ «·Ã·”… €Ì— „Õœœ
          begin
            Use.StateTime := stTimeUnlimited;
            Post_Client.StateLock := slUnLock;
            Use.User := VUnitObjets.User;
          end
          else // «–« ﬂ«‰ “„‰ «·Ã·”… „Õœœ
          begin
            if CompareDateTime(Use.TimeFin, Now) = 1 then
            begin
              Post_Client.UnLock;
              Use.StateTime := stTimelimited;
            end
            else // «–« «‰ ÂÏ Êﬁ   «·Ã·”…
              Use.Terminate;
          end;
        end;
      end;
      Table_Post_Client.Next;
    end;
  end;
end;

procedure TForm_ListView_Post_Client.ListView1ColumnClick
  (Sender: TObject; Column: TListColumn);
begin
  //
end;

procedure TForm_ListView_Post_Client.ListView1ContextPopup
  (Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
  if ListView1.Selected <> nil then
  begin
    if ListView1.Selected.GroupID = 1 then
    begin
      ListView1.PopupMenu := PopupActionBarPost;
    end
    else if ListView1.Selected.GroupID = 0 then
    begin
      ListView1.PopupMenu := PopupActionBarUser;
    end;
  end
  else
  begin
    ListView1.PopupMenu := PopupActionBarListViewShowPost;
  end;
end;

procedure TForm_ListView_Post_Client.FormClose
  (Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Self);
end;

procedure TForm_ListView_Post_Client.ListView1DblClick(Sender: TObject);
begin
  if ListView1.Selected <> nil then
  begin
    if TUnitObjets(ListView1.Selected.Data).Post_Client.StateLock = slLock then
      Action_Module.UnLockExecute(Sender)
    else
      Action_Module.LockPaymentExecute(Sender);
  end;
end;

procedure TForm_ListView_Post_Client.ListView1SelectItem
  (Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  if Selected then
  begin
    UnitObjets_Active := TUnitObjets(ListView1.Selected.Data);
    // if (UnitObjets_Active.Connexion.StateConnect >= scDisconnect) or
    // (UnitObjets_Active.Connexion.StateConnect >= scShutDown) or
    // (UnitObjets_Active.Connexion.StateConnect >= scReturn) then
    // ActionDisabled
    // else
    // begin
    if UnitObjets_Active.Use = nil then
    begin
      ActionEnabledLock;
    end
    else
    begin
      case UnitObjets_Active.Use.StateTime of
        stTimeUnlimited:
          ActionEnabledTimeUnlimited;
        stTimelimited:
          ActionEnabledTimelimited;
      end;
    end;
    // end;
  end
  else
  begin
    if Action_Module <> nil then
    begin
      Action_Module.UnLock.Enabled := False;
      Action_Module.LockPayment.Enabled := False;
      Action_Module.Change_Use.Enabled := False;
      Action_Module.Restart.Enabled := False;
      Action_Module.ShutDown.Enabled := False;
    end;
    UnitObjets_Active := nil;
  end;
end;

procedure TForm_ListView_Post_Client.ItemArrangeOnClick(Sender: TObject);
begin
  ListView1ColumnClick(Sender, ListView1.Columns[TMenuItem(Sender).Tag]);
end;

procedure TForm_ListView_Post_Client.PopupMenuListViewShowPostPopup
  (Sender: TObject);
var
  I: Integer;
  Item: TMenuItem;
begin
  ArrangeIconsby.Clear;
  for I := 0 To ListView1.Columns.Count - 1 do
  begin
    Item := TMenuItem.Create(ArrangeIconsby);
    Item.Caption := ListView1.Columns[I].Caption;
    Item.Tag := I;
    Item.OnClick := ItemArrangeOnClick;
    ArrangeIconsby.Add(Item);
  end;
end;

procedure TForm_ListView_Post_Client.ListView1Resize(Sender: TObject);
begin
  ListView1.Refresh;
end;

procedure TForm_ListView_Post_Client.TimerPaymentTimer(Sender: TObject);
var
  PostIndex: Integer;
begin
  with ListView1.Items do
  begin
    for PostIndex := 0 to Count - 1 do
    begin
      if Assigned(ListView1.Items.Item[PostIndex].Data) then
        if TUnitObjets(ListView1.Items.Item[PostIndex].Data)
          .Post_Client.StateLock = slUnLock then
        begin
          with TUnitObjets(Item[PostIndex].Data),
            ListView1.Items.Item[PostIndex].SubItems do
          begin
            if Assigned(Use) then
              if not Use.Terminated then
                if Use.StateTime = stTimelimited then
                begin
                  Strings[2] := FormatDateTime('HH:mm',Use.TimeDesired);
                  Strings[3] := FormatDateTime('HH:mm',Use.TimeUse);
                  { «·Êﬁ  «·„ »ﬁÌ }
                  Strings[4] := FormatDateTime('HH:mm',Use.TimeDesired - Use.TimeUse);
                  Strings[6] := CurrToStr(Use.Cost);
                end
                else if Use.StateTime = stTimeUnlimited then
                begin
                  Strings[3] := FormatDateTime('HH:mm',Use.TimeUse);
                  { «·Êﬁ  «·„ »ﬁÌ }
                  Strings[6] := CurrToStr(Use.Cost);
                end;

          end;
        end
    end;
  end;

end;

end.
