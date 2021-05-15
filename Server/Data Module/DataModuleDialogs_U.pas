unit DataModuleDialogs_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataModuleBase_U, DB, ADODB;

type
  TDataModuleDialogs = class(TDataModuleBase)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleDialogs: TDataModuleDialogs;

implementation

uses Classes_U, DateUtils,
  UnitObjets_Ser_U,Type_U;

{$R *.dfm}

procedure TDataModuleDialogs.DataModuleCreate(Sender: TObject);
var
  HostInfo: TRecordHostInfo;
  VUnitObjets: TUnitObjets;
begin
  inherited;
  Table_Post_Client.First;
  ListUnitObjets := TListUnitObjets.Create;
  while not Table_Post_Client.Eof do
  begin
    HostInfo.HostName := Table_Post_ClientHostName.Value;
    VUnitObjets := TUnitObjets.Create(nil, HostInfo);
    TUnitObjets(VUnitObjets).Connexion.StateConnect := scDisconnect;
    ListUnitObjets.Add(VUnitObjets);
    with VUnitObjets do
    begin
      if Table_Post_ClientTimeStart.Value <> 0 then
      // «–« ﬂ«‰   ÊÃœ Ã·”… ⁄·Ï «·Õ«”Ê»
      begin
        Use := TUse.Create(VUnitObjets);
        TUse(Use).LoadRecord('„‰ »⁄«⁄œ', HostInfo.HostName,
          Table_Post_ClientTimeStart.Value);
        VUnitObjets.User := TUser.Create(VUnitObjets,
          Table_UsepseudonymeUser.Value);

        if Table_UseTimeUse.Value = 0 then // «–« ﬂ«‰ “„‰ «·Ã·”… €Ì— „Õœœ
        begin
          Use.StateTime := stTimeUnlimited;
          Post_Client.StateLock := slUnLock;
          Use.User := VUnitObjets.User;
        end
        else // «–« ﬂ«‰ “„‰ «·Ã·”… „Õœœ
        begin
          if CompareDateTime(Use.TimeFin, Now) = 1 then
          begin
            Post_Client.UnLock;
            Use.StateTime := stTimelimited;
          end
          else // «–« «‰ ÂÏ Êﬁ   «·Ã·”…
            Use.Terminate;
        end;
      end;
    end;
    Table_Post_Client.Next;
  end;
end;

end.
