unit Classes_U;

interface

uses UnitObjets_Ser_U, Post_Client_Ser_U, User_Ser_U, Use_Ser_U,
  Connexion_Ser_U;

// ÊÕÑíÍ ÈÇÓãÇÁ ÌÏíÏÉ ááÇÕäÇİ
// ãä ÇÌá ÇÓÊÚÇá äİÓ ÇáßæÏ İí ÇáÈÑäÇãÌíä

type
  TUnitObjets = TUnitObjets_Ser;
  TPost_Client = TPost_Client_Ser;
  TUser = TUser_Ser;
  TUse = TUse_Ser;
  TConnexion = TConnexion_Ser;

var
  ListUnitObjets: TListUnitObjets;
  UnitObjets_Active: TUnitObjets;
  Administrator : TUser;

implementation

end.
