object DMtintoreria: TDMtintoreria
  OldCreateOrder = False
  Height = 227
  Width = 756
  object Conexion: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data' +
      ' Source=tintoreria;Initial Catalog=tintoreria;'
    LoginPrompt = False
    Left = 64
    Top = 64
  end
  object DSQUsuario: TDataSource
    DataSet = QClientes
    Left = 136
    Top = 80
  end
  object QClientes: TADOQuery
    Connection = Conexion
    Parameters = <>
    Left = 136
    Top = 32
  end
  object QGeneral: TADOQuery
    Connection = Conexion
    Parameters = <>
    Left = 200
    Top = 32
  end
  object TEmpleado: TADOTable
    Active = True
    Connection = Conexion
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = TEmpleadoCalcFields
    TableName = 'empleado'
    Left = 256
    Top = 32
    object TEmpleadoidEmpleado: TIntegerField
      FieldName = 'idEmpleado'
      Visible = False
    end
    object TEmpleadonombre: TWideStringField
      DisplayLabel = 'Nombre'
      DisplayWidth = 18
      FieldName = 'nombre'
      Visible = False
      Size = 45
    end
    object TEmpleadoaPaterno: TWideStringField
      DisplayLabel = 'Apellido Paterno'
      DisplayWidth = 15
      FieldName = 'aPaterno'
      Visible = False
      Size = 45
    end
    object TEmpleadoaMaterno: TWideStringField
      DisplayLabel = 'Apellido Materno'
      DisplayWidth = 17
      FieldName = 'aMaterno'
      Visible = False
      Size = 45
    end
    object TEmpleadonombreCompleto: TWideStringField
      DisplayLabel = 'Nombre Empleado'
      DisplayWidth = 24
      FieldKind = fkCalculated
      FieldName = 'nombreCompleto'
      Calculated = True
    end
    object TEmpleadocorreoElectronico: TWideStringField
      DisplayLabel = 'Correo Electronico'
      DisplayWidth = 32
      FieldName = 'correoElectronico'
      Size = 45
    end
    object TEmpleadotelefono: TWideStringField
      DisplayLabel = 'Tel'#233'fono'
      DisplayWidth = 22
      FieldName = 'telefono'
      Size = 45
    end
    object TEmpleadosexo: TWideStringField
      DisplayLabel = 'Sexo'
      DisplayWidth = 5
      FieldName = 'sexo'
      Visible = False
      Size = 2
    end
  end
  object DSTEmpleado: TDataSource
    DataSet = TEmpleado
    Left = 256
    Top = 88
  end
  object RvStados: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = TEmpleado
    Left = 528
    Top = 24
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    LoadDesigner = True
    Left = 520
    Top = 96
  end
  object RvRenderPDF1: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    DocInfo.Creator = 'Rave Reports (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 592
    Top = 24
  end
  object RvRenderText1: TRvRenderText
    DisplayName = 'Plain Text (TXT)'
    FileExtension = '*.txt'
    CPI = 10.000000000000000000
    LPI = 6.000000000000000000
    Left = 656
    Top = 24
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 664
    Top = 88
  end
  object TUsuario: TADOTable
    Active = True
    Connection = Conexion
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'usuario'
    Left = 320
    Top = 32
    object TUsuarioidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Visible = False
    end
    object TUsuarionombre: TWideStringField
      DisplayLabel = 'Nombre'
      DisplayWidth = 24
      FieldName = 'nombre'
      Size = 45
    end
    object TUsuariocontrasena: TWideStringField
      FieldName = 'contrasena'
      Visible = False
      Size = 45
    end
    object TUsuarioempleado_idEmpleado: TIntegerField
      FieldName = 'empleado_idEmpleado'
      Visible = False
    end
    object TUsuarioNombreCompleto: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Nombre Completo'
      LookupDataSet = TEmpleado
      LookupKeyFields = 'idEmpleado'
      LookupResultField = 'nombreCompleto'
      KeyFields = 'empleado_idEmpleado'
      Size = 200
      Lookup = True
    end
  end
  object DSTUsuario: TDataSource
    DataSet = TUsuario
    Left = 320
    Top = 88
  end
  object TCliente: TADOTable
    Active = True
    Connection = Conexion
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = TClienteCalcFields
    TableName = 'cliente'
    Left = 384
    Top = 32
    object TClienteidCliente: TIntegerField
      FieldName = 'idCliente'
      Visible = False
    end
    object TClientenombre: TWideStringField
      FieldName = 'nombre'
      Visible = False
      Size = 45
    end
    object TClienteaPaterno: TWideStringField
      FieldName = 'aPaterno'
      Visible = False
      Size = 45
    end
    object TClienteaMaterno: TWideStringField
      FieldName = 'aMaterno'
      Visible = False
      Size = 45
    end
    object TClientetelefono: TWideStringField
      FieldName = 'telefono'
      Size = 45
    end
    object TClientedireccion: TWideStringField
      FieldName = 'direccion'
      Size = 45
    end
    object TClienteNombreCompleto: TStringField
      FieldKind = fkCalculated
      FieldName = 'Nombre Completo'
      Size = 300
      Calculated = True
    end
  end
  object DSTCliente: TDataSource
    DataSet = TCliente
    Left = 384
    Top = 88
  end
  object TServicio: TADOTable
    Active = True
    Connection = Conexion
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'catalogoservicio'
    Left = 448
    Top = 40
  end
  object DSTServicio: TDataSource
    DataSet = TServicio
    Left = 448
    Top = 88
  end
end