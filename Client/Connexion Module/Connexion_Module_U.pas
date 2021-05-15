unit Connexion_Module_U;

interface

uses
  SysUtils, Forms, Classes, IdTCPServer,
  IdAntiFreeze, IdStack,
  IdUDPClient, IdContext,
  IdUDPServer, IdSchedulerOfThread, IdGlobal, IdSocketHandle, IdUDPBase,
  IdAntiFreezeBase, IdBaseComponent, IdComponent, IdCustomTCPServer, ComCtrls;

type
  TConnexion_Module = class(TDataModule)
    IdTCPServer: TIdTCPServer;
    IdAntiFreeze: TIdAntiFreeze;
    IdUDPServer: TIdUDPServer;
    IdUDPClient: TIdUDPClient;
    procedure IdTCPServerExecute(AContext: TIdContext);
    procedure IdTCPServerDisconnect(AContext: TIdContext);
    procedure IdTCPServerConnect(AContext: TIdContext);
    procedure DataModuleCreate(Sender: TObject);
    procedure IdUDPServerUDPRead(AThread: TIdUDPListenerThread; AData: TBytes;
      ABinding: TIdSocketHandle);
  private
    { DÈclarations privÈes }
    procedure ActivePagePassword1;
    procedure ActivePagePassword2;
  public
    { DÈclarations publiques }
  end;

var
  Connexion_Module: TConnexion_Module;
  ServerList: TList; // ﬁ«∆„… «·”«—›Ê—«  «·„ ’·…
  ServerMaster: TObject; // «·”«—›Ê— «·—∆Ì”Ì «·„ Ê›— ⁄Ï ﬁ«⁄œ… »Ì«‰« 

implementation

uses Classes_U,
  Form_Welcoming_U, SearchConnections_U, Type_U, User_Concerted_U;
{$R *.dfm}

procedure TConnexion_Module.IdTCPServerExecute(AContext: TIdContext);
var
  Buf: TIdBytes;
  VRecordUser: TRecordUser;
  VRecordAutorisations: TRecordAutorisations;
begin
  if TIdYarnOfThread(AContext.Yarn)
    .Thread.Terminated or not AContext.Connection.Connected or Application.
    Terminated then
    Exit;
  with AContext.Connection.IOHandler, UnitObjets_Active do
    case ReadByte of
      // ______________________________________________________________________________
      Cmd_CreateUser:
        begin
          ReadBytes(Buf, sizeof(VRecordUser));
          BytesToRaw(Buf, VRecordUser, sizeof(VRecordUser));
          User := TUser.Create(UnitObjets_Active, Undefined);
          User.RecordUser := VRecordUser;
          if ReadLn = 'AsAdministrator' then
          begin
            ReadBytes(Buf, sizeof(VRecordAutorisations));
            BytesToRaw(Buf, VRecordAutorisations, sizeof(VRecordAutorisations));
            User.Autorisations := TAutorisations.Create;
            User.Autorisations.RecordAutorisations := VRecordAutorisations;
          end;
        end;
      // ______________________________________________________________________________
      Cmd_Start:
        begin
          Use := TUse.Create(UnitObjets_Active);
          Use.Start;
        end;
      // ______________________________________________________________________________
      Cmd_Resume:
        begin
          Use := TUse.Create(UnitObjets_Active);
          Use.Resume;
        end;
      // ______________________________________________________________________________
      Cmd_DemandUserefusal:
        begin
          if Form_Welcoming <> nil then
          begin
            Form_Welcoming.Frame_Demand_Use.LabelDemand.Caption := '—›Ÿ «·ÿ·»';
            Form_Welcoming.Frame_Register3.ProgressBar2.Style := pbstNormal;
          end;
        end;
      // ______________________________________________________________________________
      Cmd_RecordingOk:
        if Assigned(Form_Welcoming) then
        begin
          Form_Welcoming.Frame_Register3.LabelRecording.Caption :=
            ' „ «· ”ÃÌ· »‰Ã«Õ ≈‰ﬁ— ⁄·Ï «· «·Ì ··„ «»⁄…';
          Form_Welcoming.Frame_Register3.ProgressBar2.Style := pbstNormal;
          Form_Welcoming.Button_Next.Enabled := True;
        end;
      // ______________________________________________________________________________
      Cmd_RecordingCancel:
        if Assigned(Form_Welcoming) then
        begin
          Form_Welcoming.Frame_Register3.LabelRecording.Caption :=
            ' „ —›Ÿ «· ”ÃÌ·';
          Form_Welcoming.Frame_Register3.ProgressBar2.Style := pbstNormal;
        end;
      // ______________________________________________________________________________
      // *****************************************************************************
      Cmd_StopAndCancel:
        Use.StopAndCancel;
      // ______________________________________________________________________________
      Cmd_Lock:
        Use.StopAndCancel;
      // ______________________________________________________________________________
      Cmd_Terminate:
        TIdYarnOfThread(AContext.Yarn).Thread.Synchronize(Use.Terminate);
      // ______________________________________________________________________________
      Cmd_ChangeUseTo:
        // Post_Client.Change_Use_To
        ;
      // ______________________________________________________________________________
      Cmd_ChangeUseFor:
        // Post_Client.Change_Use_For
        ;
      // ______________________________________________________________________________
      Cmd_Restart:
        Post_Client.Restart;
      // ______________________________________________________________________________
      Cmd_ShutDown:
        Post_Client.ShutDown;
    end;
end;

procedure TConnexion_Module.IdUDPServerUDPRead(AThread: TIdUDPListenerThread;
  AData: TBytes; ABinding: TIdSocketHandle);
// var
// VRecordServerInfo: TRecordHostInfo;
// var
// SearchConnections:TSearchConnections;
// const
// Password_UDP_Valid='Password_UDP_Valid';
begin
  // BytesToRaw(AData,VRecordServerInfo,SizeOf(VRecordServerInfo));
  //
  // if VRecordServerInfo.Password_UDP = UnitObjets_Active.Post_Client.RecordPost_Client.Password_UDP then
  // begin
  // AData:=ToBytes(UnitObjets_Active.Post_Client.RecordPost_Client.HostName);
  // try
  // ABinding.SendTo(ABinding.PeerIP, ABinding.PeerPort, AData);
  // ---------------------------------------------
  // UnitObjets_Active.Connexion.IdUDPThread:=AThread;
  // UnitObjets_Active.Connexion.Connect(VRecordServerInfo.HostName);

  // SearchConnections:=TSearchConnections.Create(False,UnitObjets_Active);
  // -----------------------------------------------
  // finally
  // end;
  // end
  // else
  // begin
  // AData:=ToBytes(Password_UDP_Valid);
  // try
  // ABinding.SendTo(ABinding.PeerIP, ABinding.PeerPort, AData);
  // finally
  // end;
  // end;
end;

procedure TConnexion_Module.ActivePagePassword1;
begin
  if Assigned(Form_Welcoming) then
    Form_Welcoming.Notebook1.ActivePage := 'Page_Password';
end;

procedure TConnexion_Module.ActivePagePassword2;
begin
  if Assigned(Form_Welcoming) then
    Form_Welcoming.Notebook1.ActivePage := 'Page_Password2';
end;

procedure TConnexion_Module.IdTCPServerDisconnect(AContext: TIdContext);
var
  SearchConnections: TSearchConnections;
begin
  UnitObjets_Active.Connexion.IdTCPClient.Disconnect;
  if Application.Terminated then
    Exit;
  AContext.Data := nil; // Post_Client ·ﬂÌ ·« Ì „  Õ—Ì—
  SearchConnections := TSearchConnections.Create(False, UnitObjets_Active);
  TIdYarnOfThread(AContext.Yarn).Thread.Synchronize(ActivePagePassword2);
end;

procedure TConnexion_Module.DataModuleCreate(Sender: TObject);
var
  SearchConnections: TSearchConnections;
begin
  LocalHostInfo.HostName := GStack.HostName;
  LocalHostInfo.IPAddress := GStack.LocalAddress;
  LocalHostInfo.Password_UDP := 'Password_UDP';
  UnitObjets_Active := TUnitObjets.Create(nil, LocalHostInfo);
  UnitObjets_Active.Connexion.IdUDPClient := IdUDPClient;
  SearchConnections := TSearchConnections.Create(False, UnitObjets_Active);
end;

procedure TConnexion_Module.IdTCPServerConnect(AContext: TIdContext);
var
  // PostIndex: Integer;
  Buf: TIdBytes;
  ServerHostInfo: TRecordHostInfo;
begin
  if Application.Terminated then
    Exit;
  AContext.Connection.IOHandler.ReadBytes(Buf, sizeof(ServerHostInfo));
  // ·„ Ì‰ Â »⁄œ
  BytesToRaw(Buf, ServerHostInfo, sizeof(ServerHostInfo)); // ·„ Ì‰ Â »⁄œ
  if UnitObjets_Active.Connexion.AIdContext <> AContext then
  begin
    UnitObjets_Active.Connexion.AIdContext := AContext; // ·„ ·‰ ÂÌ »⁄œ
    AContext.Data := UnitObjets_Active;
  end; (AContext.Yarn as TIdYarnOfThread)
  .Thread.Synchronize(ActivePagePassword1);
  // PostIndex := UnitObjets_Active.ChercherPostName(AIdContext.Connection.IOHandler.Socket.LocalName);
  // if PostIndex = -1 then
  // begin
  // TPost_Client_Ser.Create(AThread);
  // end
  // else
  // begin
  // TPost_Client_Ser(Form_ListView_Post_Client.ListView1.Items.Item[PostIndex].Data).AThread := AThread;
  // TPost_Client_Ser(Form_ListView_Post_Client.ListView1.Items.Item[PostIndex].Data).StateConnect := scConnected;
  // AThread.Data := TObject(Form_ListView_Post_Client.ListView1.Items.Item[PostIndex].data);
  // end;
end;

end.
