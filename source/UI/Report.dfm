object ReportForm: TReportForm
  Left = 0
  Top = 0
  Caption = 'ReportForm'
  ClientHeight = 703
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = MainForm.DataSource6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 248
        Top = 16
        Width = 145
        Height = 36
        Caption = 'ORDERS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -32
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 64
      object RLLabel2: TRLLabel
        Left = 24
        Top = 8
        Width = 33
        Height = 16
        Caption = 'Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 213
        Top = 8
        Width = 75
        Height = 16
        Caption = 'Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 526
        Top = 8
        Width = 41
        Height = 16
        Caption = 'Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText1: TRLDBText
        Left = 26
        Top = 32
        Width = 29
        Height = 16
        DataField = 'date'
        DataSource = MainForm.DataSource6
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 212
        Top = 32
        Width = 109
        Height = 16
        DataField = 'serviceDescription'
        DataSource = MainForm.DataSource6
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 526
        Top = 32
        Width = 61
        Height = 16
        DataField = 'saleValue'
        DataSource = MainForm.DataSource6
        Text = ''
      end
    end
  end
end