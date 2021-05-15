unit User_Ser_U;

interface

uses Forms, windows, Controls, IdSchedulerOfThread,
  User_Concerted_U, Type_U;

type
  TUser_Ser = class(TUser_Concerted)
  private

  public
    constructor Create(VUnitObjects: TObject; VPseudonyme: string = '');
      override;
    // class function Recording(VRUser: TRecordUser; VConnexion: TObject)
    // : Boolean; override; // تسجيل (إنشاء حساب جديد)
    class function UsernameExists(VUsername: string): Boolean; override;
    // التحقق من توفر اسم المستخدم
    class function CheckPassword(VUsername: string; VPassword: string)
      : Boolean; override; // التحقق من صحة كلمة المرور
    class function IsAdministrator(VUsername: string): Boolean; override;
    class procedure Demand_Use(VUsername: string; TimeDesired: TTime;
      VUnitObjets: TObject); override; // طلب  الإتصال
    procedure CreateUser;
    function LoadRecord(VPseudonyme: string): Boolean;
    // تحميل المعلومات من قواعد البيانات
    procedure ShowFormDemandUse;
    class Function GetPriceHour(VPseudonyme: String): Currency;
    destructor Destroy; override;
  end;

implementation

uses SysUtils,
  Form_Demand_Use_U, Classes_U,
  UnitObjets_Concerted_U, Post_Client_Concerted_U, Use_Concerted_U,
  Connexion_Module_U, DataModuleBase_U;

{ TUser_Ser }

constructor TUser_Ser.Create(VUnitObjects: TObject; VPseudonyme: string = '');
begin
  inherited;
  with DataModuleBase do
  begin
    if FPseudonyme = '' then // المستخدم مجهول
    begin
      FPseudonyme := Unknown;
      FRate := Common;
      FComputation := 0;
    end
    else
      LoadRecord(FPseudonyme);
  end;
end;

procedure TUser_Ser.ShowFormDemandUse;
resourcestring
  String_Message_Demand_Use_refusal = 'خطأ في الإتصال لايمكن إكمال العملية';
begin
  Form_Demand_Use := TForm_Demand_Use.Create(Application);
  with Form_Demand_Use do
  begin
    NxButtonItemPoste.Value := TUnitObjets(FUnitObjets).Post_Client.HostName;
    NxButtonItemUser.Value := FName + ' ' + FPrename + ' | ' + FPseudonyme;
    NxButtonItemTimeDesired.Value := TimeToStr
      (TUnitObjets(FUnitObjets).Use.TimeDesired);
  end;
  if Form_Demand_Use.ShowModal = mrOk then
  begin
    TUnitObjets(FUnitObjets).Use.Start;
  end
  else
  begin
    TUnitObjets(FUnitObjets).Use.Free;
    TUnitObjets(FUnitObjets).Use := nil;
    TUnitObjets(FUnitObjets).User.Free;
    TUnitObjets(FUnitObjets).User := nil;
    try
      with TUnitObjets(FUnitObjets).Connexion, IdTCPClient.IOHandler do
      begin
        if IdTCPClient.Connected then
          Write(Cmd_DemandUserefusal) // لفض طلب الجلسة
        else
          MessageBox(Application.Handle, PChar(MsgNotConnected), PChar
              (MsgCaptionError), MsgType);
      end;
    except
      on E: Exception do
      begin
        MessageBox(Application.Handle, PChar
            (String_Message_Demand_Use_refusal + #13 + E.Message), PChar
            (MsgCaptionError), MsgType);
      end;
    end;
  end;
  FreeAndNil(Form_Demand_Use);
end;

function TUser_Ser.LoadRecord(VPseudonyme: string): Boolean;
// تحميل المعلومات من قواعد البيانات
begin
  Result := False;
  with DataModuleBase do
  begin
    if Table_User.Locate('Pseudonyme', VPseudonyme, []) then
    begin
      try
        FPseudonyme := Table_Userpseudonyme.Value; // إسم  الدخول
        FPrename := Table_UserPrenom.Value; // إسم المستعمل
        FRate := Table_UserRate.Value; // تصنيف الزبون
        FName := Table_UserNom.Value; // إسم العئلة
        FSexe := Table_UserSexe.Value; // الجنس
        FPassword := Table_UserPassword.Value; // كلمة المرور
        FN_Carte := Table_UserN_Carte.Value; // رقم بطاقة التعريف الوطني
        FEmail := Table_UserEmail.Value; // البريد الإلكتروني
        FAdresse := Table_UserAdresse.Value; // العنوان
        FDateNescience := Table_UserDateNescience.Value; // تاريخ الميلاد
        FComputation := Table_UserComputation.Value; // الرصيد أو الدين
        FDate_Register := Table_UserDate_Register.Value; // تاريخ التسجيل
        FN_mobile := Table_UserN_mobile.Value; // الهاتف الجوال
        FNiveau_Informatique := Table_UserNiveau_Informatique.Value;
        // الوستوى في الإعلام الآلي
        FVocation := Table_UserVocation.Value; // ; //   المهنة
        FRemark := Table_UserRemark.Value; // ملاحضة عن الزبون
      finally
        Result := True;
      end;
    end;
    if Table_Autorisations.Locate('Pseudonyme', VPseudonyme, []) then
    begin
      FAutorisations := TAutorisations.Create;
      FAutorisations.Registration := Table_AutorisationsRegistration.Value;

    end;

  end;
end;

class procedure TUser_Ser.Demand_Use(VUsername: string; TimeDesired: TTime;
  VUnitObjets: TObject);
begin
  // inherited;
  TUnitObjets(VUnitObjets).User := TUser.Create
    (TUnitObjets(VUnitObjets), VUsername);
  TUnitObjets(VUnitObjets).Use := TUse.Create(TUnitObjets(VUnitObjets));
  TUnitObjets(VUnitObjets).Use.TimeDesired := TimeDesired;
  TIdYarnOfThread(TUnitObjets(VUnitObjets).Connexion.AIdContext.Yarn)
    .Thread.Synchronize(TUser(TUnitObjets(VUnitObjets).User).ShowFormDemandUse);
end;

destructor TUser_Ser.Destroy;
begin

  inherited;
end;

procedure TUser_Ser.CreateUser;
resourcestring
  String_MessageUserCreate = 'تعذر الإتصال بالمخدم';
var
  VRecordUser: TRecordUser;
  VRecordAutorisations: TRecordAutorisations;
begin
  // **************************VRecordAutorisations**************************************************
  try
    with TUnitObjets(UnitObjets).Connexion, IdTCPClient.IOHandler do
    begin
      if IdTCPClient.Connected then
      begin
        Write(Cmd_CreateUser);
        VRecordUser := RecordUser;
        WriteBuffer(VRecordUser, SizeOf(VRecordUser));
        if Assigned(FAutorisations) then
        begin
          WriteLn('AsAdministrator');
          VRecordAutorisations := FAutorisations.RecordAutorisations;
          WriteBuffer(VRecordUser, SizeOf(VRecordAutorisations));
        end
        else
          WriteLn('Not');
      end
      else
        MessageBox(Application.Handle, PChar(MsgNotConnected), PChar
            (MsgCaptionError), MsgType);
    end;
  except
    on E: Exception do
    begin
      MessageBox(Application.Handle, PChar
          (String_MessageUserCreate + #13 + E.Message), PChar(MsgCaptionError),
        MsgType);
    end;
  end;
end;

// class function TUser_Ser.Recording(VRUser: TRecordUser; VConnexion: TObject)
// : Boolean;
// begin
// // inherited Recording(VRUser, VConnexion); ;
// try
// with DataModuleBase do
// begin
// Table_User.Insert;
// Table_Userpseudonyme.Value := VRUser.pseudonyme; // إسم  الدخول
// Table_UserPrenom.Value := VRUser.Prename; // إسم المستعمل
// Table_UserRate.Value := VRUser.Rate; // تصنيف الزبون
// Table_UserNom.Value := VRUser.Name; // إسم العئلة
// Table_UserSexe.Value := VRUser.Sexe; // الجنس
// Table_UserPassword.Value := VRUser.Password; // كلمة المرور
// Table_UserN_Carte.Value := VRUser.N_Carte; // رقم بطاقة التعريف الوطني
// Table_UserEmail.Value := VRUser.Email; // البريد الإلكتروني
// Table_UserAdresse.Value := VRUser.Adresse; // العنوان
// Table_UserDateNescience.Value := VRUser.DateNescience; // تاريخ الميلاد
// Table_UserComputation.Value := VRUser.Computation; // الرصيد أو الدين
// Table_UserDate_Register.Value := VRUser.Date_Register; // تاريخ التسجيل
// Table_UserN_mobile.Value := VRUser.N_mobile; // الهاتف الجوال
// Table_UserNiveau_Informatique.Value := VRUser.Niveau_Informatique;
// // الوستوى في الإعلام الآلي
// Table_UserVocation.Value := VRUser.Vocation; // ; //   المهنة
// Table_UserRemark.Value := VRUser.Remark; // ملاحضة عن الزبون
// Table_User.Post;
// end;
// finally
// end;
// end;

class function TUser_Ser.UsernameExists(VUsername: string): Boolean;
// التحقق من توفر اسم المستخدم
begin
  // inherited UsernameExists(VUsername, VConnexion);
  if DataModuleBase.Table_User.Locate('Pseudonyme', VUsername, []) then
    // التحقق من إسم المستعمل
    Result := True
  else
    Result := False;
end;

class function TUser_Ser.CheckPassword(VUsername: string; VPassword: string)
  : Boolean; // التحقق من صحة كلمة المرور
begin
  // inherited CheckPassword(VUsername, VPassword, VConnexion);
  Result := False;
  with DataModuleBase do
    if Table_User.Locate('Pseudonyme', VUsername, []) then
      if Table_User.FieldByName('Password').AsString = VPassword then
        Result := True;
end;

class Function TUser_Ser.GetPriceHour(VPseudonyme: String): Currency;
resourcestring
  String_Message_Demand_Use_refusal = 'خطأ في الإتصال لايمكن إكمال العملية';
begin
  inherited;
  with DataModuleBase do
    if Table_User.Locate('pseudonyme', VPseudonyme, []) then
      if Table_Rate.Locate('NameRate', Table_UserRate.Value, []) then
        Result := Table_RatePriceHour.Value;
end;

class function TUser_Ser.IsAdministrator(VUsername: string): Boolean;
begin
  inherited;
  Result := False;
  with DataModuleBase do
    if Table_User.Locate('Pseudonyme', VUsername, []) then
      if Table_Autorisations.Locate('Pseudonyme', VUsername, []) then
        Result := True;
end;

end.
