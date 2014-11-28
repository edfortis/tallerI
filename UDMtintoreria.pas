unit UDMtintoreria;

interface

uses
  SysUtils, Classes, DB, ADODB, RpDefine, RpCon, RpConDS, RpRave, RpRender,
  RpRenderPDF, RpRenderText, RpBase, RpSystem;

type
  TDMtintoreria = class(TDataModule)
    Conexion: TADOConnection;
    DSQUsuario: TDataSource;
    QClientes: TADOQuery;
    QGeneral: TADOQuery;
    TEmpleado: TADOTable;
    DSTEmpleado: TDataSource;
    TEmpleadoidEmpleado: TIntegerField;
    TEmpleadonombre: TWideStringField;
    TEmpleadoaPaterno: TWideStringField;
    TEmpleadoaMaterno: TWideStringField;
    TEmpleadocorreoElectronico: TWideStringField;
    TEmpleadotelefono: TWideStringField;
    TEmpleadosexo: TWideStringField;
    TEmpleadonombreCompleto: TWideStringField;
    RvSEntregas: TRvDataSetConnection;
    RvProject1: TRvProject;
    RvRenderPDF1: TRvRenderPDF;
    RvRenderText1: TRvRenderText;
    RvSystem1: TRvSystem;
    TUsuario: TADOTable;
    DSTUsuario: TDataSource;
    TUsuarioidUsuario: TIntegerField;
    TUsuarionombre: TWideStringField;
    TUsuariocontrasena: TWideStringField;
    TUsuarioempleado_idEmpleado: TIntegerField;
    TUsuarioNombreCompleto: TStringField;
    TServicio: TADOTable;
    DSTServicio: TDataSource;
    TDatosServicios: TADOTable;
    DSTDatosServicios: TDataSource;
    TClientes: TADOTable;
    DSTClientes: TDataSource;
    TCarrito: TADOTable;
    DSTCarrito: TDataSource;
    Tentregas: TADOTable;
    TentregasfechaEntrega: TDateTimeField;
    DSTentregas: TDataSource;
    QRegistrarVentaServicio: TADOQuery;
    QInsertaEntrega: TADOQuery;
    TventaServicio: TADOTable;
    TventaServicioNumeroVenta: TIntegerField;
    TventaServiciofecha: TDateField;
    TventaServicioidVentaServicio: TAutoIncField;
    DSTventaServicio: TDataSource;
    Tcliente: TADOTable;
    DSTCliente: TDataSource;
    TclienteNombreCompleto: TWideStringField;
    TServiciotipo: TWideStringField;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOTable1descripcion: TWideStringField;
    TDatosServiciosprecio: TFloatField;
    TDatosServiciostipo: TWideStringField;
    TDatosServiciosporcentaje: TIntegerField;
    TDatosServiciosidCatalogoServicio: TAutoIncField;
    TServicioidCatalogoServicio: TIntegerField;
    TClientesprecio: TFloatField;
    TClientestipo: TWideStringField;
    TClientesporcentaje: TIntegerField;
    TCarritoPrenda: TWideStringField;
    TCarritoCantidad: TIntegerField;
    TCarritoTotalParcial: TFloatField;
    TclienteidCliente: TAutoIncField;
    Tclientenombre: TWideStringField;
    TclienteaPaterno: TWideStringField;
    TclienteaMaterno: TWideStringField;
    Tclientetelefono: TWideStringField;
    Tclientedireccion: TWideStringField;
    TentregasEstatus: TWideStringField;
    Tentregascliente_idCliente: TIntegerField;
    TentregasCliente: TStringField;
    TentregasDireccion: TStringField;
    TentregasidEntrega: TAutoIncField;
    TventaServicioentrega_idEntrega: TIntegerField;
    TentregasFecha: TDateField;
    procedure TEmpleadoCalcFields(DataSet: TDataSet);
    procedure TClienteCalcFields(DataSet: TDataSet);
    procedure TventaServicioCalcFields(DataSet: TDataSet);


  private
    { Private declarations }
  public
    { Public declarations }
   function buscarPersona(Usuario:String;Contrasena:String):boolean;
  end;

var
  DMtintoreria: TDMtintoreria;
  nombre:String;
  bandera:Integer;
implementation

{$R *.dfm}
function TDMtintoreria.buscarPersona(usuario:String;contrasena:String):boolean;
var
rs:_Recordset;
cadena:String;
resultado:boolean;
begin
  cadena:='SELECT * FROM usuario WHERE nombre = ' + QuotedStr(usuario) + ' AND contrasena = ' + QuotedStr(contrasena);
  QGeneral.Active:=false;
  QGeneral.SQL.Text:=cadena;
  QGeneral.Active:=true;
  if(QGeneral.RecordCount = 1) then
  begin
  nombre:=QGeneral.FieldByName('nombre').Value;
  buscarPersona:=true;
  end
  else
  begin
  buscarPersona:=false;
  end;
end;



procedure TDMtintoreria.TClienteCalcFields(DataSet: TDataSet);
begin
  TClienteNombreCompleto.Value:= TClientenombre.Value+' '+TClienteaPaterno.Value+' '+TClienteaMaterno.Value;

  end;



procedure TDMtintoreria.TEmpleadoCalcFields(DataSet: TDataSet);
begin
     TEmpleadonombreCompleto.Value:= TEmpleadonombre.Value+ ' '+ TEmpleadoaPaterno.Value+' ' +TEmpleadoaMaterno.Value;
end;

procedure TDMtintoreria.TventaServicioCalcFields(DataSet: TDataSet);
begin
    TventaServicioNumeroVenta.Value:=  TventaServicioidVentaServicio.Value;
end;

end.
