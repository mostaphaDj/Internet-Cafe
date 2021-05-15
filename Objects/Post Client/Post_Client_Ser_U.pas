unit Post_Client_Ser_U;

interface

uses Windows, ComCtrls, IdTCPClient, Classes, IdTCPServer, Forms, ADODB,
  dialogs, Controls,
  Post_Client_Concerted_U, Type_U;

type

  TPost_Client_Ser = class(TPost_Client_Concerted)
  private
    procedure SetStateLock(const Value: TStateLock); override;
    procedure SetHostName(const Value: string); override;
  public
    { DÈclarations publiques }
    { MÈthod }
    // procedure UnLock; overload;
    // procedure Lock; override;

    procedure ShutDown; override;
    procedure Restart; override;

    { property }
    constructor Create;
    destructor Destroy; override;
    { EvÈnements }
  end;

implementation

uses IdTCPConnection, SysUtils,
  DB, Action_Module_U, DateUtils, Form_Payment_U,
  Form_ListView_Post_Client_U, UnitObjets_Ser_U,
  Classes_U;

{ TPost_Client_Ser }

procedure TPost_Client_Ser.Restart;
resourcestring
  MsgText = 'ÕœÀ Œÿ√ ⁄‰œ „Õ«Ê·… ≈⁄«œ… «· ‘€Ì·';
begin
  // inherited;
  try
    with TUnitObjets(UnitObjets).Connexion,IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
        Write(Cmd_Restart)
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
end;

procedure TPost_Client_Ser.ShutDown;
resourcestring
  MsgText = 'ÕœÀ Œÿ√ ⁄œ „Õ«Ê·… ≈ﬁ«› «· Ã€Ì·';
begin
  // inherited;
  try
    with TUnitObjets(UnitObjets).Connexion,IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
        Write(Cmd_ShutDown)
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
end;

destructor TPost_Client_Ser.Destroy;
begin
  inherited Destroy;

end;

constructor TPost_Client_Ser.Create;
begin
  inherited;

end;

procedure TPost_Client_Ser.SetHostName(const Value: string);
begin
  inherited;
  TUnitObjets(FUnitObjets).Item.Caption := FHostName;
end;

procedure TPost_Client_Ser.SetStateLock(const Value: TStateLock);
begin
  inherited;
  TUnitObjets(FUnitObjets).Change_ImageIndex;
end;

end.
