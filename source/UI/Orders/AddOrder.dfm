object AddOrderForm: TAddOrderForm
  Left = 0
  Top = 0
  Caption = 'Add Item'
  ClientHeight = 169
  ClientWidth = 228
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
    Left = 16
    Top = 8
    Width = 69
    Height = 13
    Caption = 'customerCode'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 87
    Height = 13
    Caption = 'serviceDescription'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 45
    Height = 13
    Caption = 'saleValue'
    FocusControl = DBEdit3
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 24
    Width = 200
    Height = 21
    DataField = 'customerCode'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 64
    Width = 200
    Height = 21
    DataField = 'serviceDescription'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 16
    Top = 104
    Width = 200
    Height = 21
    DataField = 'saleValue'
    DataSource = DataSource1
    TabOrder = 2
  end
  object Button1: TButton
    Left = 60
    Top = 131
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 141
    Top = 131
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = Button2Click
  end
  object DataSource1: TDataSource
    DataSet = MainForm.FDQuery2
    Left = 120
    Top = 8
  end
end
