object UAgregar: TUAgregar
  Left = 0
  Top = 0
  Hint = 'Solo Puedes Elegir una Opci'#243'n'
  ClientHeight = 557
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Open Sans'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
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
  object Label6: TLabel
    Left = 8
    Top = 240
    Width = 45
    Height = 20
    Caption = 'Sexo:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 377
    Width = 139
    Height = 20
    Caption = 'Correo Electr'#243'nico:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 8
    Top = 441
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
    Height = 23
    TabOrder = 0
  end
  object ETPaterno: TEdit
    Left = 8
    Top = 131
    Width = 256
    Height = 23
    TabOrder = 1
  end
  object ETMaterno: TEdit
    Left = 8
    Top = 194
    Width = 256
    Height = 23
    TabOrder = 2
  end
  object ETEmail: TEdit
    Left = 8
    Top = 403
    Width = 256
    Height = 23
    TabOrder = 3
  end
  object ETTelefono: TEdit
    Left = 8
    Top = 467
    Width = 256
    Height = 23
    TabOrder = 4
  end
  object BTNGuardar: TBitBtn
    Left = 8
    Top = 512
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
    Top = 512
    Width = 104
    Height = 25
    Caption = 'BTNCancelar'
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
  object RSexo: TRadioGroup
    Left = 8
    Top = 266
    Width = 256
    Height = 105
    Columns = 2
    Ctl3D = True
    DoubleBuffered = False
    Items.Strings = (
      'Hombre '
      'Mujer')
    ParentCtl3D = False
    ParentDoubleBuffered = False
    TabOrder = 7
  end
end
