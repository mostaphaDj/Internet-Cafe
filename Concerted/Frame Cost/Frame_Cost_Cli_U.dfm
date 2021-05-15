inherited Frame_Cost_Cli: TFrame_Cost_Cli
  Width = 451
  Align = alBottom
  ExplicitWidth = 451
  inherited SpeedButton1: TSpeedButton
    Width = 451
    ExplicitWidth = 451
  end
  inherited NextInspector1: TNextInspector
    Width = 451
    ExplicitWidth = 451
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
end
