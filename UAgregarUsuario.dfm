﻿object FAgregarUsuario: TFAgregarUsuario
  Left = 0
  Top = 0
  ClientHeight = 341
  ClientWidth = 324
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
  object label0: TLabel
    Left = 40
    Top = 16
    Width = 248
    Height = 20
    Caption = 'Campos requeridos marcados con:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 40
    Top = 112
    Width = 66
    Height = 20
    Caption = 'Usuario:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 165
    Width = 90
    Height = 20
    Caption = 'Contrase'#241'a:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 218
    Width = 164
    Height = 20
    Caption = 'Confirmar Contrase'#241'a:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 40
    Top = 51
    Width = 81
    Height = 20
    Caption = 'Empleado:*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaptionText
    Font.Height = -15
    Font.Name = 'Open Sans'
    Font.Style = []
    ParentFont = False
  end
  object EUsuario: TEdit
    Left = 40
    Top = 138
    Width = 248
    Height = 21
    MaxLength = 45
    TabOrder = 1
  end
  object EContraseañ: TEdit
    Left = 40
    Top = 191
    Width = 248
    Height = 21
    MaxLength = 45
    PasswordChar = '*'
    TabOrder = 2
  end
  object EConfirmarCon: TEdit
    Left = 40
    Top = 244
    Width = 248
    Height = 21
    MaxLength = 45
    PasswordChar = '*'
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 288
    Width = 90
    Height = 25
    Caption = 'Guardar'
    DoubleBuffered = True
    Kind = bkOK
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 288
    Width = 88
    Height = 25
    Caption = 'Cancelar'
    DoubleBuffered = True
    Kind = bkCancel
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object ComboEmpleados: TDBLookupComboBox
    Left = 40
    Top = 85
    Width = 248
    Height = 21
    KeyField = 'idEmpleado'
    ListField = 'nombreCompleto'
    ListSource = DMtintoreria.DSTEmpleado
    TabOrder = 0
  end
end
