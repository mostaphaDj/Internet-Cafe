inherited Frame_Cost_Ser: TFrame_Cost_Ser
  inherited SpeedButton1: TSpeedButton
    ExplicitLeft = 16
    ExplicitTop = 263
  end
  inherited NextInspector1: TNextInspector
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
