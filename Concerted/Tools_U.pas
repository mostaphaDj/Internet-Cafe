unit Tools_U;

interface

uses SysUtils{,Winsock};

//function GetIPFromHost
//(var HostName, IPaddr, WSAErr: String): Boolean;

//type
//  Name = array[0..100] of Char;
//  PName = ^Name;
//const
//  winsocket = 'wsock32.dll';
//{$EXTERNALSYM gethostname}
//function gethostname(name: Name; len: Integer): Integer; stdcall;
//{$EXTERNALSYM gethostbyname}
//function gethostbyname(name: Name): PHostEnt; stdcall;

//function StateTimeToString(Value: TStateTime): string;
//function StringToStateTime(Value: string): TStateTime;
//
//function StateLockToString(Value: TStateLock): string;
//function StringToStateLock(Value: string): TStateLock;

// function StateUseToString(Value: TStateUse): string;
// function StringToStateUse(Value: string): TStateUse;

implementation


//function StrPas(const Str: PChar): AnsiString;
//begin
//  Result := Str;
//end;
//
//function GetIPFromHost
//(var HostName, IPaddr, WSAErr: String): Boolean;
//
//var
//  HEnt: pHostEnt;
//  HName: PName;
//  WSAData: TWSAData;
//  i: Integer;
//begin
//  Result := False;
//  if WSAStartup($0101, WSAData) <> 0 then begin
//    WSAErr := 'Winsock is not responding."';
//    Exit;
//  end;
//  IPaddr := '';
//  New(HName);
//  if GetHostName(HName^, SizeOf(Name)) = 0 then
//  begin
//    HEnt := GetHostByName(HName^);
//    HostName :=HEnt^.h_name; //StrPas(HName^);
//
//    for i := 0 to HEnt^.h_length - 1 do
//     IPaddr :=
//      Concat(IPaddr,
//      IntToStr(Ord(HEnt^.h_addr_list^[i])) + '.');
//    SetLength(IPaddr, Length(IPaddr) - 1);
//    Result := True;
//  end
//  else begin
//   case WSAGetLastError of
//    WSANOTINITIALISED:WSAErr:='WSANotInitialised';
//    WSAENETDOWN      :WSAErr:='WSAENetDown';
//    WSAEINPROGRESS   :WSAErr:='WSAEInProgress';
//   end;
//  end;
//  Dispose(HName);
//  WSACleanup;
//end;
//
//function gethostname;       external    winsocket name 'gethostname';
//function gethostbyname;     external    winsocket name 'gethostbyname';

//function StateTimeToString(Value: TStateTime): string;
//begin
//  case Value of
//    stTimeUnlimited:
//      Result := 'stTimeUnlimited';
//    stTimelimited:
//      Result := 'stTimelimited';
//  end;
//end;
//
//function StringToStateTime(Value: string): TStateTime;
//begin
//  if Value = 'stTimeUnlimited' then
//    Result := stTimeUnlimited
//  else if Value = 'stTimelimited' then
//    Result := stTimelimited;
//end;
//
//function StateLockToString(Value: TStateLock): string;
//begin
//  case Value of
//    slLock:
//      Result := 'slLock';
//    slUnLock:
//      Result := 'slUnLock';
//  end;
//end;
//
//function StringToStateLock(Value: string): TStateLock;
//begin
//  if Value = 'slLock' then
//    Result := slLock
//  else if Value = 'slUnLock' then
//    Result := slUnLock;
//end;

end.
