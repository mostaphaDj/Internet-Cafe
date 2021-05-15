unit Type_U;

interface

uses Windows, SysUtils;

type
  TStateTime = (stTimeUnlimited { æŞÊ ÛíÑ ãÍÏæÏ } , stTimelimited
    { æŞÊ ãÍÏÏ } ); // ÍÇáÉ ÇáÌáÓÉ
  TStateLock = (slLock { ãÛáŞ } , slUnLock { ãİÊæÍ } );
  TStateConnect = (scConnected { ãÊÕá } , scDisconnect
    { ÇäŞØÇÚ ãÌåæá } , scShuttingDown, scRestarting, scOutsideDomaine
    { ÎÇÑÌ ÇáäØÇŞ } ); // æÖÚíÉ ÇáÅÊÕÇá

  PRecordUser = ^TRecordUser;

  TRecordUser = packed record
    pseudonyme: string[15]; // ÅÓã  ÇáÏÎæá
    Prename: string[15]; // ÅÓã ÇáãÓÊÚãá
    Name: string[15]; // ÅÓã ÇáÚÆáÉ
    Sexe: Boolean; // ÇáÌäÓ
    Password: string[15]; // ßáãÉ ÇáãÑæÑ
    N_Carte: Integer; // ÑŞã ÈØÇŞÉ ÇáÊÚÑíİ ÇáæØäí
    Email: string[30]; // ÇáÈÑíÏ ÇáÅáßÊÑæäí
    Adresse: string[250]; // ÇáÚäæÇä
    DateNescience: TDateTime; // ÊÇÑíÎ ÇáãíáÇÏ
    Computation: Currency; // ÇáÑÕíÏ Ãæ ÇáÏíä
    Rate: string[30]; // ÊÕäíİ ÇáÒÈæä
    Date_Register: TDateTime; // ÊÇÑíÎ ÇáÊÓÌíá
    N_mobile: Integer; // ÇáåÇÊİ ÇáÌæÇá
    Niveau_Informatique: string[15]; // ÇáæÓÊæì İí ÇáÅÚáÇã ÇáÂáí
    Vocation: string[30]; // ÇáãåäÉ
    Remark: string[250]; // ãáÇÍÖÉ Úä ÇáÒÈæä
    FLogOn: Boolean; // ÊÓÌíá ÇáÏÎæá
  end;

  TRecordAutorisations = packed record // ÇáÊÑÇÎíÕ (ÇáÕáÇÍíÇÊ)
    Registration: Boolean;
  end;

  TRecordUse = packed record
    PriceHour: Currency; { Ëãä ÇáÓÇÚÉ }
    TimeStart: TDateTime; // default Now;{æŞÊ ÈÏÁ ÇáÌáÓÉ}
    TimeFin: TDateTime; // æŞÊ ÅäåÇÁ ÇáÌáÓÉ
    TimeFinVirtual: TDateTime; // æŞÊ ÅäåÇÁ ÇáÌáÓÉ
    TimeUse: TDateTime; // {ÇáæŞÊ ÇáãÓÊÎÏã}
    TimeDesired: TDateTime; // ÇáæŞÊ ÇáãØáæÈ
    CostVirtual: Currency; { ÇáãÈáÛ ÇáãİÊÑÖ }
    Cost: Currency; { ÇáãÈáÛ }
    StateTime: TStateTime; { ÇáæÖÚíÉ }
  end;

  TRecordRound = packed record
    UnitRound: Currency; // ŞíãÉ ÇáÊÑÌíÍ
    ValueNiveauRound: Currency; // ŞíãÉ ÇŞá ÍÓÇÑÉ
  end;

Var
  VRecordRound: TRecordRound;

Type
  TRecordHostInfo = packed record
    HostName: string[63];
    IPAddress: string[15];
    Password_UDP: string[15];
    StateLock: TStateLock;
  end;

var
  LocalHostInfo: TRecordHostInfo;

const
  Unknown = 'Unknown'; // ÛíÑ ãÚÑæİ
  Undefined = 'undefined';
  Common = 'Common'; // ÊÕäíİ ÇáÒÈæä ÚÇÏí

const
  MsgType: Integer = MB_ICONSTOP + MB_DEFBUTTON1 + MB_SYSTEMMODAL + MB_RIGHT +
    MB_RTLREADING;
  MsgCaptionError = 'ÎØÃ';
  MsgCaptionWarning = 'ÊÍĞíÑ';
  MsgCaptionQustion = 'ÓÄÇá';

const
  // //Client To Serever
  Cmd_GetPriceHour = $001;
  Cmd_Demand_Use = $002;
  Cmd_UsernameExists = $003;
  Cmd_CheckPassword = $004;
  Cmd_RecordingUser = $005;
  Cmd_Restarting = $006;
  Cmd_ShuttingDown = $007;
  Cmd_IsAdministrator = $0021;

  // // Serever To Client
  Cmd_CreateUser = $008;
  Cmd_Start = $009;
  Cmd_Resume = $010;
  Cmd_DemandUserefusal = 011;
  Cmd_StopAndCancel = $012;
  Cmd_Lock = $013;
  Cmd_Terminate = $014;

  Cmd_RecordingOk = $015;
  Cmd_RecordingCancel = $016;
  Cmd_Restart = $017;
  Cmd_ShutDown = $018;

  Cmd_ChangeUseTo = $019;
  Cmd_ChangeUseFor = $020;

resourcestring
  MsgCaptionRegistryRead = 'ÎØÃ  İí ÇÓÊÚãÇá ÓÌá ÇáäÙÇã';
  MsgTextRegistryRead = 'ÎØÃ ÚäÏ ÇáŞÑÇÁÉ ãä ÓÌá ÇáäÙÇã';
  MsgNotConnected = 'ÛíÑ ãÊÕá';
  MsgText1 = 'ÇÚÇÏÉ ßÊÇÈÉ ßáãÉ ÇáãÑæÑ ÛíÑ ÕÍíÍ';
  MsgText2 = 'ßáãÉ ÇáãÑæÑ áÇ ÊŞá Úä 4 ÍÑæİ';
  MsgText3 = 'ÇÓã ÇáÏÎæá  áÇíŞá Úä 4 ÍÑæÑİ';
  MsgText4 = 'ÇÓã ÇáÚÇÆáÉ áÇ íŞá Úä 4 ÍÑæİ';
  MsgText5 = 'ÇÓã ÇáãÓÊÎÏã  áÇíŞá Úä 4 ÍÑæİ';
  MsgText6 = 'ÑŞã ÇáåÇÊİ áÇíŞá Úä 9 ÃÑŞÇã';
  MsgText7 = 'ÊÃßíÏ ÇáÈÑíÏ ÇáÅáßÊÑæäí ÛíÑ ÕÍíÍ';
  MsgText8 = 'ÓíÛÉ ÇáÅãíá ÎÇØÆÉ' + #13 + 'ãËÇá :' + #13 + 'mohamed@yahoo.com' +
    #13 + 'ali@hotmail.com';
  MsgText9 = 'ÊÃßÏ ãä ÇÏÎÇá ÊÇÑíÎ ÇáÅÒÏíÇÏ ÕÍíÍ';

function StrFormatToCurr(Value: string): Currency;
function CurrToStrFormat(Value: Currency): string;

implementation

uses Registry;

function StrFormatToCurr(Value: string): Currency;
var
  i: Integer;
  R: string;
begin
  for i := 1 to Length(Value) do
    if (Value[i] in ['0' .. '9']) or ((Value[i] = '.') and (Pos('.', R) = 0))
      then
    begin
      R := R + Value[i]
    end;
  if R <> '' then
    Result := StrToCurr(R)
  else
    Result := 0;
end;

function CurrToStrFormat(Value: Currency): string;
begin
  Result := CurrToStrF(Value,
    { ffCurrency } ffNumber, CurrencyDecimals) + ' ' + CurrencyString;
end;

initialization

with TRegistry.Create do
begin
  try
    RootKey := HKEY_CURRENT_USER;
    if KeyExists('Software\DJ_group\MyCafe\Round') then
    begin
      OpenKey('Software\DJ_group\MyCafe\Round', False);
      VRecordRound.UnitRound := ReadCurrency('UnitRound'); // ŞíãÉ ÇáÊÑÌíÍ
      VRecordRound.ValueNiveauRound := ReadCurrency('NiveauRound');
      // ŞíãÉ ÇŞá ÍÓÇÑÉ
      CloseKey;
    end;
    Free;
  except
    VRecordRound.UnitRound := 0; // ŞíãÉ ÇáÊÑÌíÍ
    VRecordRound.ValueNiveauRound := 0; // ŞíãÉ ÇŞá ÍÓÇÑÉ
    // MessageBox(0, PChar(MsgTextRegistryRead), PChar(MsgCaptionRegistryRead), $180000);
    Free;
  end;
end;

end.
