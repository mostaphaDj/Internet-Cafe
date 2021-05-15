unit Classes_U;

interface

uses UnitObjets_Cli_U, Post_Client_Cli_U, User_Cli_U, Use_Cli_U,
  Connexion_Cli_U;

// ����� ������ ����� �������
// �� ��� ������ ��� ����� �� ����������

type
  TUnitObjets = TUnitObjets_Cli;
  TPost_Client = TPost_Client_Cli;
  TUser = TUser_Cli;
  TUse = TUse_Cli;
  TConnexion = TConnexion_Cli;

var
  UnitObjets_Active: TUnitObjets;
  Administrator : TUser;

implementation

end.
