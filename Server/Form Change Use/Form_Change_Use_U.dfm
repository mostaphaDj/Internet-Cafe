object Form_Change_Use: TForm_Change_Use
  Left = 207
  Top = 140
  BorderStyle = bsDialog
  Caption = 'Form_Change_Use'
  ClientHeight = 311
  ClientWidth = 201
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 8
    Top = 8
    Width = 185
    Height = 265
    Columns = <>
    TabOrder = 0
    ViewStyle = vsList
  end
  object Button_Ok: TButton
    Left = 16
    Top = 279
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object Button_Cancel: TButton
    Left = 110
    Top = 279
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
