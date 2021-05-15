program MyCafe_Client;

uses
  Forms,
  Form_Main_U in '..\Form Main\Form_Main_U.pas' {Form_Main},
  Form_Lock_U in '..\Form Lock\Form_Lock_U.pas' {Form_Lock},
  dwlCore_U in '..\Form Lock\dwlCore_U.pas',
  Connexion_Module_U in '..\Connexion Module\Connexion_Module_U.pas' {Connexion_Module: TDataModule},
  Use_Concerted_U in '..\..\Objects\Use\Use_Concerted_U.pas',
  User_Concerted_U in '..\..\Objects\User\User_Concerted_U.pas',
  Post_Client_Concerted_U in '..\..\Objects\Post Client\Post_Client_Concerted_U.pas',
  Post_Client_Cli_U in '..\..\Objects\Post Client\Post_Client_Cli_U.pas',
  Miscellany_U in '..\Miscellany\Miscellany_U.pas',
  Round_U in '..\..\Objects\Round\Round_U.pas',
  Use_Cli_U in '..\..\Objects\Use\Use_Cli_U.pas',
  Frame_Password_U in '..\..\Concerted\Frame Password\Frame_Password_U.pas' {Frame_Password: TFrame},
  Frame_Limitation_Time_U in '..\..\Concerted\Frame Limitation Time\Frame_Limitation_Time_U.pas' {Frame_Limitation_Time: TFrame},
  Char_U in '..\..\Concerted\Char\Char_U.pas',
  User_Cli_U in '..\..\Objects\User\User_Cli_U.pas',
  Form_Welcoming_U in '..\..\Concerted\Form Welcoming\Form_Welcoming_U.pas' {Form_Welcoming},
  Server_U in '..\..\Objects\Server\Server_U.pas',
  Frame_Cost_U in '..\..\Concerted\Frame Cost\Frame_Cost_U.pas' {Frame_Cost: TFrame},
  Connexion_Concerted_U in '..\..\Objects\Connexion\Connexion_Concerted_U.pas',
  UnitObjets_Cli_U in '..\..\Objects\UnitObjets\UnitObjets_Cli_U.pas',
  Connexion_Cli_U in '..\..\Objects\Connexion\Connexion_Cli_U.pas',
  UnitObjets_Concerted_U in '..\..\Objects\UnitObjets\UnitObjets_Concerted_U.pas',
  Classes_U in '..\..\Objects\Classes\Classes Cli\Classes_U.pas',
  Form_Monition_U in '..\Form Monition\Form_Monition_U.pas' {Form_Monition},
  Use_Account_U in '..\..\Objects\Use\Use_Account_U.pas',
  SearchConnections_U in '..\..\Concerted\Conect Thead\SearchConnections_U.pas',
  Frame_Limitation_Time_Cli_U in '..\..\Concerted\Frame Limitation Time\Frame_Limitation_Time_Cli_U.pas' {Frame_Limitation_Time_Cli: TFrame},
  Frame_Password2_U in '..\Frame Password2\Frame_Password2_U.pas' {Frame_Password2: TFrame},
  Type_U in '..\..\Objects\Type\Type_U.pas',
  Frame_Cost_Cli_U in '..\..\Concerted\Frame Cost\Frame_Cost_Cli_U.pas' {Frame_Cost_Cli: TFrame},
  Form_Limitation_Time_Cli_U in '..\..\Concerted\Frame Limitation Time\Form_Limitation_Time_Cli_U.pas' {Form_Limitation_Time},
  DataModuleImages_U in '..\Data Module Image\DataModuleImages_U.pas' {DataModuleImages: TDataModule},
  Frame_RegisterCustom1_U in '..\..\Concerted\Frames Register\Frame_RegisterCustom1_U.pas' {Frame_RegisterCustom1: TFrame},
  Frame_RegisterCustom2_U in '..\..\Concerted\Frames Register\Frame_RegisterCustom2_U.pas' {Frame_RegisterCustom2: TFrame},
  Frame_Register3_U in '..\..\Concerted\Frames Register\Frame_Register3_U.pas' {Frame_Register3: TFrame},
  Frame_Register1_U in '..\..\Concerted\Frames Register\Frame_Register1_U.pas' {Frame_Register1: TFrame},
  Frame_Register2_U in '..\..\Concerted\Frames Register\Frame_Register2_U.pas' {Frame_Register2: TFrame},
  Frame_Demand_Use_U in '..\..\Concerted\Frames Register\Frame_Demand_Use_U.pas' {Frame_Demand_Use: TFrame},
  Tools_U in '..\..\Concerted\Tools_U.pas',
  DataModule_U in '..\Data Module\DataModule_U.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  TForm_Lock.Lock_Windows;
  Application.ProcessMessages;
  Application.Title := 'My Cafe Client';
  Application.CreateForm(TForm_Main, Form_Main);
  Application.ShowMainForm:=False;
  Connexion_Module := TConnexion_Module.Create(Application);
  DataModuleImages := TDataModuleImages.Create(Application);
  DataModule1 := TDataModule1.Create(Application);
  Application.Run;
end.

