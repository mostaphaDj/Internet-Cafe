unit Post_Client_Concerted_U;

interface

uses Forms, Classes,
  Type_U, Connexion_Concerted_U;

type
  TPost_Client_Concerted = class(TObject)
  private
    // function GetRecordPost_Client: TRecordHostInfo;
    // procedure SetRecordPost_Client(const Value: TRecordHostInfo);
  protected
    FUnitObjets: TObject;
    FHostName, FIPAddress: string;
    FStateLock: TStateLock;
    // FRecordPost_Client: TRecordHostInfo;
    procedure SetStateLock(const Value: TStateLock); virtual;
    procedure SetHostName(const Value: string); virtual;
  public
    procedure UnLock; virtual;
    procedure Lock; virtual;
    procedure ShutDown; virtual; abstract;
    procedure Restart; virtual; abstract;
    property HostName: string read FHostName write SetHostName;
    property IPAddress: string read FIPAddress write FIPAddress;
    property StateLock
      : TStateLock read FStateLock write SetStateLock Default slLock;
    property UnitObjets: TObject read FUnitObjets write FUnitObjets;
    // property RecordPost_Client: TRecordHostInfo read GetRecordPost_Client write SetRecordPost_Client; //
    destructor Destroy; override;
  end;

implementation

uses Classes_U, UnitObjets_Concerted_U;

destructor TPost_Client_Concerted.Destroy;
begin
  TUnitObjets(FUnitObjets).Post_Client := nil;
  inherited;
end;

procedure TPost_Client_Concerted.Lock;
begin
  SetStateLock(slLock);
end;

procedure TPost_Client_Concerted.UnLock;
begin
  SetStateLock(slUnLock);
end;

// function TPost_Client_Concerted.GetRecordPost_Client: TRecordHostInfo;
// begin
// with FRecordPost_Client do
// begin
// HostName:=FHostName;
// IPAddress:= FIPAddress;
// Password_UDP:=TUnitObjets(FUnitObjets).Connexion.Password_UDP;
// end;
// Result := FRecordPost_Client;
// end;
//
procedure TPost_Client_Concerted.SetHostName(const Value: string);
begin
  FHostName := Value;
  TUnitObjets(FUnitObjets).Connexion.IdTCPClient.Host := TUnitObjets(UnitObjets)
    .Post_Client.HostName;
end;

// procedure TPost_Client_Concerted.SetRecordPost_Client(
// const Value: TRecordHostInfo);
// begin
// FHostName := Value.HostName;
// FHostName := Value.IPAddress ;
// TUnitObjets(FUnitObjets).Connexion.Password_UDP := Value.Password_UDP ;
// end;

procedure TPost_Client_Concerted.SetStateLock(const Value: TStateLock);
begin
  FStateLock := Value;
end;

end.

