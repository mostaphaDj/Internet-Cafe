unit UnitObjets_Concerted_U;

interface

uses Classes, SysUtils, ComCtrls, IdContext, Type_U,
  Post_Client_Concerted_U, User_Concerted_U, Use_Concerted_U,
  Connexion_Concerted_U;

type
  TUnitObjets_Concerted = class(TObject)
  private
    procedure GetUse(const Value: TUse_Concerted);
    procedure GetUser(const Value: TUser_Concerted);
  protected
    FPost_Client: TPost_Client_Concerted;
    FUse: TUse_Concerted;
    FUser: TUser_Concerted;
    FConnexion: TConnexion_Concerted;
  public
    constructor Create(VAContext: TIdContext;
      VRecordPost_Client: TRecordHostInfo); virtual;
    property Post_Client
      : TPost_Client_Concerted read FPost_Client write FPost_Client;
    property User: TUser_Concerted read FUser write GetUser;
    property Use: TUse_Concerted read FUse write GetUse;
    property Connexion: TConnexion_Concerted read FConnexion write FConnexion;
    destructor Destroy; override; abstract;
  end;

implementation

uses Classes_U;

{ TUnitObjets_Concerted }

constructor TUnitObjets_Concerted.Create(VAContext: TIdContext;
  VRecordPost_Client: TRecordHostInfo);
begin
  FConnexion := TConnexion.Create;
  FConnexion.UnitObjets := Self;
  FConnexion.AIdContext := VAContext;
  FPost_Client := TPost_Client.Create;
  FPost_Client.UnitObjets := Self;
  FPost_Client.IPAddress := VRecordPost_Client.IPAddress;
  FPost_Client.HostName := VRecordPost_Client.HostName;
end;

procedure TUnitObjets_Concerted.GetUse(const Value: TUse_Concerted);
begin
  if FUse <> Value then
  begin
    FUse := Value;
    if FUse <> nil then
      FUse.UnitObjets := Self;
  end;
end;

procedure TUnitObjets_Concerted.GetUser(const Value: TUser_Concerted);
begin
  if FUser <> Value then
  begin
    FUser := Value;
    if FUser <> nil then
      FUser.UnitObjets := Self;
      if Assigned(FUse) then
      FUse.User:=FUser;
  end;
end;

end.
