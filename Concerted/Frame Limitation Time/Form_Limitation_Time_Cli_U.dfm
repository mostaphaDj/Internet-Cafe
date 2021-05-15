object Form_Limitation_Time: TForm_Limitation_Time
  Left = 214
  Top = 140
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Form_Limitation_Time'
  ClientHeight = 299
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 178
    Top = 236
    Width = 63
    Height = 13
    Caption = #1575#1604#1605#1576#1604#1594' '#1575#1604#1605#1583#1601#1608#1593
  end
  object Button1: TButton
    Left = 166
    Top = 266
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 247
    Top = 266
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = Button2Click
  end
  inline Frame_Limitation_Time: TFrame_Limitation_Time_Cli
    Left = 0
    Top = -1
    Width = 330
    Height = 250
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    ExplicitTop = -1
  end
end
