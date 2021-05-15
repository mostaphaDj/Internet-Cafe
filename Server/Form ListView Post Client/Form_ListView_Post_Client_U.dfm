object Form_ListView_Post_Client: TForm_ListView_Post_Client
  Left = 218
  Top = 144
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Lock Cancel '#1594#1604#1602
  ClientHeight = 431
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 60
    Width = 592
    Height = 371
    Align = alClient
    BiDiMode = bdLeftToRight
    Columns = <
      item
        Caption = 'Object'
        MinWidth = 140
        Width = 150
      end
      item
        Caption = 'User Name'
        Width = 80
      end
      item
        Caption = 'Start Time'
        MaxWidth = 80
        MinWidth = 80
        Width = 80
      end
      item
        Caption = 'Time Desired'
        MaxWidth = 80
        MinWidth = 80
        Width = 80
      end
      item
        Caption = 'Use Time'
        MaxWidth = 80
        MinWidth = 80
        Width = 80
      end
      item
        Caption = #1575#1604#1608#1602#1578' '#1575#1604#1605#1578#1576#1602#1610
        MaxWidth = 80
        MinWidth = 80
        Width = 80
      end
      item
        Caption = 'Time Fin'
        MaxWidth = 80
        MinWidth = 80
        Width = 80
      end
      item
        Caption = 'Cost'
        MaxWidth = 80
        MinWidth = 80
        Width = 80
      end
      item
        Caption = 'Cost Virtual'
        MaxWidth = 80
        MinWidth = 80
        Width = 80
      end
      item
        Caption = 'Price Hour'
        MaxWidth = 80
        MinWidth = 80
        Width = 80
      end
      item
        Caption = 'Computation'
        MaxWidth = 80
        MinWidth = 80
        Width = 80
      end>
    GridLines = True
    Groups = <
      item
        Header = 'Users'
        GroupID = 0
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
        ExtendedImage = -1
      end
      item
        Header = 'Posts'
        GroupID = 1
        State = [lgsNormal]
        HeaderAlign = taLeftJustify
        FooterAlign = taLeftJustify
        TitleImage = -1
        ExtendedImage = -1
      end>
    LargeImages = DataModuleImages.ImageListLargePost
    MultiSelect = True
    GroupView = True
    ParentBiDiMode = False
    SmallImages = DataModuleImages.ImageListSmallPost
    TabOrder = 2
    ViewStyle = vsReport
    OnColumnClick = ListView1ColumnClick
    OnContextPopup = ListView1ContextPopup
    OnDblClick = ListView1DblClick
    OnResize = ListView1Resize
    OnSelectItem = ListView1SelectItem
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 592
    Height = 41
    ButtonHeight = 36
    ButtonWidth = 31
    Caption = 'ToolBar1'
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
    end
    object ToolButton2: TToolButton
      Left = 31
      Top = 0
    end
    object ToolButton3: TToolButton
      Left = 62
      Top = 0
    end
    object ToolButton4: TToolButton
      Left = 93
      Top = 0
      Caption = 'Lock Cancel '#1594#1604#1602
      Enabled = False
      ImageIndex = 2
    end
    object ToolButton5: TToolButton
      Left = 124
      Top = 0
    end
    object ToolButton8: TToolButton
      Left = 155
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 163
      Top = 0
    end
    object ToolButton7: TToolButton
      Left = 194
      Top = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 41
    Width = 592
    Height = 19
    Align = alTop
    Panels = <
      item
        Width = 232
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 80
      end>
  end
  object TimerPayment: TTimer
    OnTimer = TimerPaymentTimer
    Left = 64
    Top = 208
  end
  object PopupActionBarPost: TPopupActionBar
    Left = 240
    Top = 256
    object UnLockPartTime1: TMenuItem
      Action = Action_Module.UnLock
    end
    object LockPayment1: TMenuItem
      Action = Action_Module.LockPayment
    end
    object Control1: TMenuItem
      Caption = 'Control'
      object System1: TMenuItem
        Caption = 'System'
        object Restart2: TMenuItem
          Action = Action_Module.Restart
        end
        object ShutDown2: TMenuItem
          Action = Action_Module.ShutDown
        end
      end
    end
    object ChongePC1: TMenuItem
      Action = Action_Module.Change_Use
    end
    object HidePostX1: TMenuItem
      Action = Action_Module.HidePostX
    end
  end
  object PopupActionBarUser: TPopupActionBar
    Left = 240
    Top = 304
    object N9: TMenuItem
      Caption = #1578#1587#1583#1610#1583
    end
    object N7: TMenuItem
      Caption = #1578#1587#1580#1610#1604' '#1575#1604#1583#1610#1606
    end
    object N8: TMenuItem
      Caption = #1573#1604#1594#1575#1569' '#1575#1604#1580#1604#1587#1577
    end
  end
  object PopupActionBarListViewShowPost: TPopupActionBar
    Left = 240
    Top = 352
    object View: TMenuItem
      Caption = 'View'
      object Icon: TMenuItem
        Caption = 'Icon'
        ImageIndex = 0
        RadioItem = True
      end
      object SmallIcon: TMenuItem
        Tag = 1
        Caption = 'SmallIcon'
        ImageIndex = 1
        RadioItem = True
      end
      object btnList: TMenuItem
        Tag = 2
        Caption = 'btnList'
        ImageIndex = 2
        RadioItem = True
      end
      object Report: TMenuItem
        Tag = 3
        Caption = 'Report'
        ImageIndex = 3
        RadioItem = True
      end
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object ArrangeIconsby: TMenuItem
      Caption = 'Arrange Icons by'
    end
    object Refresh: TMenuItem
      Caption = 'Refresh'
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object HidePost: TMenuItem
      Caption = 'Hide Post'
      object HidePostX: TMenuItem
        Caption = 'Hide Post X'
      end
      object HidePostShotDown: TMenuItem
        Caption = 'Hide Post Shot Down'
      end
    end
  end
end
