object FormOptions: TFormOptions
  Left = 0
  Top = 0
  Caption = 'FormOptions'
  ClientHeight = 319
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 169
    Height = 278
    Align = alLeft
    Indent = 19
    TabOrder = 0
    OnChanging = TreeView1Changing
    Items.NodeData = {
      0302000000280000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      0000000000010552006F0075006E006400300000000000000000000000FFFFFF
      FFFFFFFFFF000000000000000000000000010943006F006E006E006500780069
      006F006E00}
  end
  object Panel1: TPanel
    Left = 0
    Top = 278
    Width = 424
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 261
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = Button1Click
    end
    object ButtonApply: TButton
      Left = 342
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 1
      OnClick = ButtonApplyClick
    end
    object Button3: TButton
      Left = 180
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Notebook: TNotebook
    Left = 169
    Top = 0
    Width = 255
    Height = 278
    Align = alClient
    PageIndex = 1
    TabOrder = 2
    object TPage
      Left = 0
      Top = 0
      Caption = 'Round'
      ExplicitWidth = 150
      ExplicitHeight = 150
      inline FrameRound1: TFrameRound
        Left = 0
        Top = 0
        Width = 255
        Height = 278
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 255
        ExplicitHeight = 278
        inherited NextInspectorNiveauRound: TNextInspector
          Width = 255
          Height = 278
          ExplicitWidth = 255
          ExplicitHeight = 278
          inherited NxToolbarItem1: TNxToolbarItem
            ParentIndex = -1
            inherited NxSpinItemUnitRound: TNxSpinItem
              ParentIndex = 0
            end
            inherited NxSpinItemNiveauRound: TNxSpinItem
              ParentIndex = 0
            end
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Connexion'
      inline FrameOptionsConnexion1: TFrameOptionsConnexion
        Left = 0
        Top = 0
        Width = 255
        Height = 278
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 255
        ExplicitHeight = 278
        inherited NextInspector1: TNextInspector
          Width = 255
          Height = 278
          ExplicitWidth = 255
          ExplicitHeight = 278
          inherited NxToolbarItem1: TNxToolbarItem
            ParentIndex = -1
            inherited NxTextItem3: TNxTextItem
              ParentIndex = 0
            end
            inherited NxTextItem2: TNxTextItem
              ParentIndex = 0
            end
            inherited NxTextItem1: TNxTextItem
              ParentIndex = 0
            end
          end
        end
      end
    end
  end
end
