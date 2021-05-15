unit User_Cli_U;

interface

uses windows, SysUtils, forms, User_Concerted_U, Type_U;

type
  TUser_Cli = class(TUser_Concerted)
  private

  protected

  public
    class function Recording(VRUser: TRecordUser; VConnexion: TObject)
      : Boolean; override; //  ”ÃÌ· (≈‰‘«¡ Õ”«» ÃœÌœ)
    class function UsernameExists(VUsername: string): Boolean; override; // «· Õﬁﬁ „‰  Ê›— «”„ «·„” Œœ„
    class function CheckPassword(VUsername: string; VPassword: string): Boolean; override; // «· Õﬁﬁ „‰ ’Õ… ﬂ·„… «·„—Ê—
    class function IsAdministrator(VUsername: string): Boolean; override;
    class function GetPriceHour(VUnitObjects: TObject; VPseudonyme: String)
      : Currency;
    class procedure Demand_Use(VUsername: string; VTimeDesired: TTime;
      VUnitObjets: TObject); override; // ÿ·»  «·≈ ’«·
  end;

implementation

uses Use_Cli_U, Form_Welcoming_U, IdTCPConnection, Use_Concerted_U, Classes_U,
  ComCtrls;

class function TUser_Cli.GetPriceHour(VUnitObjects: TObject;
  VPseudonyme: String): Currency;
resourcestring
  String_MessageDemand_Use = ' ⁄–— ÿ·» «·Ã·”… Œÿ√›Ì «·≈ ’«·';
begin
  inherited;
  try
    with TUnitObjets(VUnitObjects).Connexion,IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
      begin
        Write(Cmd_GetPriceHour);
        Writeln(VPseudonyme);
        Result := StrToCurr(Readln);
      end
      else
        MessageBox(Application.Handle, PChar(MsgNotConnected), PChar
            (MsgCaptionError), MsgType);
    end;
  except
    on E: Exception do
    begin
      MessageBox(Application.Handle, PChar
          (String_MessageDemand_Use + #13 + E.Message), PChar(MsgCaptionError),
        MsgType);
    end;
  end;

end;

class function TUser_Cli.IsAdministrator(VUsername: string): Boolean;
resourcestring
msg1 = '›‘· « „«„ «·⁄„·Ì…';

begin
  inherited;
  try
    with TUnitObjets(UnitObjets_Active).Connexion, IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
      begin
        Write(Cmd_IsAdministrator);
        WriteLn(VUsername);
        if ReadLn = 'True' then
          Result :=True
        else if ReadLn = 'False' then
        Result := False;
      end
    end;
  except
    on E: Exception do
    begin
      MessageBox(Application.Handle, PChar
          ( msg1 + #13 + E.Message), PChar
          (MsgCaptionError), MsgType);
    end;
  end;
end;

class procedure TUser_Cli.Demand_Use(VUsername: string; VTimeDesired: TTime;
  VUnitObjets: TObject);
resourcestring
  String_MessageDemand_Use = ' ⁄–— ÿ·» «·Ã·”… Œÿ√›Ì «·≈ ’«·';
begin
  // inherited;
  try
    with UnitObjets_Active.Connexion,IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
      begin
        Write(Cmd_Demand_Use);
        Writeln(TimeToStr(VTimeDesired));
        Writeln(VUsername);
      end
      else
        MessageBox(Application.Handle, PChar(MsgNotConnected), PChar
            (MsgCaptionError), MsgType);
    end;
  except
    on E: Exception do
    begin
      MessageBox(Application.Handle, PChar
          (String_MessageDemand_Use + #13 + E.Message), PChar(MsgCaptionError),
        MsgType);
    end;
  end;

end;

class function TUser_Cli.Recording(VRUser: TRecordUser; VConnexion: TObject)
  : Boolean;
resourcestring
  String_MessageRecording = ' ⁄–— ≈ﬂ„«· «· ”ÃÌ· »”»» Œÿ√¡ ›Ì «·≈ ’«·';
var
  commond: string;
begin
  // inherited ;
  try
    with UnitObjets_Active.Connexion, IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
      begin
        Write(Cmd_RecordingUser);
        WriteBuffer(VRUser, SizeOf(VRUser));
      end
      else
        MessageBox(Application.Handle, PChar(MsgNotConnected), PChar
            (MsgCaptionError), MsgType);
    end;
  except
    on E: Exception do
    begin
      Result := False;
      MessageBox(Application.Handle, PChar
          (String_MessageRecording + #13 + E.Message), PChar(MsgCaptionError),
        MsgType);
    end;
  end;
end;

class function TUser_Cli.UsernameExists(VUsername: string): Boolean; // «· Õﬁﬁ „‰  Ê›— «”„ «·„” Œœ„
resourcestring
  String_MessageUsername =
    ' ⁄–— «· Õﬁﬁ „‰  Ê›— «”„ «·„” Œœ„ »”»» Œÿ√ ›Ì «·≈ ’«· »«·„Œœ„';
var
  commond: string[5];
begin
  // inherited UsernameExists(VUsername, VConnexion);
  try
    with UnitObjets_Active.Connexion,IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
      begin
        Write(Cmd_UsernameExists);
        Writeln(VUsername);
        commond := Readln;
        if commond = 'True' then
          Result := True
        else if commond = 'False' then
          Result := False;
      end
      else
        MessageBox(Application.Handle, PChar(MsgNotConnected), PChar
            (MsgCaptionError), MsgType);
    end;
  except
    on E: Exception do
    begin
      MessageBox(Application.Handle, PChar
          (String_MessageUsername + #13 + E.Message), PChar(MsgCaptionError),
        MsgType);
    end;
  end;
end;

class function TUser_Cli.CheckPassword(VUsername: string; VPassword: string): Boolean; // «· Õﬁﬁ „‰ ’Õ… ﬂ·„… «·„—Ê—
resourcestring
  String_MessagePassword =
    ' ⁄–— «· Õﬁﬁ „‰ ﬂ·„… «·„—Ê— »”»» Œÿ√ ›Ì «·« ’«· »«·„Œœ„';
var
  commond: string[5];
begin
  // inherited CheckPassword(VUsername, VPassword, VConnexion);
  try
    with UnitObjets_Active.Connexion,IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
      begin
        Write(Cmd_CheckPassword);
        Writeln(VPassword);
        Writeln(VUsername);
        commond := Readln;
        if commond = 'True' then
          Result := True
        else if commond = 'False' then
          Result := False;
      end
      else
        MessageBox(Application.Handle, PChar(MsgNotConnected), PChar
            (MsgCaptionError), MsgType);
    end;
  except
    on E: Exception do
    begin
      MessageBox(Application.Handle, PChar
          (String_MessagePassword + #13 + E.Message), PChar(MsgCaptionError),
        MsgType);
    end;
  end;
end;

end.
