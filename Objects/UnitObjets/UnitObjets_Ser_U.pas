unit UnitObjets_Ser_U;

interface

uses Windows, Forms, Classes, SysUtils, ComCtrls, IdContext,
  UnitObjets_Concerted_U, Connexion_Module_U, Post_Client_Concerted_U,
  Use_Concerted_U, User_Concerted_U, Type_U;

type
  TUnitObjets_Ser = class(TUnitObjets_Concerted)
  private
    FItem: TListItem;
  public
    constructor Create(VAContext: TIdContext;
      VRecordPost_Client: TRecordHostInfo); // override;
    Procedure ChangeUserUseTo(VUnitObjets: TUnitObjets_Ser);
    property Item: TListItem read FItem write FItem;
    procedure Change_ImageIndex; // TListItem   €ÌÌ— ’Ê—…
    destructor Destroy; override;
  end;

  TListUnitObjets = class(TList)
  private
  public
    function ChercherHostName(VHostName: string): Integer;
  end;

implementation

uses Form_ListView_Post_Client_U, DataModuleImages_U, Action_Module_U,
  Variants, DataModuleBase_U;

{ TUnitObjets }

procedure TUnitObjets_Ser.ChangeUserUseTo(VUnitObjets: TUnitObjets_Ser);
resourcestring
  MsgText = 'ÕœÀ Œÿ√ ⁄‰œ „Õ«Ê·… «·≈€·«ﬁ';
begin
  VUnitObjets.User := FUser;
  FUser := nil;
  VUnitObjets.Use := FUse;
  FUse := nil;
  VUnitObjets.Use.Resume;

  try
    with FConnexion,IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
      begin
        Write(Cmd_StopAndCancel);
        // Write(MinuteOfTheDay(Cost));
        FPost_Client.Lock;
        ActionEnabledLock;
        // TUnitObjets(FUnitObjets).User.Free;
      end
//      else
//        MessageBox(Application.Handle, PChar(MsgText1), PChar
//            (MsgCaptionError), MsgType);
    end;
  except
    on E: Exception do
    begin
      MessageBox(Application.Handle, PChar(MsgText + #13 + E.Message), PChar
          (MsgCaptionError), MsgType);
    end;
  end;

  with DataModuleBase do
  begin
    if Table_Use.Locate('HostName;TimeStart', VarArrayOf
        ([FPost_Client.HostName, VUnitObjets.Use.TimeStart]), []) then
    begin
      Table_Use.Edit;
      Table_UseHostName.Value := VUnitObjets.Post_Client.HostName;
      if Table_Post_Client.Locate('HostName', FPost_Client.HostName, []) then
      begin
        Table_Post_Client.Edit;
        Table_Post_ClientTimeStart.Value := 0;
        Table_Post_Client.Post;
      end;

      if Table_Post_Client.Locate('HostName', VUnitObjets.Post_Client.HostName,
        []) then
      begin
        Table_Post_Client.Edit;
        Table_Post_ClientTimeStart.Value := VUnitObjets.Use.TimeStart;
        Table_Post_Client.Post;
      end;

    end;

  end;

end;

procedure TUnitObjets_Ser.Change_ImageIndex; // TListItem   €ÌÌ— ’Ê—…
begin
  if Form_ListView_Post_Client <> nil then

    case FConnexion.StateConnect of
      scConnected:
        if FPost_Client.StateLock = slLock then
          FItem.ImageIndex := SLock
        else if FUse.StateTime = stTimeUnlimited then
          FItem.ImageIndex := SUnLock
        else
          FItem.ImageIndex := SUnLockPartTime;

      scDisconnect:
        if FPost_Client.StateLock = slLock then
          FItem.ImageIndex := SLockDesconnected
        else if FUse.StateTime = stTimeUnlimited then
          FItem.ImageIndex := SUnLockDesconnected
        else
          FItem.ImageIndex := SUnLockPartTimeDesconnected;

      scShuttingDown:
        if FPost_Client.StateLock = slLock then
          FItem.ImageIndex := SLockShutDown
        else if FUse.StateTime = stTimeUnlimited then
          FItem.ImageIndex := SUnLockShutDown
        else
          FItem.ImageIndex := SUnLockPartTimeShutDown;

      scRestarting:
        if FPost_Client.StateLock = slLock then
          FItem.ImageIndex := SLockRestart
        else if FUse.StateTime = stTimeUnlimited then
          FItem.ImageIndex := SUnLockPartTimeRestart;
    end;
end;

constructor TUnitObjets_Ser.Create(VAContext: TIdContext;
  VRecordPost_Client: TRecordHostInfo);
var
  i: Integer;
begin
  FItem := TListItem.Create(Form_ListView_Post_Client.ListView1.Items);
  for i := 2 to Form_ListView_Post_Client.ListView1.Columns.Count do
    FItem.SubItems.Add('Null');
  FItem.Data := Self;
  inherited Create(VAContext, VRecordPost_Client);
  Form_ListView_Post_Client.ListView1.Items.AddItem(FItem, 1);
  FItem.Caption := VRecordPost_Client.HostName + ' ';
  FItem.GroupID := 1;
end;

destructor TUnitObjets_Ser.Destroy;
begin

  inherited;
end;

function TListUnitObjets.ChercherHostName(VHostName: string): Integer;
var
  PostIndex: Integer;
begin
  Result := -1;
  for PostIndex := 0 to Count - 1 do
  begin
    if VHostName = TUnitObjets_Ser(Items[PostIndex]).Post_Client.HostName then
    begin
      Result := PostIndex;
    end;
  end;
end;

end.
