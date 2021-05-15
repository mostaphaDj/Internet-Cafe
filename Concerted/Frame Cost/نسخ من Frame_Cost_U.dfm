object Frame_Cost: TFrame_Cost
  Left = 0
  Top = 0
  Width = 443
  Height = 160
  Align = alBottom
  AutoSize = True
  TabOrder = 0
  object Panel10: TPanel
    Left = 0
    Top = 143
    Width = 443
    Height = 17
    Align = alTop
    AutoSize = True
    BevelInner = bvRaised
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    OnClick = Panel10Click
    object Label3: TLabel
      Left = 10
      Top = 2
      Width = 66
      Height = 13
      Caption = #1575#1604#1605#1576#1604#1594' '#1575#1604#1573#1580#1605#1575#1604#1610
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Panel10Click
    end
    object Label_Totale: TLabel
      Left = 130
      Top = 2
      Width = 62
      Height = 13
      Caption = 'Label_Totale'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Panel10Click
    end
    object Panel19: TPanel
      Left = 425
      Top = 2
      Width = 16
      Height = 13
      Align = alRight
      BevelInner = bvRaised
      Caption = '<'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arabic Transparent'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Panel10Click
      OnMouseDown = Panel11MouseDown
      OnMouseUp = Panel11MouseUp
    end
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 143
    Align = alTop
    AutoSize = True
    TabOrder = 1
    Visible = False
    object Panel2: TPanel
      Left = 1
      Top = 18
      Width = 441
      Height = 15
      Align = alTop
      AutoSize = True
      BevelOuter = bvLowered
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      object Label6: TLabel
        Left = 10
        Top = 1
        Width = 70
        Height = 13
        Caption = #1608#1602#1578' '#1576#1583#1571' '#1575#1604#1580#1604#1587#1577
      end
      object Label_TimeStar: TLabel
        Left = 130
        Top = 1
        Width = 74
        Height = 13
        Caption = 'Label_TimeStar'
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 33
      Width = 441
      Height = 15
      Align = alTop
      AutoSize = True
      BevelOuter = bvLowered
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      object Label_TimeNow: TLabel
        Left = 130
        Top = 1
        Width = 77
        Height = 13
        Caption = 'Label_TimeNow'
      end
      object Label8: TLabel
        Left = 10
        Top = 1
        Width = 45
        Height = 13
        Caption = #1575#1604#1608#1602#1578' '#1575#1604#1571#1606
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 48
      Width = 441
      Height = 15
      Align = alTop
      AutoSize = True
      BevelOuter = bvLowered
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 2
      object Label12: TLabel
        Left = 10
        Top = 1
        Width = 71
        Height = 13
        Caption = #1575#1604#1608#1602#1578' '#1575#1604#1605#1587#1578#1593#1605#1604
      end
      object Label_TimeUtilize: TLabel
        Left = 130
        Top = 1
        Width = 83
        Height = 13
        Caption = 'Label_TimeUtilize'
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 63
      Width = 441
      Height = 16
      Align = alTop
      AutoSize = True
      BevelOuter = bvLowered
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 3
      object Label2: TLabel
        Left = 10
        Top = 2
        Width = 64
        Height = 13
        Caption = #1575#1604#1608#1602#1578' '#1575#1604#1605#1591#1604#1608#1576
      end
      object Label_TimeDomond: TLabel
        Left = 130
        Top = 2
        Width = 95
        Height = 13
        Caption = 'Label_TimeDomond'
      end
      object Panel14: TPanel
        Left = 424
        Top = 1
        Width = 16
        Height = 14
        Align = alRight
        BevelInner = bvRaised
        Caption = '...'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arabic Transparent'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnMouseDown = Panel11MouseDown
        OnMouseUp = Panel11MouseUp
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 79
      Width = 441
      Height = 16
      Align = alTop
      AutoSize = True
      BevelOuter = bvLowered
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 4
      object Label10: TLabel
        Left = 10
        Top = 2
        Width = 83
        Height = 13
        Caption = #1608#1602#1578' '#1575#1606#1578#1607#1575#1569' '#1575#1604#1580#1604#1587#1577
      end
      object Label_TimeFinVirtual: TLabel
        Left = 130
        Top = 2
        Width = 98
        Height = 13
        Caption = 'Label_TimeFinVirtual'
      end
      object Panel16: TPanel
        Left = 424
        Top = 1
        Width = 16
        Height = 14
        Align = alRight
        BevelInner = bvRaised
        Caption = '...'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arabic Transparent'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnMouseDown = Panel11MouseDown
        OnMouseUp = Panel11MouseUp
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 95
      Width = 441
      Height = 16
      Align = alTop
      AutoSize = True
      BevelOuter = bvLowered
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 5
      object Label5: TLabel
        Left = 10
        Top = 2
        Width = 50
        Height = 13
        Caption = #1579#1605#1606' '#1575#1604#1587#1575#1593#1577
      end
      object Label_CostHour: TLabel
        Left = 130
        Top = 2
        Width = 76
        Height = 13
        Caption = 'Label_CostHour'
      end
      object Panel15: TPanel
        Left = 424
        Top = 1
        Width = 16
        Height = 14
        Align = alRight
        BevelInner = bvRaised
        Caption = '...'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arabic Transparent'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnMouseDown = Panel11MouseDown
        OnMouseUp = Panel11MouseUp
      end
    end
    object Panel8: TPanel
      Left = 1
      Top = 111
      Width = 441
      Height = 15
      Align = alTop
      AutoSize = True
      BevelOuter = bvLowered
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 6
      object Label_Cost: TLabel
        Left = 130
        Top = 1
        Width = 53
        Height = 13
        Caption = 'Label_Cost'
      end
      object Label4: TLabel
        Left = 10
        Top = 1
        Width = 25
        Height = 13
        Caption = #1575#1604#1605#1576#1604#1594
      end
    end
    object Panel9: TPanel
      Left = 1
      Top = 126
      Width = 441
      Height = 16
      Align = alTop
      AutoSize = True
      BevelOuter = bvLowered
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 7
      object Label1: TLabel
        Left = 10
        Top = 2
        Width = 44
        Height = 13
        Caption = #1583#1610#1606' '#1587#1575#1576#1602
      end
      object Label_Computation: TLabel
        Left = 130
        Top = 2
        Width = 91
        Height = 13
        Caption = 'Label_Computation'
      end
      object Panel18: TPanel
        Left = 424
        Top = 1
        Width = 16
        Height = 14
        Align = alRight
        BevelInner = bvRaised
        Caption = '...'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arabic Transparent'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnMouseDown = Panel11MouseDown
        OnMouseUp = Panel11MouseUp
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 441
      Height = 17
      Align = alTop
      AutoSize = True
      Caption = #1575#1604#1581#1587#1575#1576
      Color = clBlue
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 8
      object Panel20: TPanel
        Left = 426
        Top = 1
        Width = 14
        Height = 15
        Align = alRight
        BevelInner = bvRaised
        Caption = 'X'
        Color = 8421631
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWhite
        Font.Height = -1
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Panel10Click
        OnMouseDown = Panel11MouseDown
        OnMouseUp = Panel11MouseUp
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 384
    Top = 8
  end
end
