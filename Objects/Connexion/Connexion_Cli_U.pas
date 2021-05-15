unit Connexion_Cli_U;

interface

uses Connexion_Concerted_U, IdTCPServer;

type
  TConnexion_Cli = class(TConnexion_Concerted)
  private
  protected

  public
    constructor Create; override;
    procedure Connect; override;
    destructor Destroy; override;
  end;

implementation

uses Type_U, Connexion_Module_U;

{ TConnexion_Cli }

procedure TConnexion_Cli.Connect;
begin
  IdTCPClient.Port := 6000;
  inherited;
end;

constructor TConnexion_Cli.Create;
begin
  inherited;

end;

destructor TConnexion_Cli.Destroy;
begin

  inherited Destroy;
end;

end.
