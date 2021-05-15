object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 130
  Width = 266
  object Table_User: TADOTable
    Connection = Connection
    CursorType = ctStatic
    TableName = 'UserClient'
    Left = 88
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
    Left = 88
    Top = 56
  end
  object Table_Autorisations: TADOTable
    Connection = Connection
    CursorType = ctStatic
    IndexFieldNames = 'Pseudonyme'
    MasterFields = 'pseudonyme'
    MasterSource = DS_User
    TableName = 'Autorisations'
    Left = 176
    Top = 8
    object Table_AutorisationsPseudonyme: TWideStringField
      FieldName = 'Pseudonyme'
      Size = 15
    end
    object Table_AutorisationsRegistration: TBooleanField
      FieldName = 'Registration'
    end
  end
  object DS_Autorisations: TDataSource
    DataSet = Table_Autorisations
    Left = 176
    Top = 56
  end
  object Connection: TADOConnection
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 8
  end
  object OpenDialog1: TOpenDialog
    FileName = 'Data\SeberCafe.mdb'
    Filter = 'Data Base|SeberCafeClient.mdb'
    Left = 24
    Top = 56
  end
end
