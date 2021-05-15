object Form_Lock: TForm_Lock
  Left = 181
  Top = 617
  BorderStyle = bsNone
  Caption = 'Form_Lock'
  ClientHeight = 102
  ClientWidth = 506
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 257
    Height = 89
    Caption = 'Close'
    TabOrder = 0
    OnClick = Panel1Click
  end
  object Timer_TimeHelleniste: TTimer
    OnTimer = Timer_TimeHellenisteTimer
    Left = 272
    Top = 8
  end
  object TimerMouseMove: TTimer
    Interval = 1
    OnTimer = TimerMouseMoveTimer
    Left = 272
    Top = 40
  end
end
