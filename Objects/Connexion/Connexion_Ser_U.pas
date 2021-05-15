unit Connexion_Ser_U;

interface

uses Connexion_Concerted_U, Type_U, IdTCPServer;

type
  TConnexion_Ser = class(TConnexion_Concerted)
  private
  protected
    procedure SetStateConnect(const Value: TStateConnect); override;
  public
    constructor Create; override;
    procedure Connect; override;
    destructor Destroy; override;
  end;

implementation

uses Classes_U;

{ TConnexion_Ser }

procedure TConnexion_Ser.Connect;
begin
  IdTCPClient.Port := 6001;
  inherited;
end;

constructor TConnexion_Ser.Create;
begin
  inherited;
end;

destructor TConnexion_Ser.Destroy;
begin

  inherited;
end;

procedure TConnexion_Ser.SetStateConnect(const Value: TStateConnect);
begin
  inherited;
  TUnitObjets(FUnitObjets).Change_ImageIndex;
end;

end.
