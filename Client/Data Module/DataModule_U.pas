unit DataModule_U;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs;

type
  TDataModule1 = class(TDataModule)
    Table_User: TADOTable;
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
    Table_UserNiveau_Informatique: TWideStringField;
    Table_UserVocation: TWideStringField;
    Table_UserRemark: TMemoField;
    Table_UserRate: TWideStringField;
    Table_UserLogOn: TBooleanField;
    Table_UserSexe: TBooleanField;
    DS_User: TDataSource;
    Table_Autorisations: TADOTable;
    Table_AutorisationsPseudonyme: TWideStringField;
    Table_AutorisationsRegistration: TBooleanField;
    DS_Autorisations: TDataSource;
    Connection: TADOConnection;
    OpenDialog1: TOpenDialog;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
Pach :string
begin
Pach := 'Data\SeberCafe.mdb';
if not FileExists(Pach) then
begin
OpenDialog1.f
if OpenDialog1.Execute then
begin

end
else
begin

end;
end
else
begin

end;
'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source='+
+';Mode=Share Deny None;Extended Properties="";Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don't Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False'
Connection.ConnectionString
end;

end.
