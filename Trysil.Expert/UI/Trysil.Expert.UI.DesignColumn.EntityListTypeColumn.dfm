object TDesignEntityListTypeColumnForm: TTDesignEntityListTypeColumnForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Trysil - Delphi ORM'
  ClientHeight = 213
  ClientWidth = 464
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object ColumnNameLabel: TLabel
    Left = 68
    Top = 120
    Width = 79
    Height = 15
    Caption = 'Column name:'
  end
  object EntityTypeLabel: TLabel
    Left = 68
    Top = 70
    Width = 59
    Height = 15
    Caption = 'Entity type:'
  end
  object TrysilImage: TImage
    Left = 8
    Top = 8
    Width = 48
    Height = 48
    AutoSize = True
  end
  object NameLabel: TLabel
    Left = 68
    Top = 16
    Width = 35
    Height = 15
    Caption = 'Name:'
  end
  object EntityTypeCombobox: TComboBox
    Left = 68
    Top = 91
    Width = 380
    Height = 23
    Style = csDropDownList
    TabOrder = 1
    OnChange = EntityTypeComboboxChange
  end
  object ColumnNameCombobox: TComboBox
    Left = 68
    Top = 141
    Width = 380
    Height = 23
    Style = csDropDownList
    TabOrder = 2
  end
  object SaveButton: TButton
    AlignWithMargins = True
    Left = 294
    Top = 179
    Width = 75
    Height = 25
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 4
    Margins.Bottom = 9
    Caption = '&Save'
    Default = True
    TabOrder = 3
    OnClick = SaveButtonClick
  end
  object CancelButton: TButton
    AlignWithMargins = True
    Left = 373
    Top = 179
    Width = 75
    Height = 25
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 9
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object NameTextbox: TEdit
    Left = 68
    Top = 37
    Width = 380
    Height = 23
    TabOrder = 0
    Text = 'Name'
  end
  object EntityTypeListbox: TListBox
    Left = 79
    Top = 91
    Width = 121
    Height = 23
    ItemHeight = 15
    TabOrder = 5
    Visible = False
  end
end
