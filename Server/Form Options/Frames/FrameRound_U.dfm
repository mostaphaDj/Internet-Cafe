object FrameRound: TFrameRound
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  object NextInspectorNiveauRound: TNextInspector
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    TabOrder = 0
    OnChange = NextInspectorNiveauRoundChange
    object NxToolbarItem1: TNxToolbarItem
      Caption = 'Round'
      Buttons = <>
      ParentIndex = -1
      object NxSpinItemUnitRound: TNxSpinItem
        Caption = 'Unit Round'
        Value = '0'
        Increment = 1.000000000000000000
        ParentIndex = 0
      end
      object NxSpinItemNiveauRound: TNxSpinItem
        Caption = 'Niveau Round'
        Value = '0'
        Increment = 1.000000000000000000
        ParentIndex = 0
      end
    end
  end
end
