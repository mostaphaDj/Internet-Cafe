program MyCafe_Server;

uses
  Forms,
  Controls,
  Windows,
  DataModuleBase_U in '..\Data Module\DataModuleBase_U.pas' { DataModuleBase: TDataModule },
  DataModuleImages_U in '..\Form ListView Post Client\List Image\DataModuleImages_U.pas' { DataModuleImages: TDataModule },
  Connexion_Module_U in '..\Connexion Module\Connexion_Module_U.pas' { Connexion_Module: TDataModule },
  Action_Module_U in '..\Action Module\Action_Module_U.pas' { Action_Module: TDataModule },
  Form_ListView_Post_Client_U in '..\Form ListView Post Client\Form_ListView_Post_Client_U.pas' { Form_ListView_Post_Client },
  Form_Main_U in '..\Form Main\Form_Main_U.pas' { Form_Main },
  Form_Payment_U in '..\Form Payment\Form_Payment_U.pas' { Form_Payment },
  Use_Ser_U in '..\..\Objects\Use\Use_Ser_U.pas',
  Use_Concerted_U in '..\..\Objects\Use\Use_Concerted_U.pas',
  User_Concerted_U in '..\..\Objects\User\User_Concerted_U.pas',
  Post_Client_Ser_U in '..\..\Objects\Post Client\Post_Client_Ser_U.pas',
  Post_Client_Concerted_U in '..\..\Objects\Post Client\Post_Client_Concerted_U.pas',
  Form_Change_Use_U in '..\Form Change Use\Form_Change_Use_U.pas' { Form_Change_Use },
  Frame_Cost_U in '..\..\Concerted\Frame Cost\Frame_Cost_U.pas' { Frame_Cost: TFrame },
  Round_U in '..\..\Objects\Round\Round_U.pas',
  User_Ser_U in '..\..\Objects\User\User_Ser_U.pas',
  Char_U in '..\..\Concerted\Char\Char_U.pas',
  Rate_U in '..\..\Objects\Rate\Rate_U.pas',
  Form_Demand_Use_U in '..\Form Demand Use\Form_Demand_Use_U.pas' { Form_Demand_Use },
  UnitObjets_Ser_U in '..\..\Objects\UnitObjets\UnitObjets_Ser_U.pas',
  Connexion_Ser_U in '..\..\Objects\Connexion\Connexion_Ser_U.pas',
  Connexion_Concerted_U in '..\..\Objects\Connexion\Connexion_Concerted_U.pas',
  Type_U in '..\..\Objects\Type\Type_U.pas',
  UnitObjets_Concerted_U in '..\..\Objects\UnitObjets\UnitObjets_Concerted_U.pas',
  Classes_U in '..\..\Objects\Classes\Classes Ser\Classes_U.pas',
  Use_Account_U in '..\..\Objects\Use\Use_Account_U.pas',
  FormOptions_U in '..\Form Options\FormOptions_U.pas' { FormOptions },
  FrameRound_U in '..\Form Options\Frames\FrameRound_U.pas' { FrameRound: TFrame },
  Frame_Limitation_Time_U in '..\..\Concerted\Frame Limitation Time\Frame_Limitation_Time_U.pas' { Frame_Limitation_Time: TFrame },
  Frame_Limitation_Time_Ser_U in '..\..\Concerted\Frame Limitation Time\Frame_Limitation_Time_Ser_U.pas' { Frame_Limitation_Time_Ser: TFrame },
  Frame_Cost_Ser_U in '..\..\Concerted\Frame Cost\Frame_Cost_Ser_U.pas' { Frame_Cost_Ser: TFrame },
  Form_Limitation_Time_Ser_U in '..\..\Concerted\Frame Limitation Time\Form_Limitation_Time_Ser_U.pas' { Form_Limitation_Time },
  FormDemandRecording_U in '..\Form Demand Recording\FormDemandRecording_U.pas' { FormDemandRecording },
  FrameOptionsConnexion_U in '..\..\Concerted\Frame Options Connexion\FrameOptionsConnexion_U.pas' { FrameOptionsConnexion: TFrame },
  DemandRegister_U in '..\Form Register\DemandRegister_U.pas' { FormDemandRegister },
  Frame_RegisterCustom2_U in '..\..\Concerted\Frames Recording\Frame_RegisterCustom2_U.pas' { Frame_RegisterCustom2: TFrame },
  Frame_RegisterCustom1_U in '..\..\Concerted\Frames Recording\Frame_RegisterCustom1_U.pas' { Frame_RegisterCustom1: TFrame },
  FormEnterPassWord_U in '..\..\Concerted\Form Enter PassWord_U\FormEnterPassWord_U.pas' { FormEnterPassWord },
  FormChangePassWord_U in '..\..\Concerted\Form Change PassWord\FormChangePassWord_U.pas' { FormChangePassWord };

{$R *.res}

Var
  ClassName : Array[0..255] of char;
  AppH : HWND;

begin
  Application.Initialize;
  Application.Title := 'StartMyCafeServer';
  GetClassName(Application.Handle, ClassName, 256);
  AppH := FindWindow(ClassName, 'MyCafeServer');
  if AppH = 0 then
  begin
    DataModuleBase := TDataModuleBase.Create(Application);
    FormEnterPassWord := TFormEnterPassWord.Create(Application);
    if FormEnterPassWord.ShowModal = mrOk then
    begin
//      Application.MainFormOnTaskbar := True; // Handel удпс ук
      Application.Title := 'MyCafeServer';
      Application.CreateForm(TForm_Main, Form_Main);
      Form_Main.Show;
      Application.ProcessMessages;
      Application.CreateForm(TAction_Module, Action_Module);
      Application.CreateForm(TConnexion_Module,Connexion_Module);
      Application.CreateForm(TDataModuleImages, DataModuleImages);
      Form_ListView_Post_Client.LeadAllPostsForDataBase;
      Application.Run;
    end
    else
      Application.Terminate;
  end
  else
  begin
    ShowWindow(AppH, SW_RESTORE);
    SetForegroundWindow(AppH);
    Application.Terminate;
  end;
end.
