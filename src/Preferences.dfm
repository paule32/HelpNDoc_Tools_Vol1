object PreferDialog: TPreferDialog
  Left = 247
  Top = 162
  BorderStyle = bsDialog
  Caption = 'Preferences ...'
  ClientHeight = 179
  ClientWidth = 384
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 281
    Height = 161
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 51
    Height = 13
    Caption = 'Language:'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 88
    Height = 13
    Caption = 'Working Directory:'
  end
  object SpeedButton1: TSpeedButton
    Left = 248
    Top = 80
    Width = 23
    Height = 22
    Caption = 'X'
    OnClick = SpeedButton1Click
  end
  object Label3: TLabel
    Left = 16
    Top = 112
    Width = 80
    Height = 13
    Caption = 'Database Name:'
  end
  object OKBtn: TButton
    Left = 300
    Top = 8
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 300
    Top = 38
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object LanguageCB: TComboBox
    Left = 16
    Top = 32
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'System Language'
    Items.Strings = (
      'System Language'
      'English'
      'German')
  end
  object WorkDir: TEdit
    Left = 16
    Top = 80
    Width = 217
    Height = 21
    TabOrder = 3
    Text = 'C:\'
  end
  object DatabaseName: TEdit
    Left = 16
    Top = 128
    Width = 217
    Height = 21
    TabOrder = 4
    Text = 'wrap.db'
  end
  object OpenDialog: TJvSelectDirectory
    ClassicDialog = False
    Left = 296
    Top = 72
  end
end
