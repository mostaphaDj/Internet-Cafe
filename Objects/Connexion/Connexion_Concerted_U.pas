unit Connexion_Concerted_U;

interface

uses IdContext, IdUDPClient, IdTCPClient, Type_U, Idglobal, IdUDPServer;

type
  TConnexion_Concerted = class(TObject)
  private
    FIdUDPThread: TIdUDPListenerThread;
    procedure SetAIdContext(const Value: TIdContext);
  protected
    FAIdContext: TIdContext;
    FIdTCPClient: TIdTCPClient;
    FIdUDPClient: TIdUDPClient;
    FPassword_UDP: string;
    FUnitObjets: TObject;
    FStateConnect: TStateConnect;
    procedure SetStateConnect(const Value: TStateConnect); virtual;
  public
    constructor Create; virtual;
    procedure Connect; virtual;
    procedure WriteBuffer(const ABuffer; AByteCount: Longint);
    procedure ReadBuffer(var ABuffer; const AByteCount: Longint);
    property AIdContext: TIdContext read FAIdContext write SetAIdContext;
    property IdUDPThread
      : TIdUDPListenerThread read FIdUDPThread write FIdUDPThread;
    property IdTCPClient: TIdTCPClient read FIdTCPClient write FIdTCPClient;
    property IdUDPClient: TIdUDPClient read FIdUDPClient write FIdUDPClient;
    property Password_UDP: string read FPassword_UDP write FPassword_UDP;
    property UnitObjets: TObject read FUnitObjets write FUnitObjets;
    property StateConnect: TStateConnect read FStateConnect write
      SetStateConnect default scOutsideDomaine; // Õ«·… «·≈ ’«·
    destructor Destroy; override;
  end;

implementation

uses Classes_U;

{ TConnexion }

constructor TConnexion_Concerted.Create;
begin
  FIdTCPClient := TIdTCPClient.Create(nil);
  FPassword_UDP := 'Password_UDP'; // ·· ’ÕÌÕ ·«Õﬁ«
end;

procedure TConnexion_Concerted.SetAIdContext(const Value: TIdContext);
begin
  FAIdContext := Value;
end;

procedure TConnexion_Concerted.SetStateConnect(const Value: TStateConnect);
begin
  if FStateConnect = Value then
    Exit;
  FStateConnect := Value;
end;

destructor TConnexion_Concerted.Destroy;
begin
  TUnitObjets(FUnitObjets).Connexion := nil;
  inherited;
end;

procedure TConnexion_Concerted.Connect;
var
  Buf: TIdBytes;
begin
  with FIdTCPClient do
  begin
    try
      Connect;
    finally
      SetStateConnect(scConnected);
      Buf := RawToBytes(LocalHostInfo, SizeOf(LocalHostInfo));
      FIdTCPClient.IOHandler.Write(Buf);
    end;
  end;
end;

//  ⁄Ê”÷ «·„‰ÂÃ «·„›Êœ ›Ì indy10
// WriteBuffer and ReadBuffer
procedure TConnexion_Concerted.WriteBuffer(const ABuffer; AByteCount: Longint);
var
  Buf: TIdBytes;
begin
  Buf := RawToBytes(ABuffer, AByteCount);
  FIdTCPClient.IOHandler.Write(Buf);
end;

procedure TConnexion_Concerted.ReadBuffer
  (var ABuffer; const AByteCount: Longint);
var
  Buf: TIdBytes;
begin
  AIdContext.Connection.IOHandler.ReadBytes(Buf, AByteCount);
  BytesToRaw(Buf, ABuffer, AByteCount);
end;

end.
