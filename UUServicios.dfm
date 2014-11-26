object FServicios: TFServicios
  Left = 0
  Top = 0
  Caption = 'Servicios'
  ClientHeight = 539
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 496
    Top = 379
    Width = 130
    Height = 13
    Caption = 'Porcentaje variacion precio'
  end
  object Label6: TLabel
    Left = 500
    Top = 451
    Width = 35
    Height = 13
    Caption = 'Cambio'
  end
  object Label4: TLabel
    Left = 344
    Top = 379
    Width = 39
    Height = 13
    Caption = 'Efectivo'
  end
  object lblporcentaje: TLabel
    Left = 645
    Top = 398
    Width = 3
    Height = 13
  end
  object lblprecioVariacion: TLabel
    Left = 645
    Top = 473
    Width = 3
    Height = 13
  end
  object Label12: TLabel
    Left = 496
    Top = 497
    Width = 101
    Height = 13
    Caption = 'Cambio con variacion'
  end
  object LblCambioV: TLabel
    Left = 496
    Top = 516
    Width = 3
    Height = 13
  end
  object Label13: TLabel
    Left = 645
    Top = 379
    Width = 64
    Height = 13
    Caption = 'Total a pagar'
  end
  object Label14: TLabel
    Left = 645
    Top = 454
    Width = 90
    Height = 13
    Caption = 'Total con variacion'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 314
    Height = 514
    Caption = 'Venta '
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 40
      Width = 34
      Height = 13
      Caption = 'Prenda'
    end
    object Label2: TLabel
      Left = 19
      Top = 86
      Width = 81
      Height = 13
      Caption = 'Total de prendas'
    end
    object Label3: TLabel
      Left = 160
      Top = 40
      Width = 37
      Height = 13
      Caption = 'Servicio'
    end
    object ETotal: TEdit
      Left = 16
      Top = 105
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object DBLServicio: TDBLookupComboBox
      Left = 160
      Top = 59
      Width = 121
      Height = 21
      KeyField = 'Servicio'
      ListSource = DMtintoreria.DSTServicio
      TabOrder = 1
    end
    object EPrenda: TEdit
      Left = 16
      Top = 59
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 252
      Width = 328
      Height = 262
      Caption = 'Informacion entrega'
      TabOrder = 3
      object Label7: TLabel
        Left = 28
        Top = 154
        Width = 70
        Height = 13
        Caption = 'Fecha entrega'
      end
      object Label8: TLabel
        Left = 28
        Top = 45
        Width = 86
        Height = 13
        Caption = 'Nombre empleado'
      end
      object Label9: TLabel
        Left = 184
        Top = 45
        Width = 78
        Height = 13
        Caption = 'Apellido paterno'
      end
      object Label10: TLabel
        Left = 28
        Top = 101
        Width = 88
        Height = 13
        Caption = 'Nombre del cliente'
      end
      object Label11: TLabel
        Left = 184
        Top = 101
        Width = 112
        Height = 13
        Caption = 'Apellido paterno cliente'
      end
      object EFecha: TEdit
        Left = 28
        Top = 173
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object EdNombreE: TEdit
        Left = 28
        Top = 64
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object EdApellidoP: TEdit
        Left = 181
        Top = 64
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object EdNombreCliente: TEdit
        Left = 28
        Top = 120
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object EdApellidoPaternoCliente: TEdit
        Left = 181
        Top = 120
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object BtnRevertir: TButton
        Left = 168
        Top = 213
        Width = 75
        Height = 25
        Caption = 'Limpiar'
        TabOrder = 6
        OnClick = BtnRevertirClick
      end
      object BtbAgregar: TBitBtn
        Left = 56
        Top = 213
        Width = 75
        Height = 25
        Caption = 'Agregar'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 5
        OnClick = BtbAgregarClick
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 328
    Top = 8
    Width = 433
    Height = 169
    Caption = 'Catalogo '
    TabOrder = 1
    object DBServicios: TDBGrid
      Left = 16
      Top = 13
      Width = 409
      Height = 148
      DataSource = DMtintoreria.DSTDatosServicios
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object EPVariacion: TEdit
    Left = 496
    Top = 398
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object ECambio: TEdit
    Left = 496
    Top = 470
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object BtnCobrar: TButton
    Left = 344
    Top = 455
    Width = 109
    Height = 36
    Caption = 'Cobrar'
    TabOrder = 3
    OnClick = BtnCobrarClick
  end
  object EEfectivo: TEdit
    Left = 344
    Top = 398
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object DBVentas: TDBGrid
    Left = 342
    Top = 205
    Width = 409
    Height = 148
    DataSource = DMtintoreria.DSTventaServicio
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
