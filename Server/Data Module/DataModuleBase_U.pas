unit DataModuleBase_U;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModuleBase = class(TDataModule)
    Connection: TADOConnection;
    DS_Use: TDataSource;
    Table_Use: TADOTable;
    Table_User: TADOTable;
    DS_User: TDataSource;
    Table_UsepseudonymeUser: TWideStringField;
    Table_UseHostName: TWideStringField;
    Table_UseTimeStart: TDateTimeField;
    Table_UseTimeUse: TDateTimeField;
    Table_Userpseudonyme: TWideStringField;
    Table_UserPrenom: TWideStringField;
    Table_UserNom: TWideStringField;
    Table_UserPassword: TWideStringField;
    Table_UserN_Carte: TSmallintField;
    Table_UserEmail: TWideStringField;
    Table_UserAdresse: TMemoField;
    Table_UserDateNescience: TDateTimeField;
    Table_UserComputation: TBCDField;
    Table_UserDate_Register: TDateTimeField;
    Table_UserN_mobile: TSmallintField;
    Table_UserRemark: TMemoField;
    Table_UserNiveau_Informatique: TWideStringField;
    Table_UserVocation: TWideStringField;
    Table_UserRate: TWideStringField;
    Table_Post_Client: TADOTable;
    DS_Post_Client: TDataSource;
    Table_Rate: TADOTable;
    DS_Rate: TDataSource;
    Table_RateNameRate: TWideStringField;
    Table_RatePriceHour: TBCDField;
    Table_Post_ClientHostName: TWideStringField;
    Table_UserLogOn: TBooleanField;
    Table_UserSexe: TBooleanField;
    Table_UseCostPayment: TBCDField;
    Table_Post_ClientTimeStart: TDateTimeField;
    DS_Autorisations: TDataSource;
    Table_Autorisations: TADOTable;
    Table_AutorisationsPseudonyme: TWideStringField;
    Table_AutorisationsRegistration: TBooleanField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DataModuleBase: TDataModuleBase;

implementation

{$R *.dfm}

procedure TDataModuleBase.DataModuleCreate(Sender: TObject);
begin
  Table_Use.Open;
  Table_User.Open;
  Table_Autorisations.Open;
  Table_Rate.Open;
  Table_Post_Client.Open;
end;

procedure TDataModuleBase.DataModuleDestroy(Sender: TObject);
begin
  Table_Use.Close;
  Table_User.Close;
  Table_Autorisations.Close;
  Table_Rate.Close;
  Table_Post_Client.Close;
end;

end.
