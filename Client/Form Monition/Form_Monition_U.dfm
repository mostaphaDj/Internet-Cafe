object Form_Monition: TForm_Monition
  Left = 333
  Top = 266
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Form_Monition'
  ClientHeight = 129
  ClientWidth = 235
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 48
    Width = 83
    Height = 13
    Caption = #1576#1602#1610' '#1604#1603' '#1605#1606' '#1575#1604#1608#1602#1578' :'
  end
  object Label_Time: TLabel
    Left = 136
    Top = 48
    Width = 55
    Height = 13
    Caption = 'Label_Time'
  end
  object Button_Close: TButton
    Left = 150
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 1
    OnClick = Button_CloseClick
  end
  object Button1: TButton
    Left = 69
    Top = 96
    Width = 75
    Height = 25
    Caption = #1573#1590#1575#1601#1577' '#1605#1583#1577' ...'
    ModalResult = 1
    TabOrder = 0
    OnClick = Button1Click
  end
end
