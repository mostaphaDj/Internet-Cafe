unit Use_Cli_U;

interface

uses Windows, Forms, SysUtils, IdGlobal,
  Use_Concerted_U, Post_Client_Concerted_U, User_Concerted_U, User_Cli_U,
  Post_Client_Cli_U;

type
  TUse_Cli = class(TUse_Concerted)
  private
  public
    procedure Start; override; // «‰ÿ·«ﬁ
  //  procedure Suspend; override; // ÌÊﬁ› „ƒﬁ «
    procedure Resume; override; // Ì” √‰›
    procedure StopAndCancel; override; // ≈·€«¡ «·Ã·”…
    procedure Terminate; override; // Ì‰ÂÏ
  end;

implementation

uses Form_Lock_U, Type_U,
  Classes_U, Connexion_Concerted_U, Round_U, IdSchedulerOfThread;

{ TUse_Cli }

procedure TUse_Cli.Resume;
resourcestring
  String_MessageUseCreate = ' ⁄–— »œ√ «·Ã·”… Œÿ√ ›Ì «·« ’«·';
var
  VRecordUse: TRecordUse;
  VRecordRound: TRecordRound;
begin
  // inherited;
  with TUnitObjets(UnitObjets).Connexion.AIdContext.Connection.IOHandler do
  begin
    try
      TUnitObjets(UnitObjets).Connexion.ReadBuffer
        (VRecordUse, SizeOf(VRecordUse));
      RecordUse := VRecordUse;
      TUnitObjets(UnitObjets).Connexion.ReadBuffer
        (VRecordRound, SizeOf(VRecordRound));
      if (VRecordRound.UnitRound <> 0) and (VRecordRound.ValueNiveauRound <> 0)
        then
      begin
        FRound := TRound.Create;
        FRound.UnitRound := VRecordRound.UnitRound; // ﬁÌ„… «· —ÃÌÕ
        FRound.ValueNiveauRound := VRecordRound.ValueNiveauRound;
        // ﬁÌ„… «ﬁ· Õ”«—…
      end; (TUnitObjets(FUnitObjets)
          .Connexion.AIdContext.Yarn as TIdYarnOfThread)
      .Thread.Synchronize(FPost_Client.UnLock);

    except
      on E: Exception do
      begin
        MessageBox(Application.Handle, PChar
            (String_MessageUseCreate + #13 + E.Message), PChar(MsgCaptionError)
            , $180000);
      end; // on E: do
    end; // try
  end;
end;

procedure TUse_Cli.Start;
resourcestring
  String_MessageUseCreate = ' ⁄–— »œ√ «·Ã·”… Œÿ√ ›Ì «·« ’«·';
var
  VRecordUse: TRecordUse;
  VRecordRound: TRecordRound;
begin
  inherited Start;
  with TUnitObjets(UnitObjets).Connexion.AIdContext.Connection.IOHandler do
  begin
    try
      TUnitObjets(UnitObjets).Connexion.ReadBuffer
        (VRecordUse, SizeOf(VRecordUse));
      RecordUse := VRecordUse;
      TUnitObjets(UnitObjets).Connexion.ReadBuffer
        (VRecordRound, SizeOf(VRecordRound));
      if (VRecordRound.UnitRound <> 0) and (VRecordRound.ValueNiveauRound <> 0)
        then
      begin
        FRound := TRound.Create;
        FRound.UnitRound := VRecordRound.UnitRound; // ﬁÌ„… «· —ÃÌÕ
        FRound.ValueNiveauRound := VRecordRound.ValueNiveauRound;
        // ﬁÌ„… «ﬁ· Õ”«—…
      end; (TUnitObjets(FUnitObjets)
          .Connexion.AIdContext.Yarn as TIdYarnOfThread)
      .Thread.Synchronize(FPost_Client.UnLock);

    except
      on E: Exception do
      begin
        MessageBox(Application.Handle, PChar
            (String_MessageUseCreate + #13 + E.Message), PChar(MsgCaptionError)
            , $180000);
      end; // on E: do
    end; // try
  end;
end;

procedure TUse_Cli.StopAndCancel;
resourcestring
  MsgText = 'Œÿ√ ⁄‰œ „Õ«Ê·… «·≈€·«ﬁ';
begin
  // inherited;
  // Cost := UnitObjets_Active.Connexion.AIdContext.Connection.IOHandler.ReadLongInt;
  if Form_Lock = nil then
  begin
    try (TUnitObjets(FUnitObjets).Connexion.AIdContext.Yarn as TIdYarnOfThread)
      .Thread.Synchronize(FPost_Client.Lock);
      TUnitObjets(FUnitObjets).User.Free;
      TUnitObjets(FUnitObjets).User := nil;
      TUnitObjets(FUnitObjets).Use := nil;
      Self.Free;
    except
      on E: Exception do
      begin
        MessageBox(Application.Handle, PChar(MsgText + #13 + E.Message), PChar
            (MsgCaptionError), MB_OK + MsgType)
      end;
    end;
  end;
end;

//procedure TUse_Cli.Suspend;
//begin
//  // inherited;
//
//end;

procedure TUse_Cli.Terminate;
resourcestring
  MsgText = 'Œÿ√ ⁄‰œ „Õ«Ê·… «·≈€·«ﬁ';
begin
  inherited;
  // Cost := UnitObjets_Active.Connexion.AIdContext.Connection.IOHandler.ReadLongInt;
  try
    FPost_Client.Lock;
    TUnitObjets(FUnitObjets).Use := nil;
    FreeAndNil(Self);
  except
    on E: Exception do
    begin
      MessageBox(Application.Handle, PChar(MsgText + #13 + E.Message), PChar
          (MsgCaptionError), MB_OK + MsgType)
    end;
  end;
end;

end.
