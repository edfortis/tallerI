object FAgregarCliente: TFAgregarCliente
  Left = 0
  Top = 0
  ClientHeight = 418
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 256
    Height = 20
    Caption = 'Campos requeridos marcados con: * '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 50
    Width = 69
    Height = 20
    Caption = 'Nombre:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 105
    Width = 126
    Height = 20
    Caption = 'Apellido Paterno:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 168
    Width = 131
    Height = 20
    Caption = 'Apellido Materno:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 232
    Width = 77
    Height = 20
    Caption = 'Direccion:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 296
    Width = 72
    Height = 20
    Caption = 'Tel'#233'fono:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object ETNombre: TEdit
    Left = 8
    Top = 76
    Width = 256
    Height = 21
    TabOrder = 0
    OnKeyPress = ETNombreKeyPress
  end
  object ETPaterno: TEdit
    Left = 8
    Top = 131
    Width = 256
    Height = 21
    TabOrder = 1
    OnKeyPress = ETPaternoKeyPress
  end
  object ETMaterno: TEdit
    Left = 8
    Top = 194
    Width = 256
    Height = 21
    TabOrder = 2
    OnKeyPress = ETMaternoKeyPress
  end
  object ETDireccion: TEdit
    Left = 8
    Top = 258
    Width = 256
    Height = 21
    TabOrder = 3
  end
  object ETTelefono: TEdit
    Left = 8
    Top = 322
    Width = 256
    Height = 21
    TabOrder = 4
    OnKeyPress = ETTelefonoKeyPress
  end
  object BTNGuardar: TBitBtn
    Left = 8
    Top = 369
    Width = 97
    Height = 25
    Caption = 'Guardar'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    Kind = bkOK
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 5
    OnClick = BTNGuardarClick
  end
  object BTNCancelar: TBitBtn
    Left = 160
    Top = 369
    Width = 104
    Height = 25
    Caption = 'Cancelar'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    Kind = bkCancel
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 6
    OnClick = BTNCancelarClick
  end
end
