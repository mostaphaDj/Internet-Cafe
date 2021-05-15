unit Form_Lock_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, dwlCore_U;

type
  TForm_Lock = class(TForm)
    Panel1: TPanel;
    Timer_TimeHelleniste: TTimer;
    TimerMouseMove: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Timer_TimeHellenisteTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerMouseMoveTimer(Sender: TObject);
    procedure WinLockKeyDown(ReceivingWnd: HWND; Key: Word; Shift: TShiftState);
    procedure WinLockMouseDown(ReceivingWnd: HWND; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { DÈclarations privÈes }
    // procedure MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure DisableTaskMgr(bTF: Boolean);
    function MouseMoveEnough: Boolean; // ·„·«Õ÷… √Ì Õ—ﬂ… ⁄·Ï „ƒ‘— «·›√—…
  public
    { DÈclarations publiques }
    Time_Helleniste: Integer; { «·Êﬁ  «„” €—ﬁﬁ „‰  Êﬁ› «·›√—… Ê·ÊÕ… «·„›« ÌÕ }
    class procedure Lock_Windows;
    procedure UnLock_Windows;
  end;

var
  Form_Lock: TForm_Lock;
  Number_Move: Byte;
  Active_Mettre_en_veille: Boolean;

implementation

uses Registry, Form_Main_U,
  Form_Welcoming_U, Classes_U,
   Frame_Cost_Cli_U;
{$R *.dfm}

var
  delai_Hide_Form_Mot_Passe { „œ… ﬁ»·… «Œ›«¡ ‰«›–…  ﬂ·„… «·„—Ê— } ,
    delai_Mettre_en_veille { „œ… ﬁ»· Ê÷⁄ «·≈” ⁄œ«œ } , Delai_ShutDown: Integer;
  // „Â·… ﬁ»· ≈ﬁ«› «· ‘€Ì·
  MouseCursorPosX, MouseCursorPosY: Integer;

class procedure TForm_Lock.Lock_Windows;
begin
if Assigned(Form_Main) then
  Form_Main.Frame_Cost_Cli1.Stop;
  Application.ShowMainForm:=False;
  Form_Lock := TForm_Lock.Create(Application);
  Form_Lock.Show;
end;

procedure TForm_Lock.UnLock_Windows;
begin
  if Form_Welcoming <> nil then
  begin
    Form_Welcoming.Close;
  end;
  Form_Lock.Close;
  Form_Main.Show;
  if not UnitObjets_Active.User.IsAdministrator then
  Form_Main.Frame_Cost_Cli1.Start;
  FreeAndNil(Form_Lock);
end;

function TForm_Lock.MouseMoveEnough: Boolean; // ·„·«Õ÷… √Ì Õ—ﬂ… ⁄·Ï „ƒ‘— «·›√—…
begin
  if (Mouse.CursorPos.X <> MouseCursorPosX) or
    (Mouse.CursorPos.Y <> MouseCursorPosY) then
  begin
    if Number_Move > 30 then
    begin
      Result := True;
      Number_Move := 0;
    end
    else
    begin
      Result := False;
      Number_Move := Number_Move + 1;
    end;
  end
  else
    Result := False;
  MouseCursorPosX := Mouse.CursorPos.X;
  MouseCursorPosY := Mouse.CursorPos.Y;
end;

procedure TForm_Lock.DisableTaskMgr(bTF: Boolean);
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;

  reg.OpenKey('Software', True);
  reg.OpenKey('Microsoft', True);
  reg.OpenKey('Windows', True);
  reg.OpenKey('CurrentVersion', True);
  reg.OpenKey('Policies', True);
  reg.OpenKey('System', True);

  if bTF = True then
  begin
    reg.WriteString('DisableTaskMgr', '1');
  end
  else if bTF = False then
  begin
    reg.DeleteValue('DisableTaskMgr');
  end;
  reg.CloseKey;
end;

procedure TForm_Lock.FormCreate(Sender: TObject);
begin
  MouseCursorPosX := Mouse.CursorPos.X;
  MouseCursorPosY := Mouse.CursorPos.Y;

  Time_Helleniste := 0;
  delai_Hide_Form_Mot_Passe := 30;
  delai_Mettre_en_veille := 60;
  Delai_ShutDown := 120;
  // **************************  LockWindows; **************************
  // DisableTaskMgr(true); // ⁄ÿÌ· «œ«—… «·„Â«„
  // wlDisableItem(wlDesktop, 1); //  ⁄ÿÌ· √ÌﬁÊ‰«  ”ÿÕ «·„ﬂ »
  // wlDisableItem(wlTaskBar, 1); // ⁄ÿÌ· ‘—Ìÿ «·„Â«„

  //  ⁄ÿÌ· «·„› ÌÕ
  // wlDisableKey(0, VK_TAB, MOD_ALT, 1);
  // wlDisableKey(0, VK_ESCAPE, MOD_ALT, 1);
  // wlDisableKey(0, VK_F4, MOD_ALT, 1);
  // wlDisableKey(0, 0, MOD_WIN, 1);
  // wlDisableKey(0, VK_ESCAPE, MOD_CONTROL, 1);
  /// *******************************************
  Frame_Cost_Cli.Free;
  // Post_Client_Active.Use.Free;
end;

procedure TForm_Lock.Panel1Click(Sender: TObject);
begin
  Close;
  FreeAndNil(Self);
end;

procedure TForm_Lock.Timer_TimeHellenisteTimer(Sender: TObject);
begin
  Time_Helleniste := Time_Helleniste + 1;

  if Time_Helleniste >= Delai_ShutDown then
  begin
    // _ExitWindows(EWX_POWEROFF or EWX_FORCE);
  end
  else
  begin
    if (Time_Helleniste >= delai_Mettre_en_veille) and
      (not Active_Mettre_en_veille) then
    begin
      // SendMessage(Application.Handle, WM_SYSCOMMAND,  SC_MONITORPOWER, 1);
      Active_Mettre_en_veille := True;
    end
    else
    begin
      if (Time_Helleniste >= delai_Hide_Form_Mot_Passe) and
        (Form_Welcoming <> nil) then
      begin
        // Form_Welcoming.ModalResult := mrCancel;
      end;
    end;
  end;

end;

procedure TForm_Lock.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  wlRestoreAll;
  DisableTaskMgr(False); // «—Ã«⁄ «œ«—… „Â«„
  Form_Main.Show;
end;

procedure TForm_Lock.TimerMouseMoveTimer(Sender: TObject);

  function ActiveCaption: string;
  var
    Handle: THandle;
    Len: LongInt;
    Title: string;
  begin
    Result := '';
    Handle := GetForegroundWindow;
    if Handle <> 0 then
    begin
      Len := GetWindowTextLength(Handle) + 1;
      SetLength(Title, Len);
      GetWindowText(Handle, PChar(Title), Len);
      ActiveCaption := TrimRight(Title);
    end;
  end;

var
  H: HWND;
begin
  // ************************** ·≈€·«ﬁ √Ì ‰«›–… ‰‘ÿ… ›Êﬁ… ‰«›–… Lock *************
  // H := FindWindow(nil, pchar(ActiveCaption));
  // if (H <> 0) and (ActiveCaption <> 'Form_Lock_Windows')
  // and (ActiveCaption <> 'Form_Entrer_Mot_Passe')
  // and (ActiveCaption <> 'Client') then
  // PostMessage(H, WM_CLOSE, 0, 0);

  // **************** ·≈÷Â«— ‰«›–… «·≈” ﬁ»«· ⁄‰œ  Õ—Ìﬂ «·›√—… *********************
  if (MouseMoveEnough) and (Form_Welcoming = nil) then
  begin
    Active_Mettre_en_veille := False;
    Form_Lock.Time_Helleniste := 0;
    Form_Welcoming := TForm_Welcoming.Create(Application);
    if UnitObjets_Active.Connexion.IdTCPClient.Connected then
    begin
      Form_Welcoming.ShowModal;
    end
    else
    begin
      Form_Welcoming.Notebook1.ActivePage := 'Page_Password2';
      Form_Welcoming.ShowModal;
    end;

    FreeAndNil(Form_Welcoming);
  end
end;

procedure TForm_Lock.WinLockKeyDown(ReceivingWnd: HWND; Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close
  else if Form_Welcoming = nil then
  begin
    Form_Welcoming := TForm_Welcoming.Create(Application);
    Form_Welcoming.ShowModal;
    FreeAndNil(Form_Welcoming);
  end
  else
  begin
    Form_Lock.Time_Helleniste := 0;
  end;
end;

procedure TForm_Lock.WinLockMouseDown(ReceivingWnd: HWND; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Form_Welcoming = nil then
  begin
    Form_Welcoming := TForm_Welcoming.Create(Application);
    Form_Welcoming.ShowModal;
    FreeAndNil(Form_Welcoming);
  end
  else
    Form_Lock.Time_Helleniste := 0;
end;

end.
