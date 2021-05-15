object Form_Payment: TForm_Payment
  Left = 305
  Top = 140
  AutoSize = True
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = 'Payment'
  ClientHeight = 354
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 281
    Width = 273
    Height = 32
    Align = alTop
    TabOrder = 1
    object Label10: TLabel
      Left = 21
      Top = 8
      Width = 65
      Height = 16
      Caption = #1605#1576#1604#1594' '#1575#1604#1602#1576#1590
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit_Payment: TEdit
      Left = 120
      Top = 6
      Width = 129
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      Text = '0'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 313
    Width = 273
    Height = 41
    Align = alTop
    TabOrder = 2
    object ButtonClose: TButton
      Left = 192
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
    object ButtonTerminate: TButton
      Left = 14
      Top = 9
      Width = 75
      Height = 24
      Caption = #1573#1606#1607#1575#1569' '#1575#1604#1580#1604#1587#1577
      TabOrder = 1
      OnClick = ButtonTerminateClick
    end
    object Button1: TButton
      Left = 100
      Top = 8
      Width = 75
      Height = 25
      Caption = #1573#1604#1594#1575#1569' '#1575#1604#1580#1604#1587#1577
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  inline Frame_Cost: TFrame_Cost_Ser
    Left = 0
    Top = 0
    Width = 273
    Height = 281
    Align = alTop
    AutoSize = True
    TabOrder = 0
    ExplicitWidth = 273
    inherited SpeedButton1: TSpeedButton
      Width = 273
      ExplicitWidth = 273
    end
    inherited NextInspector1: TNextInspector
      Width = 273
      ExplicitWidth = 273
      inherited NxTextItemHostName: TNxTextItem
        ParentIndex = -1
      end
      inherited NxToolbarItemUser: TNxToolbarItem
        ParentIndex = -1
        inherited NxTextItemPseudonyme: TNxTextItem
          ParentIndex = 1
        end
        inherited NxTextItemFirstName: TNxTextItem
          ParentIndex = 1
        end
        inherited NxTextItemLastName: TNxTextItem
          ParentIndex = 1
        end
        inherited NxSpinItemPriceHour: TNxSpinItem
          ParentIndex = 1
        end
        inherited NxSpinItemComputation: TNxSpinItem
          ParentIndex = 1
        end
      end
      inherited NxToolbarItemUse: TNxToolbarItem
        ParentIndex = -1
        inherited NxTextItemTimeStart: TNxTextItem
          ParentIndex = 7
        end
        inherited NxTextItemTimeNow: TNxTextItem
          ParentIndex = 7
        end
        inherited NxTextItemTimeUse: TNxTextItem
          ParentIndex = 7
        end
        inherited NxButtonItemTimeDesired: TNxButtonItem
          ParentIndex = 7
        end
        inherited NxButtonItemTimeFin: TNxButtonItem
          ParentIndex = 7
        end
        inherited NxSpinItemCostVirtual: TNxSpinItem
          ParentIndex = 7
        end
        inherited NxSpinItemCostTotal: TNxSpinItem
          ParentIndex = 7
        end
      end
    end
    inherited Timer1: TTimer
      OnTimer = Frame_Cost_Ser1Timer1Timer
    end
  end
end
