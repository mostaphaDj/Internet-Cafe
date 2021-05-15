object Form_Limitation_Time: TForm_Limitation_Time
  Left = 214
  Top = 140
  BorderStyle = bsDialog
  Caption = 'Form_Limitation_Time_Ser'
  ClientHeight = 282
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inline Frame_Limitation_Time: TFrame_Limitation_Time_Ser
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
  object Button2: TButton
    Left = 247
    Top = 251
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object Button1: TButton
    Left = 166
    Top = 251
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
    OnClick = Button1Click
  end
end
