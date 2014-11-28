object FEntregas: TFEntregas
  Left = 0
  Top = 0
  Caption = 'Entregas'
  ClientHeight = 397
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 8
    Width = 729
    Height = 177
    DataSource = DMtintoreria.DSTentregas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnReporte: TBitBtn
    Left = 448
    Top = 312
    Width = 89
    Height = 41
    Caption = 'CrearReporte'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btnReporteClick
  end
  object btnEliminarEntregas: TBitBtn
    Left = 184
    Top = 312
    Width = 89
    Height = 41
    Caption = 'Vaciar entregas '
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = btnEliminarEntregasClick
  end
end
