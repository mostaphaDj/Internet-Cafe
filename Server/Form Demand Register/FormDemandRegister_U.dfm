object FormDemandRegister: TFormDemandRegister
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'FormDemandRegister'
  ClientHeight = 539
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonCancel: TButton
    Left = 248
    Top = 506
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object ButtonOK: TButton
    Left = 167
    Top = 506
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = ButtonOKClick
  end
  object CheckBox1: TCheckBox
    Left = 10
    Top = 510
    Width = 130
    Height = 17
    Caption = #1593#1583#1605' '#1575#1604#1587#1572#1575#1604' '#1605#1585#1577' '#1579#1575#1606#1610#1577
    TabOrder = 4
    Visible = False
  end
  inline Frame_RegisterCustom11: TFrame_RegisterCustom1
    Left = 0
    Top = 0
    Width = 330
    Height = 250
    TabOrder = 0
  end
  inline Frame_RegisterCustom21: TFrame_RegisterCustom2
    Left = 0
    Top = 250
    Width = 330
    Height = 250
    TabOrder = 1
    ExplicitTop = 250
    inherited Image5: TImage
      Visible = False
    end
  end
  object Table_User: TADOTable
    Connection = DataModuleBase.Connection
    CursorType = ctStatic
    TableName = 'UserClient'
    Left = 288
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
    object Table_UserSexe: TBooleanField
      FieldName = 'Sexe'
    end
    object Table_UserRate: TWideStringField
      FieldName = 'Rate'
      Size = 255
    end
    object Table_UserComputation: TBCDField
      FieldName = 'Computation'
      Precision = 19
    end
  end
  object DS_User: TDataSource
    DataSet = Table_User
    Left = 288
    Top = 56
  end
end
