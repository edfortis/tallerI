object DMtintoreria: TDMtintoreria
  OldCreateOrder = False
  Height = 560
  Width = 797
  object Conexion: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=12345;Persist Security Info=True;Use' +
      'r ID=root;Data Source=Conexion;Initial Catalog=tintoreria'
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
    Left = 688
    Top = 368
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
    Left = 616
    Top = 360
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
  object TServicio: TADOTable
    Active = True
    Connection = Conexion
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'catalogoservicio'
    Left = 448
    Top = 40
    object TServiciotipo: TWideStringField
      FieldName = 'tipo'
      Size = 45
    end
  end
  object DSTServicio: TDataSource
    DataSet = TServicio
    Left = 448
    Top = 88
  end
  object TDatosServicios: TADOTable
    Active = True
    Connection = Conexion
    CursorType = ctStatic
    TableName = 'catalogoservicio'
    Left = 384
    Top = 216
    object TDatosServiciosdescripcion: TWideStringField
      FieldName = 'descripcion'
      Size = 80
    end
    object TDatosServiciosprecio: TFloatField
      FieldName = 'precio'
    end
    object TDatosServiciostipo: TWideStringField
      FieldName = 'tipo'
      Size = 45
    end
    object TDatosServiciosporcentaje: TIntegerField
      FieldName = 'porcentaje'
    end
  end
  object DSTDatosServicios: TDataSource
    DataSet = TDatosServicios
    Left = 376
    Top = 280
  end
  object TClientes: TADOTable
    Connection = Conexion
    CursorType = ctStatic
    TableName = 'catalogoservicio'
    Left = 472
    Top = 216
    object TClientesdescripcion: TWideMemoField
      FieldName = 'descripcion'
      BlobType = ftWideMemo
    end
    object TClientestipo: TWideStringField
      FieldName = 'tipo'
      Size = 45
    end
  end
  object DSTClientes: TDataSource
    DataSet = TClientes
    Left = 472
    Top = 288
  end
  object TCarrito: TADOTable
    Active = True
    Connection = Conexion
    CursorType = ctStatic
    TableName = 'carrito'
    Left = 544
    Top = 216
  end
  object DSTCarrito: TDataSource
    DataSet = TCarrito
    Left = 544
    Top = 288
  end
  object Tentregas: TADOTable
    Active = True
    Connection = Conexion
    CursorType = ctStatic
    TableName = 'entrega'
    Left = 608
    Top = 216
    object TentregasidEntrega: TAutoIncField
      FieldName = 'idEntrega'
      ReadOnly = True
      Visible = False
    end
    object TentregasNumeroentrega: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Numero entrega'
      Calculated = True
    end
    object TentregasfechaEntrega: TDateTimeField
      FieldName = 'fechaEntrega'
    end
  end
  object DSTentregas: TDataSource
    DataSet = Tentregas
    Left = 608
    Top = 288
  end
  object QRegistrarVentaServicio: TADOQuery
    Connection = Conexion
    Parameters = <>
    Left = 96
    Top = 256
  end
  object QInsertaEntrega: TADOQuery
    Parameters = <
      item
        Name = 'Fecha'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Left = 136
    Top = 192
  end
  object TventaServicio: TADOTable
    Active = True
    Connection = Conexion
    CursorType = ctStatic
    OnCalcFields = TventaServicioCalcFields
    TableName = 'ventaservicio'
    Left = 672
    Top = 216
    object TventaServicioNumeroVenta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NumeroVenta'
      Calculated = True
    end
    object TventaServiciofecha: TDateField
      FieldName = 'fecha'
    end
    object TventaServicioidVentaServicio: TAutoIncField
      FieldName = 'idVentaServicio'
      ReadOnly = True
      Visible = False
    end
  end
  object DSTventaServicio: TDataSource
    DataSet = TventaServicio
    Left = 688
    Top = 296
  end
  object Tcliente: TADOTable
    Active = True
    Connection = Conexion
    CursorType = ctStatic
    TableName = 'cliente'
    Left = 208
    Top = 264
    object Tclientenombre: TWideStringField
      FieldName = 'nombre'
      Size = 45
    end
    object TclienteaPaterno: TWideStringField
      FieldName = 'aPaterno'
      Size = 45
    end
    object Tclientetelefono: TWideStringField
      FieldName = 'telefono'
      Size = 45
    end
    object Tclientedireccion: TWideStringField
      FieldName = 'direccion'
      Size = 45
    end
    object TclienteNombreCompleto: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'NombreCompleto'
      Calculated = True
    end
    object TclienteidCliente: TAutoIncField
      FieldName = 'idCliente'
      ReadOnly = True
      Visible = False
    end
    object TclienteaMaterno: TWideStringField
      FieldName = 'aMaterno'
      Size = 45
    end
  end
  object DSTCliente: TDataSource
    DataSet = Tcliente
    Left = 208
    Top = 328
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = Conexion
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'catalogoservicio'
    Left = 552
    Top = 88
    object ADOTable1descripcion: TWideStringField
      FieldName = 'descripcion'
      Size = 80
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 552
    Top = 136
  end
end
