{ ******************************************************************************
  *  Copyright  2003  Dipl.-Ing. H.-D. Kassl  All rights reserved.
  *
  *  Kassl GmbH
  *  27607 Langen (Germany)
  *  phone: +49 4743 911021
  *  fax  : +49 4743 911022
  *
  *  http://www.dwinlock.kassl.de
  *  e-mail: dWinlock@Kassl.de
  *
  *  this unit includes all interface functions to the dWinlock dwlGina2.dll
  *
  ****************************************************************************** }
unit dwlCore_U;

interface

uses
  windows, Forms;

const
  MOD_ALL = 255; // constant to disable Key with all modifiers (Ctrl,Shift,Alt,Win)

  DWL_MAJORVERSION = 2; // actual version of dwlcore
  DWL_SUBVERSION = 12;
  DWL_VERSION = (DWL_MAJORVERSION shl 16) or DWL_SUBVERSION;

  wlTaskBar = 1; // Constants for disable Desktop items
  wlDesktop = 2; // see also procedure wlDisableItem
  wlStartbutton = 3;
  wlTaskLinks = 4;
  wlTaskTray = 5;
  wlTaskRebar = 6;
  wlAccessibility = 7;
  wlAccHighContrast = 8;
  wlAccFilterKeys = 9;
  wlAccMouseKey = 10;
  wlAccStickyKeys = 11;
  wlAccToggleKeys = 12;

  // dwlGinaInstallFlags to use with wlInstallGina and wlUninstallGina
  giForceInstall = 1;
  giForceUninstall = 2;
  giForceReboot = 4;
  giNoReboot = 8;
  giNoWarnings = 16;

  vWinunknown = 1;
  vWin95 = 2;
  vWin98 = 3;
  vWinMe = 4;
  vWinNT = 5;
  vWin2000 = 6;
  vWinXP = 7;

  kDownEvents = 1;
  kUpEvents = 2;

type
  _HWND = HWND;
  TdwlKeyCallbackFunc = procedure(UserData: integer; Wnd: _HWND;
    Down, Key, Shift: integer); stdcall;
  TdwlKeyCallbackMethod = procedure(Wnd: _HWND; Down, Key, Shift: integer)
    of object; {$IFNDEF CIL} stdcall; {$ENDIF}
procedure wlDisableItem(Item: integer; disable: integer);
function wlIsItemDisabled(Item: integer): integer;
function wlDisableKey(window: _HWND; vk, Modifiers: integer; disable: integer)
  : integer;
function wlIsKeyDisabled(window: _HWND; vk, Modifiers: integer): integer;
procedure wlSetKeySendMessage(WindowHandle: _HWND; KeyDownMessageID: integer;
  KeyUpMessageID: integer);
procedure wlSetKeyPostMessage(WindowHandle: _HWND; KeyDownMessageID: integer;
  KeyUpMessageID: integer);
function wlGetDisabledKey(i: integer; var window: _HWND; var vk, Shift: integer)
  : integer;
{$IFNDEF CIL}
procedure wlSetKeyCallback(Callback: TdwlKeyCallbackFunc; Flags: integer);
{$ENDIF}
procedure wlSetObjKeyCallback(Callback: TdwlKeyCallbackMethod; Flags: integer);
function wlInstallGina(Flags: integer): integer;
function wlUninstallGina(Flags: integer): integer;
function wlIsGinaInstalled: integer;
function wlIsNTSystem: integer;
function wlNeedGinaInstall: integer;
function wlExitWindows(Flags: integer): integer;
function wlWinVersion: integer;
function wlVersion(RequestedVersion: integer = 0): integer;
function wlGetKeyState(Key: integer): integer;
procedure wlSetKeyState(Key: integer; TurnOn: integer);
procedure wlRestoreAll;
function wlIsAdmin: boolean;
procedure wlEnableAutologin(DefUser: string; Pass: string; Enable: boolean);
function wlMapScancode(InputCode: integer; OutputCode: integer): integer;
// returns old mapping
procedure wlDisableDesktopIcon(index: integer);
function wlDesktopIconCount: integer;
procedure wlRestoreDesktopIcons;
procedure wlExit;
function GetClassName(Handle: _HWND): string;

implementation

{$IFDEF CIL} // if Delphi .Net

// ----------------------------------------------------------------------------
// Begin Delphi .NET source code
// ----------------------------------------------------------------------------
uses System.Security.Permissions,
  System.Text,
  System.Runtime.InteropServices,
  System.windows.Forms, Type_U;
// messages,Winutils;

const
  dwldll = 'dwlgina2.dll';
  WM_DWLKEYDOWN = $0400 + 444;
  WM_DWLKEYUP = $0400 + 445;

  // [DllImport('user32.dll', CharSet = CharSet.Auto, SetLastError = True, EntryPoint = 'GetClassName')]
  // function WinGetClassName(hWnd: _HWND; lpClassName: StringBuilder; nMaxCount: Integer): Integer; external;

  // pascal implemention of windows get classname method

function GetClassName(Handle: _HWND): string;
var
  Buffer: StringBuilder;
begin
  Buffer := StringBuilder.Create(255);
  windows.GetClassName(Handle, Buffer, 255);
  Result := Buffer.ToString;
end;

[DllImport(dwldll, EntryPoint = 'wlDisableItem')]
procedure wlDisableItem(Item: integer; disable: integer); external;

[DllImport(dwldll, EntryPoint = 'wlIsItemDisabled')]
function wlIsItemDisabled(Item: integer): integer; external;

[DllImport(dwldll, EntryPoint = 'wlDisableKey')]
function wlDisableKey(window: _HWND; vk, Modifiers: integer; disable: integer)
  : integer; external;

[DllImport(dwldll, EntryPoint = 'wlIsKeyDisabled')]
function wlIsKeyDisabled(window: _HWND; vk, Modifiers: integer): integer;
external;

[DllImport(dwldll, EntryPoint = 'wlSetKeySendMessage')]
procedure wlSetKeySendMessage(WindowHandle: _HWND; KeyDownMessageID: integer;
  KeyUpMessageID: integer); external;

[DllImport(dwldll, EntryPoint = 'wlSetKeyPostMessage')]
procedure wlSetKeyPostMessage(WindowHandle: _HWND; KeyDownMessageID: integer;
  KeyUpMessageID: integer); external;

[DllImport(dwldll, EntryPoint = 'wlGetDisabledKey')]
function wlGetDisabledKey(i: integer; var window: _HWND; var vk, Shift: integer)
  : integer; external;

[DllImport(dwldll, EntryPoint = 'wlInstallGina')]
function wlInstallGina(Flags: integer): integer; external;

[DllImport(dwldll, EntryPoint = 'wlUninstallGina')]
function wlUninstallGina(Flags: integer): integer; external;

[DllImport(dwldll, EntryPoint = 'wlIsGinaInstalled')]
function wlIsGinaInstalled: integer; external;

[DllImport(dwldll, EntryPoint = 'wlIsNTSystem')]
function wlIsNTSystem: integer; external;

[DllImport(dwldll, EntryPoint = 'wlNeedGinaInstall')]
function wlNeedGinaInstall: integer; external;

[DllImport(dwldll, EntryPoint = 'wlExitWindows')]
function wlExitWindows(Flags: integer): integer; external;

[DllImport(dwldll, EntryPoint = 'wlWinVersion')]
function wlWinVersion: integer; external;

[DllImport(dwldll, EntryPoint = 'wlVersion')]
function wlVersion(RequestedVersion: integer): integer; external;

[DllImport(dwldll, EntryPoint = 'wlGetKeyState')]
function wlGetKeyState(Key: integer): integer; external;

[DllImport(dwldll, EntryPoint = 'wlSetKeyState')]
procedure wlSetKeyState(Key: integer; TurnOn: integer); external;

[DllImport(dwldll, EntryPoint = 'wlRestoreAll')]
procedure wlRestoreAll(); external;

[DllImport(dwldll, EntryPoint = 'wlEnableAutologin')]
procedure wlEnableAutologin(DefUser: string; Pass: string; Enable: boolean);
external;

[DllImport(dwldll, EntryPoint = 'wlMapScancode')]
function wlMapScancode(InputCode: integer; OutputCode: integer): integer;
external;

[DllImport(dwldll, EntryPoint = 'wlDisableDesktopIcon')]
procedure wlDisableDesktopIcon(index: integer); external;

[DllImport(dwldll, EntryPoint = 'wlDesktopIconCount')]
function wlDesktopIconCount: integer; external;

[DllImport(dwldll, EntryPoint = 'wlRestoreDesktopIcons')]
procedure wlRestoreDesktopIcons(); external;

[DllImport(dwldll, EntryPoint = 'wlExit')]
procedure wlExit(); external;

[DllImport(dwldll, EntryPoint = 'wlIsAdmin')]
function wlIsAdmin: boolean; external;

// pure .Net implementation, but with this implemention
// .net fires two Keydown events under Win 98 , so we can't use it currently

type
  TWndCallback = class(NativeWindow)
    OnKeyEvent: TdwlKeyCallbackMethod;
    constructor Create(Callback: TdwlKeyCallbackMethod);
    procedure CallCallback(Down: integer; m: Message);
    procedure WndProc(var m: Message); override;
  end;

constructor TWndCallback.Create(Callback: TdwlKeyCallbackMethod);
begin
  inherited Create;
  CreateHandle(CreateParams.Create);
  OnKeyEvent := Callback;
end;

procedure TWndCallback.CallCallback(Down: integer; m: Message);
var
  Wnd, Key, Shift: integer;
begin
  Wnd := m.WParam.ToInt32();
  Key := LoWord(m.LParam.ToInt32());
  Shift := HiWord(m.LParam.ToInt32());
  if assigned(OnKeyEvent) then
    OnKeyEvent(Wnd, Down, Key, Shift);
end;

[System.Security.Permissions.PermissionSet
  (System.Security.Permissions.SecurityAction.Demand, Name = 'FullTrust')]

procedure TWndCallback.WndProc(var m: Message);
begin
  try
    case m.Msg of
      WM_DWLKEYDOWN:
        CallCallback(1, m);
      WM_DWLKEYUP:
        CallCallback(0, m);
    end;
    inherited WndProc(m);
  except
    // Just ignore it for now...
  end;
end;

var
  CallbackWnd: TWndCallback = nil;

procedure wlSetObjKeyCallback(Callback: TdwlKeyCallbackMethod; Flags: integer);
var
  KeyDown: integer;
  KeyUP: integer;
begin
  if not assigned(Callback) then
  begin
    if CallbackWnd <> nil then
      CallbackWnd.Free;
  end
  else
  begin
    if CallbackWnd = nil then
      CallbackWnd := TWndCallback.Create(Callback);
    KeyDown := 0;
    KeyUP := 0;
    if (Flags and kDownEvents > 0) then
      KeyDown := WM_DWLKEYDOWN;
    if (Flags and kUpEvents > 0) then
      KeyUP := WM_DWLKEYUP;
    wlSetKeyPostMessage(CallbackWnd.Handle.ToInt32, KeyDown, KeyUP);
  end;
end;
(*

  type
  TWndCallback = class(TObject)
  public
  Handle : _HWnd;
  OnKeyEvent: TdwlKeyCallbackMethod;
  constructor create;
  destructor destroy; override;
  procedure WNDProc(var Message: TMessage);
  end;


  constructor TWndCallback.create;
  begin
  inherited;
  Handle := AllocateHWnd(WNDProc);

  end;

  destructor TWndCallback.destroy;
  begin
  inherited;
  wlSetKeyPostMessage(0,0,0);
  DeallocateHWnd(Handle);
  end;

  type
  LOWORD = Word;

  function HiWord(L: LongWord): Word;
  begin
  Result := L shr 16;
  end;



  procedure TWndCallback.WNDProc(var Message: TMessage);
  begin
  With Message do
  case Message.Msg of
  WM_DWLKEYDOWN: OnKeyEvent(WParam,1,LOWORD(LParam), HIWORD(LPAram));
  WM_DWLKEYUP:   OnKeyEvent(WParam,0,LOWORD(LParam), HIWORD(LPAram));
  end;
  end;

  var
  CallbackWnd : TWndCallback = nil;


  procedure wlSetObjKeyCallback(Callback: TdwlKeyCallbackMethod;Flags: integer);
  var
  KeyDown : integer;
  KeyUP   : integer;

  begin
  if not assigned(Callback) then
  begin
  if CallbackWnd <> nil then
  CallbackWnd.Free;
  end
  else
  begin
  if CallbackWnd = nil then
  CallbackWnd := TWndCallback.create;
  CallbackWnd.OnKeyEvent := Callback;
  KeyDown := 0;
  KeyUp   := 0;
  if (Flags and  kDownEvents  > 0) then   KeyDown := WM_DWLKEYDOWN;
  if (Flags and  kUpEvents  > 0) then     KeyUp := WM_DWLKEYUP;
  wlSetKeyPostMessage(CallbackWnd.Handle,KeyDown,KeyUp);
  end;
  end;
*)
{$ELSE}
// ----------------------------------------------------------------------------
// Begin Delphi 5,6,7 Win32 source code
// ----------------------------------------------------------------------------

uses
  sysutils, dialogs, registry, Type_U;

const
  GINANAME = 'dwlgina2.dll';

var
  HookLib: integer = 0;
  GinaPath: string = '';

  pDisableItem: procedure(Key: integer; disable: integer)stdcall = nil;
  pIsItemDisabled: function(Item: integer): integer stdcall = nil;
  pVersion: function(RequestedVersion: integer): integer stdcall = nil;
  pDisableKey: function(window: HWND; vk, Modifiers: integer; disable: integer)
    : integer;
stdcall = nil;
pIsKeyDisabled :

function(window: HWND; vk: integer; Shift: integer): integer;
stdcall = nil;
pSetKeySendMessage :
  procedure(WindowHandle: HWND; KeyDownMessageID: integer;
    KeyUpMessageID: integer);
  stdcall = nil;
pSetKeyPostMessage :
    procedure(WindowHandle: HWND; KeyDownMessageID: integer;
      KeyUpMessageID: integer);
    stdcall = nil;
  pGetDisabledKey :
      function(i: integer; var window: HWND; var vk, Shift: integer): integer;
        stdcall;
    pSetKeyCallback :
        procedure(CallbackFunc: TdwlKeyCallbackFunc; UserData: integer;
          Flags: integer); stdcall;
      pInstallGina :
          function(Flags: integer): integer;
          stdcall = nil;
        pUninstallGina :
            function(Flags: integer): integer;
            stdcall = nil;
          pIsGinaInstalled :
              function: integer;
              stdcall = nil;
            pNeedGinaInstall :
                function: integer; stdcall;
              pIsNTSystem :
                  function: integer; stdcall;
                pExitWindows :
                    function(Flags: integer): integer stdcall;
                  pWinVersion :
                      function: integer; stdcall;
                    pGetKeyState :
                        function(Key: integer): integer; stdcall;
                      pSetKeyState :
                          procedure(Key: integer; TurnOn: integer); stdcall;
                        pRestoreAll :
                            procedure; stdcall;
                          pExit :
                              procedure; stdcall;
                            pIsAdmin :
                                function: integer; stdcall;
                              pEnableAutologin :
                                  procedure(DefUser: PChar; Pass: PChar;
                                    Enable: integer); stdcall;
                                pMapScancode :
                                    function(InputCode: integer;
                                      OutputCode: integer): integer; stdcall;
                                    // returns old mapping
                                  pDisableDesktopIcon :
                                      procedure(index: integer); stdcall;
                                    pDesktopIconCount :
                                        function: integer; stdcall;
                                      pRestoreDesktopIcons :
                                        procedure; stdcall;

                                        function wlGinaPath: string;
                                        begin
                                        Result := GinaPath;
                                        end;

                                        // pascal implemention of windows get classname method

                                        function GetClassName(Handle: _HWND)
                                        : string;
                                        var
                                        Buffer: array [0 .. 255] of Char;
                                        begin
                                        SetString
                                        (Result, Buffer, windows.GetClassName
                                        (Handle, Buffer, SizeOf(Buffer)))
                                        end;

                                        function GetProcAdr
                                        (hModule: hModule; lpProcName: LPCSTR)
                                        : FARPROC;
                                        begin
                                        Result := GetProcAddress
                                        (hModule, lpProcName);
                                        if Result = nil then
                                        raise exception.Create
                                        ('error: method not found:' +
                                        lpProcName);
                                        end;

                                        procedure dwlLoad;
                                        resourcestring
                                        MsgText = 'cannot load ';
                                        begin
                                        if HookLib > 0 then
                                        exit;

                                        GinaPath := '';
                                        HookLib := LoadLibrary(GINANAME);
                                        if HookLib = 0 then
                                        HookLib := -1;
                                        // user has canceled gina search

                                        if HookLib > 0 then
                                        begin
                                        pVersion := GetProcAdr
                                        (HookLib, 'wlVersion');
                                        pVersion(DWL_VERSION);
                                        pDisableItem := GetProcAdr
                                        (HookLib, 'wlDisableItem');
                                        pIsItemDisabled := GetProcAdr
                                        (HookLib, 'wlIsItemDisabled');
                                        pDisableKey := GetProcAdr
                                        (HookLib, 'wlDisableKey');
                                        pIsKeyDisabled := GetProcAdr
                                        (HookLib, 'wlIsKeyDisabled');
                                        pSetKeySendMessage := GetProcAdr
                                        (HookLib, 'wlSetKeySendMessage');
                                        pSetKeyPostMessage := GetProcAdr
                                        (HookLib, 'wlSetKeyPostMessage');
                                        pInstallGina := GetProcAdr
                                        (HookLib, 'wlInstallGina');
                                        pUninstallGina := GetProcAdr
                                        (HookLib, 'wlUninstallGina');
                                        pIsGinaInstalled := GetProcAdr
                                        (HookLib, 'wlIsGinaInstalled');
                                        pNeedGinaInstall := GetProcAdr
                                        (HookLib, 'wlNeedGinaInstall');
                                        pIsNTSystem := GetProcAdr
                                        (HookLib, 'wlIsNTSystem');
                                        pExitWindows := GetProcAdr
                                        (HookLib, 'wlExitWindows');
                                        pWinVersion := GetProcAdr
                                        (HookLib, 'wlWinVersion');
                                        pGetKeyState := GetProcAdr
                                        (HookLib, 'wlGetKeyState');
                                        pSetKeyState := GetProcAdr
                                        (HookLib, 'wlSetKeyState');
                                        pSetKeyCallback := GetProcAdr
                                        (HookLib, 'wlSetKeyCallback');
                                        pRestoreAll := GetProcAdr
                                        (HookLib, 'wlRestoreAll');
                                        pGetDisabledKey := GetProcAdr
                                        (HookLib, 'wlGetDisabledKey');
                                        pIsAdmin := GetProcAdr
                                        (HookLib, 'wlIsAdmin');
                                        pEnableAutologin := GetProcAdr
                                        (HookLib, 'wlEnableAutologin');
                                        pMapScancode := GetProcAdr
                                        (HookLib, 'wlMapScancode');
                                        pDisableDesktopIcon := GetProcAdr
                                        (HookLib, 'wlDisableDesktopIcon');
                                        pRestoreDesktopIcons := GetProcAdr
                                        (HookLib, 'wlRestoreDesktopIcons');
                                        pDesktopIconCount := GetProcAdr
                                        (HookLib, 'wlDesktopIconCount');
                                        pExit := GetProcAdr(HookLib, 'wlExit');
                                        end
                                        else
                                        begin
                                        if GetLastError <> 0 then
                                        MessageBox
                                        (Application.Handle, PChar
                                        (MsgText + GINANAME + #13#10 +
                                        SysErrorMessage(GetLastError)), PChar
                                        (MsgCaptionError), MB_OK + MsgType)
                                        else
                                        MessageBox
                                        (Application.Handle, PChar
                                        (MsgText + GINANAME), PChar
                                        (MsgCaptionError), MB_OK + MsgType);
                                        halt(1);
                                        end;
                                        end;

                                        procedure wlDisableItem
                                        (Item: integer; disable: integer);
                                        begin
                                        dwlLoad;
                                        pDisableItem(Item, disable);
                                        end;

                                        function wlDisableKey
                                        (window: HWND; vk, Modifiers: integer;
                                        disable: integer): integer;
                                        begin
                                        dwlLoad;
                                        Result := pDisableKey
                                        (window, vk, Modifiers, disable);
                                        end;

                                        function wlIsKeyDisabled
                                        (window: HWND; vk, Modifiers: integer)
                                        : integer;
                                        begin
                                        dwlLoad;
                                        Result := pIsKeyDisabled
                                        (window, vk, Modifiers);
                                        end;

                                        function wlIsItemDisabled(Item: integer)
                                        : integer;
                                        begin
                                        dwlLoad;
                                        Result := pIsItemDisabled(Item);
                                        end;

                                        procedure wlSetKeySendMessage
                                        (WindowHandle: HWND;
                                        KeyDownMessageID: integer;
                                        KeyUpMessageID: integer);
                                        begin
                                        dwlLoad;
                                        pSetKeySendMessage
                                        (WindowHandle, KeyDownMessageID,
                                        KeyUpMessageID);
                                        end;

                                        procedure wlSetKeyPostMessage
                                        (WindowHandle: HWND;
                                        KeyDownMessageID: integer;
                                        KeyUpMessageID: integer);
                                        begin
                                        dwlLoad;
                                        pSetKeyPostMessage
                                        (WindowHandle, KeyDownMessageID,
                                        KeyUpMessageID);
                                        end;

                                        function wlInstallGina(Flags: integer)
                                        : integer;
                                        begin
                                        dwlLoad;
                                        Result := pInstallGina(Flags);
                                        end;

                                        function wlUninstallGina(Flags: integer)
                                        : integer;
                                        begin
                                        dwlLoad;
                                        Result := pUninstallGina(Flags);
                                        end;

                                        function wlIsGinaInstalled: integer;
                                        begin
                                        dwlLoad;
                                        Result := pIsGinaInstalled;
                                        end;

                                        function wlIsNTSystem: integer;
                                        begin
                                        dwlLoad;
                                        Result := pIsNTSystem;
                                        end;

                                        function wlNeedGinaInstall: integer;
                                        begin
                                        dwlLoad;
                                        Result := pNeedGinaInstall;
                                        end;

                                        function wlVersion
                                        (RequestedVersion: integer): integer;
                                        begin
                                        dwlLoad;
                                        Result := pVersion(0);
                                        end;

                                        function wlExitWindows(Flags: integer)
                                        : integer;
                                        begin
                                        dwlLoad;
                                        Result := pExitWindows(Flags);
                                        end;

                                        function wlWinVersion: integer;
                                        begin
                                        dwlLoad;
                                        Result := pWinVersion;
                                        end;

                                        function wlGetKeyState(Key: integer)
                                        : integer;
                                        begin
                                        dwlLoad;
                                        Result := pGetKeyState(Key);
                                        end;

                                        procedure wlSetKeyState
                                        (Key: integer; TurnOn: integer);
                                        begin
                                        dwlLoad;
                                        pSetKeyState(Key, TurnOn);
                                        end;

                                        procedure wlSetKeyCallback
                                        (Callback: TdwlKeyCallbackFunc;
                                        Flags: integer);
                                        begin
                                        dwlLoad;
                                        pSetKeyCallback(Callback, 0, Flags);
                                        end;

                                        procedure wlSetObjKeyCallback
                                        (Callback: TdwlKeyCallbackMethod;
                                        Flags: integer);
                                        begin
                                        dwlLoad;
                                        with TMethod(Callback) do
                                        begin
                                        pSetKeyCallback
                                        (Code, integer(Data), Flags);
                                        end;
                                        end;

                                        function wlGetDisabledKey
                                        (i: integer; var window: HWND;
                                        var vk, Shift: integer): integer;
                                        begin
                                        dwlLoad;
                                        Result := pGetDisabledKey
                                        (i, window, vk, Shift);
                                        end;

                                        procedure wlRestoreAll;
                                        begin
                                        dwlLoad;
                                        pRestoreAll;
                                        end;

                                        procedure wlExit;
                                        begin
                                        dwlLoad;
                                        pExit;
                                        end;

                                        function wlIsAdmin: boolean;
                                        begin
                                        dwlLoad;
                                        Result := pIsAdmin <> 0;
                                        end;

                                        procedure wlEnableAutologin
                                        (DefUser: string; Pass: string;
                                        Enable: boolean);
                                        begin
                                        dwlLoad;
                                        if Enable then
                                        pEnableAutologin
                                        (PChar(DefUser), PChar(Pass), 1)
                                        else
                                        pEnableAutologin
                                        (PChar(DefUser), PChar(Pass), 0);
                                        end;

                                        function wlMapScancode
                                        (InputCode: integer;
                                        OutputCode: integer): integer;
                                        // returns old mapping
                                        begin
                                        dwlLoad;
                                        Result := pMapScancode
                                        (InputCode, OutputCode);
                                        end;

                                        procedure wlDisableDesktopIcon
                                        (index: integer);
                                        begin
                                        dwlLoad;
                                        pDisableDesktopIcon(index);
                                        end;

                                        function wlDesktopIconCount: integer;
                                        begin
                                        dwlLoad;
                                        Result := pDesktopIconCount;
                                        end;

                                        procedure wlRestoreDesktopIcons;
                                        begin
                                        dwlLoad;
                                        pRestoreDesktopIcons;
                                        end;

initialization

finalization

if HookLib > 0 then
  FreeLibrary(HookLib);
{$ENDIF}

end.
