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
    RvStados: TRvDataSetConnection;
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
    TCliente: TADOTable;
    DSTCliente: TDataSource;
    TClienteidCliente: TIntegerField;
    TClientenombre: TWideStringField;
    TClienteaPaterno: TWideStringField;
    TClienteaMaterno: TWideStringField;
    TClientetelefono: TWideStringField;
    TClientedireccion: TWideStringField;
    TClienteNombreCompleto: TStringField;
    TServicio: TADOTable;
    DSTServicio: TDataSource;
    TServicioidCatalogoServicio: TIntegerField;
    TServicioprecio: TFloatField;
    TServiciotipo: TWideStringField;
    TServicioporcentaje: TIntegerField;
    TServiciominutos: TIntegerField;
    procedure TEmpleadoCalcFields(DataSet: TDataSet);
    procedure TClienteCalcFields(DataSet: TDataSet);

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
  cadena:='SELECT * FROM usuario WHERE BINARY nombre='+QuotedStr(usuario)+' AND contrasena='+QuotedStr(contrasena);
  QGeneral.Active:=false;
  QGeneral.SQL.Text:=cadena;
  QGeneral.Active:=true;
  if(QGeneral.RecordCount = 1) then
  begin
  resultado:=true;
  nombre:=QGeneral.FieldByName('nombre').Value;
  end
  else
  begin
  resultado:=false;
  Result:=resultado;
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

end.
