object DataModuleBase: TDataModuleBase
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 466
  object Connection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=F:\Mo' +
      'stapha\Programation\Parject Seber Cafe\ClientServer\Data Base\Se' +
      'berCafe.mdb;Mode=Share Deny None;Extended Properties="";Persist ' +
      'Security Info=False;Jet OLEDB:System database="";Jet OLEDB:Regis' +
      'try Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type' +
      '=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bu' +
      'lk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Data' +
      'base Password="";Jet OLEDB:Create System Database=False;Jet OLED' +
      'B:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compact=' +
      'False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:S' +
      'FP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 16
    Top = 32
  end
  object DS_Use: TDataSource
    DataSet = Table_Use
    Left = 168
    Top = 56
  end
  object Table_Use: TADOTable
    Connection = Connection
    CursorType = ctStatic
    IndexFieldNames = 'pseudonymeUser'
    MasterFields = 'pseudonyme'
    MasterSource = DS_User
    TableName = 'Use'
    Left = 168
    Top = 8
    object Table_UsepseudonymeUser: TWideStringField
      FieldName = 'pseudonymeUser'
      Size = 255
    end
    object Table_UseHostName: TWideStringField
      FieldName = 'HostName'
      Size = 255
    end
    object Table_UseTimeStart: TDateTimeField
      FieldName = 'TimeStart'
    end
    object Table_UseTimeUse: TDateTimeField
      FieldName = 'TimeUse'
    end
    object Table_UseCostPayment: TBCDField
      FieldName = 'CostPayment'
      Precision = 19
    end
  end
  object Table_User: TADOTable
    Connection = Connection
    CursorType = ctStatic
    TableName = 'UserClient'
    Left = 232
    Top = 8
    object Table_Userpseudonyme: TWideStringField
      FieldName = 'pseudonyme'
      Size = 15
    end
    object Table_UserPrenom: TWideStringField
      FieldName = 'Prenom'
      Size = 15
    end
    object Table_UserNom: TWideStringField
      FieldName = 'Nom'
      Size = 15
    end
    object Table_UserPassword: TWideStringField
      FieldName = 'Password'
      Size = 15
    end
    object Table_UserN_Carte: TSmallintField
      FieldName = 'N_Carte'
    end
    object Table_UserEmail: TWideStringField
      FieldName = 'Email'
      Size = 30
    end
    object Table_UserAdresse: TMemoField
      FieldName = 'Adresse'
      BlobType = ftMemo
    end
    object Table_UserDateNescience: TDateTimeField
      FieldName = 'DateNescience'
    end
    object Table_UserComputation: TBCDField
      FieldName = 'Computation'
      Precision = 19
    end
    object Table_UserDate_Register: TDateTimeField
      FieldName = 'Date_Register'
    end
    object Table_UserN_mobile: TSmallintField
      FieldName = 'N_mobile'
    end
    object Table_UserNiveau_Informatique: TWideStringField
      FieldName = 'Niveau_Informatique'
      Size = 255
    end
    object Table_UserVocation: TWideStringField
      FieldName = 'Vocation'
      Size = 255
    end
    object Table_UserRemark: TMemoField
      FieldName = 'Remark'
      BlobType = ftMemo
    end
    object Table_UserRate: TWideStringField
      FieldName = 'rate'
      Size = 255
    end
    object Table_UserLogOn: TBooleanField
      FieldName = 'LogOn'
    end
    object Table_UserSexe: TBooleanField
      FieldName = 'Sexe'
    end
  end
  object DS_User: TDataSource
    DataSet = Table_User
    Left = 232
    Top = 56
  end
  object Table_Post_Client: TADOTable
    Connection = Connection
    CursorType = ctStatic
    TableName = 'PostClient'
    Left = 88
    Top = 8
    object Table_Post_ClientHostName: TWideStringField
      FieldName = 'HostName'
      Size = 255
    end
    object Table_Post_ClientTimeStart: TDateTimeField
      FieldName = 'TimeStart'
    end
  end
  object DS_Post_Client: TDataSource
    DataSet = Table_Post_Client
    Left = 88
    Top = 56
  end
  object Table_Rate: TADOTable
    Connection = Connection
    CursorType = ctStatic
    IndexFieldNames = 'NameRate'
    MasterFields = 'rate'
    MasterSource = DS_User
    TableName = 'Rate'
    Left = 296
    Top = 8
    object Table_RateNameRate: TWideStringField
      FieldName = 'NameRate'
      Size = 255
    end
    object Table_RatePriceHour: TBCDField
      FieldName = 'PriceHour'
      Precision = 19
    end
  end
  object DS_Rate: TDataSource
    DataSet = Table_Rate
    Left = 296
    Top = 56
  end
  object DS_Autorisations: TDataSource
    DataSet = Table_Autorisations
    Left = 384
    Top = 56
  end
  object Table_Autorisations: TADOTable
    Connection = Connection
    CursorType = ctStatic
    IndexFieldNames = 'Pseudonyme'
    MasterFields = 'pseudonyme'
    MasterSource = DS_User
    TableName = 'Autorisations'
    Left = 384
    Top = 8
    object Table_AutorisationsPseudonyme: TWideStringField
      FieldName = 'Pseudonyme'
      Size = 15
    end
    object Table_AutorisationsRegistration: TBooleanField
      FieldName = 'Registration'
    end
  end
end
