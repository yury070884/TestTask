object AddCreditTransactionForm: TAddCreditTransactionForm
  Left = 0
  Top = 0
  Caption = 'Add Item'
  ClientHeight = 126
  ClientWidth = 224
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 69
    Height = 13
    Caption = 'customerCode'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 53
    Height = 13
    Caption = 'creditValue'
    FocusControl = DBEdit2
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 200
    Height = 21
    DataField = 'customerCode'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 64
    Width = 200
    Height = 21
    DataField = 'creditValue'
    DataSource = DataSource1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 133
    Top = 91
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 52
    Top = 91
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = MainForm.FDQuery3
    Left = 136
    Top = 8
  end
end
