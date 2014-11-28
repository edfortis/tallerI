object FServicioAgregar: TFServicioAgregar
  Left = 0
  Top = 0
  ClientHeight = 369
  ClientWidth = 304
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
  object Label3: TLabel
    Left = 8
    Top = 65
    Width = 55
    Height = 20
    Caption = 'Precio:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 118
    Width = 42
    Height = 20
    Caption = 'Tipo:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 171
    Width = 85
    Height = 20
    Caption = 'Porcentaje:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 235
    Width = 171
    Height = 20
    Caption = 'Aproximado Respuesta:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object ETPrecio: TEdit
    Left = 8
    Top = 91
    Width = 256
    Height = 21
    TabOrder = 0
    OnKeyPress = ETPrecioKeyPress
  end
  object ETTipo: TEdit
    Left = 8
    Top = 144
    Width = 256
    Height = 21
    TabOrder = 1
  end
  object BTNGuardar: TBitBtn
    Left = 8
    Top = 304
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
    TabOrder = 2
    OnClick = BTNGuardarClick
  end
  object BTNCancelar: TBitBtn
    Left = 160
    Top = 304
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
    TabOrder = 3
    OnClick = BTNCancelarClick
  end
  object ETPorcetanje: TEdit
    Left = 8
    Top = 197
    Width = 256
    Height = 21
    TabOrder = 4
    OnKeyPress = ETPorcetanjeKeyPress
  end
  object ETRespuesta: TEdit
    Left = 8
    Top = 261
    Width = 256
    Height = 21
    TabOrder = 5
    OnKeyPress = ETRespuestaKeyPress
  end
end
