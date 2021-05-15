unit User_Concerted_U;

interface

uses Type_U, Connexion_Concerted_U;

type
  TAutorisations = class(TObject) // «· —«ŒÌ’ («·’·«ÕÌ« )
  private
    FRegistration: Boolean;
    FRecordAutorisations :TRecordAutorisations;
    function GetRecordAutorisations: TRecordAutorisations;
    procedure SetRecordAutorisations(const Value: TRecordAutorisations);
  public
    property Registration: Boolean read FRegistration write FRegistration;
    property RecordAutorisations: TRecordAutorisations read GetRecordAutorisations write SetRecordAutorisations; //
  end;

  TUser_Concerted = class(TObject)
  private
    function GetRecordUser: TRecordUser;
    procedure SetRecordUser(const Value: TRecordUser);
  protected
    FComputation: Currency;
    FN_Carte: Integer;
    FPassword: String;
    FVocation: String;
    FPseudonyme: String;
    FPrename: String;
    FNiveau_didacticism: String;
    FAdresse: String;
    FSexe: Boolean;
    FEmail: String;
    FNiveau_Informatique: String;
    FName: String;
    FRemark: String;
    FDate_Register: TDateTime;
    FDateNescience: TDateTime;
    FRecordUser: TRecordUser;
    FRate: String;
    FN_mobile: Integer;
    FLogOn: Boolean; //  ”ÃÌ· «·œŒÊ·
    FAutorisations: TAutorisations; // «·’·«ÕÌ« 
    FUnitObjets: TObject;
    procedure Setpseudonyme(const Value: String); virtual;
  public
    constructor Create(VUnitObjects: TObject; VPseudonyme: string = '');
      virtual;
    class function Recording(VRUser: TRecordUser; VConnexion: TObject)
      : Boolean; virtual; abstract; //  ”ÃÌ· (≈‰‘«¡ Õ”«» ÃœÌœ)
    class function UsernameExists(VUsername: string) : Boolean; virtual; abstract; // «· Õﬁﬁ „‰  Ê›— «”„ «·„” Œœ„
    class function CheckPassword(VUsername: string; VPassword: string): Boolean; virtual; abstract;
    // «· Õﬁﬁ „‰ ’Õ… ﬂ·„… «·„—Ê—
    function IsAdministrator: Boolean;overload; virtual;
    class function IsAdministrator(VUsername: string): Boolean;overload; virtual; abstract;
    class procedure Demand_Use(VUsername: string; TimeDesired: TTime;
      VUnitObjets: TObject); virtual; abstract; // ÿ·»  «·≈ ’«·
    property Pseudonyme: String read Fpseudonyme write Setpseudonyme;
    // «”„ «·œŒÊ·
    property Prename: String read FPrename write FPrename; // «·«”„
    property Name: String read FName write FName; // ≈”„ «·⁄∆·…
    property Password: String read FPassword write FPassword; // ≈”„ «·⁄∆·…
    property Rate: String read FRate write FRate;
    // ›∆… «·„” Œœ„ („” ÊÏ «· ’‰Ì› „‰ √Ã· «· ”⁄Ì—)
    property Sexe: Boolean read FSexe write FSexe; // «·Ã‰”
    property N_Carte: Integer read FN_Carte write FN_Carte;
    // —ﬁ„ »ÿ«ﬁ… «· ⁄—Ì› «·Êÿ‰Ì
    property Email: String read FEmail write FEmail; // «·»—Ìœ «·≈·ﬂ —Ê‰Ì
    property Adresse: String read FAdresse write FAdresse; // «·⁄‰Ê«‰
    property N_mobile: Integer read FN_mobile write FN_mobile; // «·⁄‰Ê«‰
    property DateNescience: TDateTime read FDateNescience write FDateNescience;
    //  «—ÌŒ «·„Ì·«œ
    property Computation: Currency read FComputation write FComputation;
    // «·—’Ìœ √Ê «·œÌ‰
    property Date_Register: TDateTime read FDate_Register write FDate_Register;
    //  «—ÌŒ «· ”ÃÌ·
    property Niveau_Informatique: String read FNiveau_Informatique write
      FNiveau_Informatique; // «·Ê” ÊÏ ›Ì «·≈⁄·«„ «·¬·Ì
    property Niveau_didacticism
      : String read FNiveau_didacticism write FNiveau_didacticism;
    // «·Ê” ÊÏ ›Ì «·≈⁄·«„ «·¬·Ì
    property Vocation: String read FVocation write FVocation; // «·„Â‰…
    property Remark: String read FRemark write FRemark; // „·«Õ÷… ⁄‰ «·“»Ê‰
    property LogOn: Boolean read FLogOn write FLogOn; // „·«Õ÷… ⁄‰ «·“»Ê‰
    property Autorisations
      : TAutorisations read FAutorisations write FAutorisations;
    property RecordUser: TRecordUser read GetRecordUser write SetRecordUser; //
    property UnitObjets: TObject read FUnitObjets write FUnitObjets;
    destructor Destroy; override;
  end;

implementation

uses Classes_U;

{ TUser }

constructor TUser_Concerted.Create(VUnitObjects: TObject;
  VPseudonyme: string = '');
begin
  FPseudonyme := VPseudonyme;
  if Assigned(VUnitObjects) then
  begin
    FUnitObjets := VUnitObjects;
    TUnitObjets(FUnitObjets).User := self;
  end;
end;

destructor TUser_Concerted.Destroy;
begin
  TUnitObjets(FUnitObjets).User := nil;
  FAutorisations.Free;
  inherited;
end;

function TUser_Concerted.GetRecordUser: TRecordUser;
begin
  with FRecordUser do
  begin
    Pseudonyme := Fpseudonyme; // ≈”„  «·œŒÊ·
    Prename := FPrename; // ≈”„ «·„” ⁄„·
    Name := FName; // ≈”„ «·⁄∆·…
    Sexe := FSexe; // «·Ã‰”
    Password := FPassword; // ﬂ·„… «·„—Ê—
    N_Carte := FN_Carte; // —ﬁ„ »ÿ«ﬁ… «· ⁄—Ì› «·Êÿ‰Ì
    Email := FEmail; // «·»—Ìœ «·≈·ﬂ —Ê‰Ì
    Adresse := FAdresse; // «·⁄‰Ê«‰
    DateNescience := FDateNescience; //  «—ÌŒ «·„Ì·«œ
    Computation := FComputation; // «·—’Ìœ √Ê «·œÌ‰
    Rate := FRate; //  ’‰Ì› «·“»Ê‰
    Date_Register := FDate_Register; //  «—ÌŒ «· ”ÃÌ·
    N_mobile := FN_mobile; // «·Â« › «·ÃÊ«·
    Niveau_Informatique := FNiveau_Informatique; // «·Ê” ÊÏ ›Ì «·≈⁄·«„ «·¬·Ì
    Niveau_didacticism := FNiveau_didacticism; // //  «·Ê” ÊÏ ›Ì «·≈⁄·«„ «·¬·Ì
    Vocation := FVocation; // ; //   «·„Â‰…
    Remark := FRemark; // „·«Õ÷… ⁄‰ «·“»Ê‰
    LogOn := FLogOn; //  ”ÃÌ· «·œŒÊ·
  end;
  Result := FRecordUser;
end;

function TUser_Concerted.IsAdministrator: Boolean;
begin
  if Assigned(FAutorisations) then
    Result := True
  else
    Result := False;
end;

procedure TUser_Concerted.Setpseudonyme(const Value: String);
begin
  if Fpseudonyme = Value then
    Exit;
  Fpseudonyme := Value;
end;

procedure TUser_Concerted.SetRecordUser(const Value: TRecordUser);
begin
  Fpseudonyme := Value.Pseudonyme; // ≈”„  «·œŒÊ·
  FPrename := Value.Prename; // ≈”„ «·„” ⁄„·
  FName := Value.Name; // ≈”„ «·⁄∆·…
  FSexe := Value.Sexe; // «·Ã‰”
  FPassword := Value.Password; // ﬂ·„… «·„—Ê—
  FN_Carte := Value.N_Carte; // —ﬁ„ »ÿ«ﬁ… «· ⁄—Ì› «·Êÿ‰Ì
  FEmail := Value.Email; // «·»—Ìœ «·≈·ﬂ —Ê‰Ì
  FAdresse := Value.Adresse; // «·⁄‰Ê«‰
  FDateNescience := Value.DateNescience; //  «—ÌŒ «·„Ì·«œ
  FComputation := Value.Computation; // «·—’Ìœ √Ê «·œÌ‰
  FRate := Value.Rate; //  ’‰Ì› «·“»Ê‰
  FDate_Register := Value.Date_Register; //  «—ÌŒ «· ”ÃÌ·
  FN_mobile := Value.N_mobile; // «·Â« › «·ÃÊ«·
  FNiveau_Informatique := Value.Niveau_Informatique; // «·Ê” ÊÏ ›Ì «·≈⁄·«„ «·¬·Ì
  FVocation := Value.Vocation; // ; //   «·„Â‰…
  FRemark := Value.Remark; // „·«Õ÷… ⁄‰ «·“»Ê‰
  FLogOn := Value.FLogOn;
  /// /  ”ÃÌ· «·œŒÊ·
end;

{ TAutorisations }

function TAutorisations.GetRecordAutorisations: TRecordAutorisations;
begin
  with FRecordAutorisations do
  begin
    Registration := FRegistration;

  end;
  Result := FRecordAutorisations;
end;

procedure TAutorisations.SetRecordAutorisations(
  const Value: TRecordAutorisations);
begin
  FRegistration := Value.Registration; // ≈”„  «·œŒÊ·
end;

end.
