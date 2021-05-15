unit Use_Ser_U;

interface

uses
  Windows, Forms,
  Use_Concerted_U, User_Concerted_U, Post_Client_Concerted_U, Type_U, ComCtrls;

type
  TUse_Ser = class(TUse_Concerted)
  private
    // procedure Change_Use_For;override;
    procedure SetStateTime(const Value: TStateTime); override;
  public
    constructor Create(VUnitObjects: TObject); override;
    procedure Start; override; // «‰ÿ·«ﬁ
    // procedure Suspend; override; // ÌÊﬁ› „ƒﬁ «
    procedure Resume; override; // Ì” √‰›
    procedure StopAndCancel; override; // ≈·€«¡ «·Ã·”…
    procedure Terminate; override; // Ì‰ÂÏ
    function LoadRecord(VPseudonyme, VHostName: string; VTimeStart: TDateTime)
      : Boolean;
    destructor Destroy; override; //  Õ—Ì— „⁄ «·Õ›÷
  end;

implementation

uses SysUtils, DateUtils, Variants,
  Action_Module_U, Classes_U, Round_U,
  Form_ListView_Post_Client_U, DataModuleBase_U;

{ TUse }

constructor TUse_Ser.Create(VUnitObjects: TObject); // CreateUnLock
begin
  inherited;
  if VRecordRound.UnitRound <> 0 then
  begin
    FRound := TRound.Create;
    FRound.UnitRound := VRecordRound.UnitRound; // ﬁÌ„… «· —ÃÌÕ
    FRound.ValueNiveauRound := VRecordRound.ValueNiveauRound; // ﬁÌ„… «ﬁ· Õ”«—…
  end;
end;

destructor TUse_Ser.Destroy;
begin
  inherited Destroy;
end;

function TUse_Ser.LoadRecord(VPseudonyme, VHostName: string;
  VTimeStart: TDateTime): Boolean;
begin
  Result := False;
  with DataModuleBase do
  begin
    try
      if Table_Use.Locate('HostName;TimeStart', VarArrayOf
          ([VHostName, VTimeStart]), []) then
      begin
        FPayment := Table_UseCostPayment.Value;
        SetTimeStart(Table_UseTimeStart.Value);
        SetTimeDesired(Table_UseTimeUse.Value);
      end;
    finally
      Result := True;
    end;
  end;
end;

procedure TUse_Ser.Resume;
resourcestring
  String_MessageUseStart = ' ⁄–— »œ√ «·Ã·”… Œÿ√ ›Ì «·« ’«·';
var
  VRecordUse: TRecordUse;
begin
  // inherited;
  // *********************** Client  Ê≈—”«·  ÕﬁÊ· «·Ã·”… «·ÃœÌœ… › Õ  **********************************
  TUser(TUnitObjets(FUnitObjets).User).CreateUser;
  try
    with TUnitObjets(UnitObjets).Connexion, IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
      begin
        Write(Cmd_Resume);
        VRecordUse := RecordUse;
        WriteBuffer(VRecordUse, SizeOf(VRecordUse));
        WriteBuffer(VRecordRound, SizeOf(VRecordRound));
        FPost_Client.UnLock;
        ActionEnabledTimeUnlimited;
      end
      else
        MessageBox(Application.Handle, PChar(MsgNotConnected), PChar
            (MsgCaptionError), MsgType);
    end;
  except
    on E: Exception do
    begin
      MessageBox(Application.Handle, PChar
          (String_MessageUseStart + #13 + E.Message), PChar(MsgCaptionError),
        MsgType);
    end;
  end;
end;

procedure TUse_Ser.SetStateTime(const Value: TStateTime);
begin
  inherited;
  TUnitObjets(UnitObjets).Change_ImageIndex;
end;

procedure TUse_Ser.Start;
resourcestring
  String_MessageUseStart = ' ⁄–— »œ√ «·Ã·”… Œÿ√ ›Ì «·« ’«·';
var
  VRecordUse: TRecordUse;
begin
  inherited;

  with DataModuleBase do // · Œ“Ì‰ «·Ã·”… «·ÃœÌœ… ›Ì ﬁ«⁄œ…«·»Ì«‰« 
  begin
    Table_Use.Insert;
    Table_UsepseudonymeUser.Value := FUser.pseudonyme;
    Table_UseHostName.Value := FPost_Client.HostName;
    FTimeStart := RecodeMilliSecond(Now, 0);
    TimeStart := RecodeSecond(FTimeStart, 0);
    DataModuleBase.Table_UseTimeStart.Value := FTimeStart;
    Table_UseTimeUse.Value := FTimeDesired;
    Table_Use.Post;
    if Table_Post_Client.Locate('HostName', FPost_Client.HostName, []) then
    begin
      Table_Post_Client.Edit;
      Table_Post_ClientTimeStart.Value := FTimeStart;
      Table_Post_Client.Post;
    end;
  end;

  // *********************** Client  Ê≈—”«·  ÕﬁÊ· «·Ã·”… «·ÃœÌœ… › Õ  **********************************
  TUser(TUnitObjets(FUnitObjets).User).CreateUser;

  try
    with TUnitObjets(UnitObjets).Connexion, IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
      begin
        Write(Cmd_Start);
        VRecordUse := RecordUse;
        WriteBuffer(VRecordUse, SizeOf(VRecordUse));
        WriteBuffer(VRecordRound, SizeOf(VRecordRound));
      end
      else
        MessageBox(Application.Handle, PChar(MsgNotConnected), PChar
            (MsgCaptionError), MsgType);
    end;
  except
    on E: Exception do
    begin
      MessageBox(Application.Handle, PChar
          (String_MessageUseStart + #13 + E.Message), PChar(MsgCaptionError),
        MsgType);
    end;
  end;

  with TUnitObjets(FUnitObjets).Item.SubItems do
  begin
    if User.pseudonyme <> Unknown then
      Strings[0] := User.pseudonyme + '|' + User.Name + '|' + User.Prename;

    Strings[1] := TimeToStr(TimeStart);
    if StateTime = stTimelimited then
    begin
      Strings[2] := FormatDateTime('HH:mm',TimeDesired);
      Strings[4] := FormatDateTime('HH:mm',TimeDesired - TimeUse); { «·Êﬁ  «·„ »ﬁÌ }
      Strings[5] := FormatDateTime('HH:mm',TimeFin);
      Strings[7] := CurrToStr(CostVirtual);
    end;
    Strings[3] := FormatDateTime('HH:mm',TimeUse);
    Strings[6] := CurrToStr(Cost);
    Strings[8] := CurrToStr(PriceHour);
    Strings[9] := CurrToStr(User.Computation);
  end;

  FPost_Client.UnLock;
  ActionEnabledTimeUnlimited;
end;

procedure TUse_Ser.StopAndCancel;
resourcestring
  MsgText = 'ÕœÀ Œÿ√ ⁄‰œ „Õ«Ê·… «·≈€·«ﬁ';
var
  I: Integer;
begin
  // inherited;
  with DataModuleBase do
  begin
    if Table_Use.Locate('HostName;TimeStart', VarArrayOf
        ([FPost_Client.HostName, FTimeStart]), []) then
      Table_Use.Delete;
    if Table_Post_Client.Locate('HostName', FPost_Client.HostName, []) then
    begin
      Table_Post_Client.Edit;
      Table_Post_ClientTimeStart.Value := 0;
      Table_Post_Client.Post;
    end;
  end;
  // *****************************************************************************

  try
    with TUnitObjets(UnitObjets).Connexion, IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
      begin
        Write(Cmd_StopAndCancel);
        // Write(MinuteOfTheDay(Cost));
        // TUnitObjets(FUnitObjets).User.Free;
      end
      else
        MessageBox(Application.Handle, PChar(MsgNotConnected), PChar
            (MsgCaptionError), MsgType);
    end;
  except
    on E: Exception do
    begin
      MessageBox(Application.Handle, PChar(MsgText + #13 + E.Message), PChar
          (MsgCaptionError), MsgType);
    end;
  end;
  TUnitObjets(UnitObjets).User.Free;
  TUnitObjets(UnitObjets).User := nil;
  TUnitObjets(UnitObjets).Use := nil;
  Self.Free;
  FPost_Client.Lock;
  for I := 0 to TUnitObjets(FUnitObjets).Item.SubItems.Count - 1 do
    TUnitObjets(FUnitObjets).Item.SubItems[I] := '';
  ActionEnabledLock;
end;

// procedure TUse_Ser.Suspend;
// begin
// // inherited;
//
// end;

procedure TUse_Ser.Terminate;
resourcestring
  MsgText = 'ÕœÀ Œÿ√ ⁄‰œ „Õ«Ê·… «·≈€·«ﬁ';
var
  CostVirtualPrior: Currency;
  Item: TListItem;
  I: Integer;
begin
  inherited;

  with DataModuleBase do
  begin
    if Table_Use.Locate('HostName;TimeStart', VarArrayOf
        ([FPost_Client.HostName, FTimeStart]), []) then
    begin
      Table_Use.Edit;
      Table_UseTimeUse.Value := TimeUse;
      Table_UseCostPayment.Value := Payment;
      Table_UsepseudonymeUser.Value := User.pseudonyme;
      Table_Use.Post;
    end;

    if Table_User.Locate('pseudonyme', TUnitObjets(FUnitObjets)
        .User.pseudonyme, []) then
    begin
      Table_User.Edit;
      Table_UserComputation.Value := TUnitObjets(FUnitObjets).User.Computation;
      Table_User.Post;
    end;

    if Table_Post_Client.Locate('HostName', FPost_Client.HostName, []) then
    begin
      Table_Post_Client.Edit;
      Table_Post_ClientTimeStart.Value := 0;
      Table_Post_Client.Post;
    end;
  end;

  FPost_Client.Lock;
  for I := 0 to TUnitObjets(FUnitObjets).Item.SubItems.Count - 1 do
    TUnitObjets(FUnitObjets).Item.SubItems[I] := '';

  ActionEnabledLock;

  // ******************************************************************************
  try
    with TUnitObjets(UnitObjets).Connexion, IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
      begin
        Write(Cmd_Terminate);
        // Write(MinuteOfTheDay(Cost));
      end
      else
        MessageBox(Application.Handle, PChar(MsgNotConnected), PChar
            (MsgCaptionError), MsgType);
    end;
  except
    on E: Exception do
    begin
      MessageBox(Application.Handle, PChar(MsgText + #13 + E.Message), PChar
          (MsgCaptionError), MsgType);
    end;
  end;

  if (FCost = 0) or (FCost = Payment) then
  begin
    TUnitObjets(UnitObjets).User.Free;
    TUnitObjets(UnitObjets).User := nil;
    TUnitObjets(FUnitObjets).Use := nil;
    Self.Free;
  end
  else if (FCost > Payment) then
  begin
    with TUnitObjets(UnitObjets) do
    begin
      Item := TListItem.Create(Form_ListView_Post_Client.ListView1.Items);
      Item.Data := UnitObjets;
      Item.ImageIndex := 21;
      Form_ListView_Post_Client.ListView1.Items.AddItem(Item, 21);
      Item.Caption := User.pseudonyme + '->' + Post_Client.HostName;
      Item.GroupID := 0;
    end
  end
  else if (FCost < Payment) then
    with TUnitObjets(UnitObjets) do
    begin
      Item := TListItem.Create(Form_ListView_Post_Client.ListView1.Items);
      Item.Data := UnitObjets;
      Item.ImageIndex := 22;
      Form_ListView_Post_Client.ListView1.Items.AddItem(Item, 22);
      Item.Caption := User.pseudonyme + '->' + Post_Client.HostName;
      Item.GroupID := 0;
    end;
end;

end.

// if FCost > Payment then
// begin
// if Table_User.Locate('pseudonyme', FUser.pseudonyme, []) then
// begin
// Table_User.Edit;
// Table_UserComputation.Value := Table_UserComputation.Value +
// (Payment-FCost);
// Table_User.Post;
// end;
// end
