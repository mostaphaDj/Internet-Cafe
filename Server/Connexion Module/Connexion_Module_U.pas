unit Connexion_Module_U;

interface

uses
  Windows, Forms, SysUtils, Classes, IdBaseComponent, IdComponent, IdContext,
  IdAntiFreezeBase, IdAntiFreeze, ComCtrls, IdUDPBase, IdUDPServer,
  IdSocketHandle,
  IdUDPClient, IdCustomTCPServer, IdTCPServer, IdSchedulerOfThread, IdGlobal,
  IdStack,
  Dialogs, Type_U;

type
  TConnexion_Module = class(TDataModule)
    IdTCPServer: TIdTCPServer;
    IdAntiFreeze: TIdAntiFreeze;
    IdUDPServer: TIdUDPServer;
    IdUDPClient: TIdUDPClient;
    procedure IdTCPServerConnect(AContext: TIdContext);
    procedure IdTCPServerDisconnect(AContext: TIdContext);
    procedure IdTCPServerExecute(AContext: TIdContext);
    procedure DataModuleCreate(Sender: TObject);
    procedure IdUDPServerUDPRead(AThread: TIdUDPListenerThread; AData: TBytes;
      ABinding: TIdSocketHandle);
  private
    { Déclarations privées }

  public
    { Déclarations publiques }
    FRecordUser: TRecordUser;
    FConnexion: TObject;
    procedure ShowFormDemandRegister;
  end;

var
  Connexion_Module: TConnexion_Module;

implementation

uses Form_ListView_Post_Client_U, Action_Module_U,
  IdTCPConnection, User_Concerted_U, Use_Ser_U,
  Classes_U, Controls, DataModuleBase_U, FormDemandRegister_U;
{$R *.dfm}

procedure TConnexion_Module.IdTCPServerConnect(AContext: TIdContext);
var
  PostIndex: Integer;
  ClientHostInfo: TRecordHostInfo;
  VRecordUser: TRecordUser;
  VRecordUse: TRecordUse;
  BytesClientHostInfo, BytesRecordUser, BytesRecordUse: TIdBytes;
begin
  if Application.Terminated then
    Exit;
  AContext.Connection.IOHandler.ReadBytes(BytesClientHostInfo, SizeOf
      (ClientHostInfo));
  BytesToRaw(BytesClientHostInfo, ClientHostInfo, SizeOf(ClientHostInfo));
  PostIndex := ListUnitObjets.ChercherHostName(ClientHostInfo.HostName);

  if PostIndex = -1 then
  begin
    PostIndex := ListUnitObjets.Add(TUnitObjets.Create(AContext, ClientHostInfo)
      );
    with TUnitObjets(ListUnitObjets.Items[PostIndex]) do
    begin
      Post_Client.StateLock := slLock;
      Connexion.StateConnect := scConnected;
    end;

    with DataModuleBase do
    begin
      Table_Post_Client.Open;
      Table_Post_Client.Insert;
      Table_Post_ClientHostName.Value := ClientHostInfo.HostName;
      Table_Post_Client.Post;
    end;
  end
  else
  begin
    with TUnitObjets(ListUnitObjets.Items[PostIndex]) do
    begin
      Connexion.AIdContext := AContext;
      Connexion.Connect;

      if Assigned(Use) then
        Use.Resume // استأناف
      else
      begin
        if ClientHostInfo.StateLock = slUnLock then
        begin
          try
            Connexion.IdTCPClient.IOHandler.Write(Cmd_Lock);
          except
            on E: Exception do
            begin
              // MessageBox(Application.Handle, PChar(MsgText + #13 + E.Message),
              // PChar(MsgCaptionError), MB_OK + MsgType);
            end;
          end;
        end;
      end
    end;
  end;
  AContext.Data := ListUnitObjets.Items[PostIndex];
end;

procedure TConnexion_Module.IdTCPServerDisconnect(AContext: TIdContext);
begin
  TUnitObjets(AContext.Data).Connexion.IdTCPClient.Disconnect;
  if Application.Terminated then
    Exit;
  TUnitObjets(AContext.Data).Connexion.StateConnect := scDisconnect;
  AContext.Data := nil; // Post_Client لكي لا يتم تحرير
end;

procedure TConnexion_Module.IdTCPServerExecute(AContext: TIdContext);
var
  PostIndex: Integer;
  VUsername: string;
  VTimeDesired: TTime;
  VRecordUser: TRecordUser;
begin
  if TIdYarnOfThread(AContext.Yarn)
    .Thread.Terminated or not AContext.Connection.Connected or Application.
    Terminated then
    Exit;
  with AContext.Connection.IOHandler do
    case ReadByte of
      // ______________________________________________________________________________
      Cmd_GetPriceHour:
        begin
          WriteLn(CurrToStr(TUser.GetPriceHour
                (AContext.Connection.IOHandler.ReadLn)));
        end;
      // ______________________________________________________________________________
      Cmd_Demand_Use:
        TUser.Demand_Use(ReadLn, StrToTime(ReadLn), AContext.Data);
      // ______________________________________________________________________________
      Cmd_UsernameExists:
        if TUser.UsernameExists(ReadLn) then
          WriteLn('True')
        else
          WriteLn('False');
      // ______________________________________________________________________________
      Cmd_IsAdministrator:
        begin
          VUsername := ReadLn;
          if TUser.IsAdministrator(VUsername) then
          begin
            WriteLn('True');
            TUnitObjets(AContext.Data).User := TUser.Create
              (AContext.Data, VUsername);
            TUser(TUnitObjets(AContext.Data).User).CreateUser;
            TUnitObjets(AContext.Data).Post_Client.UnLock;
          end
          else
            WriteLn('False');
        end;
      // ______________________________________________________________________________
      Cmd_CheckPassword:
        if TUser.CheckPassword(ReadLn, ReadLn) then
          WriteLn('True')
        else
          WriteLn('False');
      // ______________________________________________________________________________
      Cmd_RecordingUser:
        begin
          TUnitObjets(AContext.Data).Connexion.ReadBuffer
            (VRecordUser, SizeOf(VRecordUser));
          FRecordUser := VRecordUser;
          FConnexion := TUnitObjets(AContext.Data).Connexion;
          TIdYarnOfThread(AContext.Yarn).Thread.Synchronize
            (ShowFormDemandRegister);
        end;
      // ______________________________________________________________________________
      Cmd_Restarting:
        TUnitObjets(AContext.Data).Connexion.StateConnect := scRestarting;
      // ______________________________________________________________________________
      Cmd_ShuttingDown:
        TUnitObjets(AContext.Data).Connexion.StateConnect := scShuttingDown;
    end;
end;

procedure TConnexion_Module.DataModuleCreate(Sender: TObject);
begin
  LocalHostInfo.HostName := GStack.HostName;
  LocalHostInfo.IPAddress := GStack.LocalAddress;
  LocalHostInfo.Password_UDP := 'Password_UDP';
end;

procedure TConnexion_Module.IdUDPServerUDPRead(AThread: TIdUDPListenerThread;
  AData: TBytes; ABinding: TIdSocketHandle);
var
  ClientHostInfo: TRecordHostInfo;
begin
  BytesToRaw(AData, ClientHostInfo, SizeOf(ClientHostInfo));
  if ClientHostInfo.Password_UDP = LocalHostInfo.Password_UDP then
    AData := ToBytes(LocalHostInfo.HostName)
  else
    AData := ToBytes('Password_UDP_Valid');
  try
    ABinding.SendTo(ABinding.PeerIP, ABinding.PeerPort, AData);
  finally
  end;
end;

procedure TConnexion_Module.ShowFormDemandRegister;
resourcestring
  MsgText = '..  خطأء عند ';
var
  Cmd: Byte;
begin
  FormDemandRegister := TFormDemandRegister.Create(Self);
  FormDemandRegister.FRecordUser := FRecordUser;

  if FormDemandRegister.ShowModal = mrOk then
    Cmd := Cmd_RecordingOk
  else
    Cmd := Cmd_RecordingCancel;

  try
    with TConnexion(FConnexion), IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
        Write(Cmd)
      else
        MessageBox(0, PChar(MsgNotConnected), PChar(MsgCaptionError), MsgType);
    end;
  except
    on E: Exception do
    begin
      MessageBox(0, PChar(MsgText + #13 + E.Message), PChar(MsgCaptionError),
        MsgType)
    end;
  end;

  FreeAndNil(FormDemandRegister);
end;

end.
