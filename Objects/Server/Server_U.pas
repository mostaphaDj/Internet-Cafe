unit Server_U;

interface

uses IdTCPClient, IdContext;

type
  TServer = class(TObject)
  private
    FAThread: TIdContext;
    FidTCPClient: TIdTCPClient;
    procedure SetAThread(const Value: TIdContext);

  protected

  public
    constructor Create(VAThread: TIdContext; VIdTCPClient: TIdTCPClient);
    property IdTCPClient: TIdTCPClient read FidTCPClient;
    property AThread: TIdContext read FAThread write SetAThread;
    destructor Destroy; override;
  end;

implementation

{ TServer }

{ TServer }

constructor TServer.Create(VAThread: TIdContext; VIdTCPClient: TIdTCPClient);
begin

end;

destructor TServer.Destroy;
begin

  inherited;
end;

procedure TServer.SetAThread(const Value: TIdContext);
begin
  FAThread := Value;
end;

end.
