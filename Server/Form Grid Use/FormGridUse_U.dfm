object FormGridUse: TFormGridUse
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = 'FormGridUse'
  ClientHeight = 477
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 519
    Height = 477
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 517
    ExplicitHeight = 475
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataModuleBase.DS_Use
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'TimeUse'
          Column = cxGrid1DBTableView1TimeUse
        end
        item
          Kind = skSum
          FieldName = 'CostPayment'
          Column = cxGrid1DBTableView1CostPayment
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      object cxGrid1DBTableView1pseudonymeUser: TcxGridDBColumn
        DataBinding.FieldName = 'pseudonymeUser'
        Options.Editing = False
        Options.ShowEditButtons = isebNever
        Width = 100
      end
      object cxGrid1DBTableView1HostName: TcxGridDBColumn
        DataBinding.FieldName = 'HostName'
        Options.Editing = False
        Options.ShowEditButtons = isebNever
        Width = 100
      end
      object cxGrid1DBTableView1TimeStart: TcxGridDBColumn
        DataBinding.FieldName = 'TimeStart'
        Options.Editing = False
        Options.ShowEditButtons = isebNever
        SortIndex = 0
        SortOrder = soDescending
      end
      object cxGrid1DBTableView1TimeUse: TcxGridDBColumn
        DataBinding.FieldName = 'TimeUse'
        Options.Editing = False
        Options.ShowEditButtons = isebNever
      end
      object cxGrid1DBTableView1CostPayment: TcxGridDBColumn
        DataBinding.FieldName = 'CostPayment'
        Options.Editing = False
        Options.ShowEditButtons = isebNever
        Width = 74
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
