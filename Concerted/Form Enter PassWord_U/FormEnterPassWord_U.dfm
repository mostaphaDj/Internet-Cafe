object FormEnterPassWord: TFormEnterPassWord
  Left = 245
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Password Dialog'
  ClientHeight = 202
  ClientWidth = 414
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 177
    Top = 116
    Width = 79
    Height = 13
    Caption = 'Enter password:'
  end
  object labelUsername: TLabel
    Left = 177
    Top = 70
    Width = 77
    Height = 13
    Caption = 'Enter Username'
  end
  object EditPassword: TEdit
    Left = 177
    Top = 135
    Width = 217
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object OKBtn: TButton
    Left = 239
    Top = 167
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 319
    Top = 167
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object EditUsername: TEdit
    Left = 177
    Top = 89
    Width = 217
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
end
