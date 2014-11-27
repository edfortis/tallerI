unit UuServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, dblookup, DBCtrls, DB, ADODB, Buttons;

type
  TFServicios = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ETotal: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    DBLServicio: TDBLookupComboBox;
    DBServicios: TDBGrid;
    EPVariacion: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ECambio: TEdit;
    BtnCobrar: TButton;
    Label4: TLabel;
    EEfectivo: TEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EFecha: TEdit;
    EdNombreE: TEdit;
    EdApellidoP: TEdit;
    EdNombreCliente: TEdit;
    EdApellidoPaternoCliente: TEdit;
    BtnRevertir: TButton;
    BtbAgregar: TBitBtn;
    DBVentas: TDBGrid;
    lblporcentaje: TLabel;
    lblprecioVariacion: TLabel;
    Label12: TLabel;
    LblCambioV: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    btnAgregar: TBitBtn;
    DBLPrenda: TDBLookupComboBox;
    lblID: TLabel;
    Function ConsultarPrecio(Prenda:String):Real;
    Function ConsultarVariacion(Prenda:String):Real;
     function calculaCambio(Precio:real):real;
    procedure BtbAgregarClick(Sender: TObject);
   function consultarIdEmpleado(Nombre: String; ApellidoP:String):integer;
   function consultarIdCliente(Nombre: String; ApellidoP:String):integer;
    procedure BtnCobrarClick(Sender: TObject);
   procedure InsertarFecha(fecha:String);
    procedure RegistrarVentaServicio(Fe:String;IDempleado:Integer; idEntrega:integer; idCliente:Integer );
    function regresaIdFecha():integer;
    function ValidaCampos():boolean;
    procedure BtnRevertirClick(Sender: TObject);
    Procedure insertaCarrito(IDCatalogo:Integer; IDVentaServicio:integer; cantidad:integer);
    function IDVenta():integer;
    procedure btnAgregarClick(Sender: TObject);
    Function ConsultarIDServicio(Prenda:String):Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FServicios: TFServicios;


implementation
             uses  ULogin,UDMtintoreria,UCatalogo;
{$R *.dfm}

Function TFServicios.ConsultarPrecio(Prenda:String):Real;    //Consulta el precio de una prenda
var
cadena:String;
resultado:real;
begin
   cadena:='SELECT precio from CatalogoServicio where descripcion= '+ QuotedStr(prenda);
   DMtintoreria.Qgeneral.Active:=false;
   DMtintoreria.Qgeneral.SQL.Text:=cadena;
   DMtintoreria.Qgeneral.Active:=true;
   Resultado := DMtintoreria.QGeneral.Fields[0].AsFloat;
   ConsultarPrecio:=Resultado;
end;

Function TFServicios.ConsultarIDServicio(Prenda:String):Integer;    //Consulta el precio de una prenda
var
cadena:String;
resultado:Integer;
begin
   cadena:='SELECT idCatalogoServicio from CatalogoServicio where descripcion= '+ QuotedStr(prenda);
   DMtintoreria.Qgeneral.Active:=false;
   DMtintoreria.Qgeneral.SQL.Text:=cadena;
   DMtintoreria.Qgeneral.Active:=true;
   Resultado := DMtintoreria.QGeneral.Fields[0].AsInteger;
   ConsultarIDServicio:=Resultado;
end;

Function TFServicios.ConsultarVariacion(Prenda:String):Real;    //Consulta el precio de una prenda
var
cadena:String;
resultado:real;
begin
   cadena:='SELECT porcentaje from CatalogoServicio where descripcion= '+ QuotedStr(prenda);
   DMtintoreria.Qgeneral.Active:=false;
   DMtintoreria.Qgeneral.SQL.Text:=cadena;
   DMtintoreria.Qgeneral.Active:=true;
   Resultado := DMtintoreria.QGeneral.Fields[0].AsFloat;
    ConsultarVariacion:=Resultado;
end;

Procedure TFServicios.InsertarFecha(fecha:String);
var
cadena:string;
resultado:integer;
begin

 cadena:='INSERT into entrega (fechaEntrega) values (' + QuotedStr(fecha) + ')';
   DMtintoreria.Qgeneral.Active:=false;
   DMtintoreria.Qgeneral.SQL.Text:=cadena;
   DMtintoreria.Qgeneral.ExecSQL;

//INSERCION DE FECHAS
end;
function TFServicios.regresaIdFecha():integer;
var
cadena:string;
resultado:integer;
begin
cadena:='SELECT MAX(identrega) from entrega';
   DMtintoreria.Qgeneral.Active:=false;
   DMtintoreria.Qgeneral.SQL.Text:=cadena;
   DMtintoreria.Qgeneral.Active:=true;
   Resultado := DMtintoreria.QGeneral.Fields[0].AsInteger;
   regresaIDFecha:=Resultado;
end;

function TFServicios.IDVenta():integer;
var
cadena:string;
resultado:integer;
begin
cadena:='SELECT MAX(idVentaServicio) from VentaServicio';
   DMtintoreria.Qgeneral.Active:=false;
   DMtintoreria.Qgeneral.SQL.Text:=cadena;
   DMtintoreria.Qgeneral.Active:=true;
   Resultado := DMtintoreria.QGeneral.Fields[0].AsInteger;
   IDVenta:=Resultado;
end;

function TFServicios.consultarIdEmpleado(Nombre: String; ApellidoP:String):integer;
var
cadena:String;
resultado:integer;
begin
     cadena:='SELECT idEmpleado from empleado where nombre= '+ QuotedStr(Nombre) + 'and' + '(apaterno = ' + QuotedStr(ApellidoP) + ')';
   DMtintoreria.Qgeneral.Active:=false;
   DMtintoreria.Qgeneral.SQL.Text:=cadena;
   DMtintoreria.Qgeneral.Active:=true;
   Resultado := DMtintoreria.QGeneral.Fields[0].AsInteger;
    ConsultarIDEmpleado:=Resultado;
end;

function TFServicios.consultarIdCliente(Nombre: String; ApellidoP:String):integer;
var
cadena:String;
resultado:integer;
begin
   cadena:='SELECT idCliente from Cliente where nombre = ' + QuotedStr(Nombre) + 'and' + '(apaterno = ' + QuotedStr(ApellidoP) + ')';
   DMtintoreria.Qgeneral.Active:=false;
   DMtintoreria.Qgeneral.SQL.Text:=cadena;
   DMtintoreria.Qgeneral.Active:=true;
   Resultado := DMtintoreria.QGeneral.Fields[0].AsInteger;
    ConsultarIDCliente:=Resultado;
end;

procedure TFServicios.btnAgregarClick(Sender: TObject);
begin

      lblID.Caption:= IntToStr(IDVenta+1);
      insertaCarrito(ConsultarIDServicio(DBLPrenda.Text), StrToInt(lblID.Caption), StrToInt(ETotal.Text));


       end;


procedure TFServicios.BtnCobrarClick(Sender: TObject);
var
cambio:real;
begin
if ((EEfectivo.Text = '') ) then
begin
 ShowMessage('El campo efectivo no puede estar vacio');
end
  else
  begin
 cambio:=calculaCambio(ConsultarPrecio(DBLPrenda.Text));
 if (cambio < 0) then
 begin
  ShowMessage('Efectivo insuficiente');
   end
  else
  ECambio.Text := FloatToStr(cambio);
   end;
   if (EPVariacion.Text <> '') then
   begin

     lblporcentaje.Caption:= FloatToStr(ConsultarPrecio(DBLPrenda.Text) * StrToInt(ETotal.Text));
      lblprecioVariacion.Caption:= FloatToStr(((StrToInt(EPVariacion.Text) * StrToInt(lblporcentaje.Caption))/100 ) + StrToInt(lblporcentaje.Caption));
       LblCambioV.Caption:=  FloatToStr(StrToInt(EEfectivo.Text) - StrToFloat(lblprecioVariacion.Caption))
   end;

  end;
Procedure TFServicios.insertaCarrito(IDCatalogo:Integer; IDVentaServicio:integer; cantidad:integer);
  var
cadena:String;
begin
   cadena:='INSERT INTO carrito (catalogoServicio_IDCatalogoServicio, VentaServicio_IDVentaServicio, cantidad) Values (' + QuotedStr(IntToStr(IDCatalogo)) + ',' + QuotedStr(IntToStr(IDVentaServicio)) + ',' + QuotedStr(IntToStr(cantidad)) + ')';
   DMtintoreria.Qgeneral.Active:=false;
   DMtintoreria.Qgeneral.SQL.Text:=cadena;
   DMtintoreria.Qgeneral.ExecSQL;
     ShowMessage('agregado correctamente al carrito');
  end;

procedure TFServicios.BtnRevertirClick(Sender: TObject);
begin


ETotal.Text := '';
EdNombreE.Text := '';
EdNombreCliente.Text := '';
EdApellidoP.Text := '';
EdApellidoPaternoCliente.Text := '';
EFecha.Text := '';

end;

function TFServicios.calculaCambio(Precio:real):real;
var
cambio:Real;

begin
cambio := StrToInt(EEfectivo.Text) - (precio * StrToInt(ETotal.Text));
calculaCambio:=cambio;

end;

procedure TFServicios.RegistrarVentaServicio(Fe:String;IDempleado:Integer; idEntrega:integer; idCliente:Integer );
var
cadena:String;
fecha:string;
empleado:string;
entrega:string;
cliente:string;
begin
   empleado:= IntToStr(IDempleado);
   entrega:=IntToStr(idEntrega);
   cliente:= IntToStr(idCliente);
   cadena:='INSERT INTO ventaServicio (Fecha, empleado_idempleado, entrega_identrega,cliente_idcliente) values (' + QuotedStr(Fe) + ',' + QuotedStr(empleado)+ ',' + QuotedStr(entrega)+ ',' + QuotedStr(cliente) + ')';
   DMtintoreria.QRegistrarVentaServicio.Active:=false;
   DMtintoreria.QRegistrarVentaServicio.SQL.Text:=cadena;
   DMtintoreria.QRegistrarVentaServicio.ExecSQL;
   ShowMessage('Registro agregado correctamente');
end;



function TFServicios.ValidaCampos():boolean;
begin
if ((DBLPrenda.Text = '') or (ETotal.Text = '') or (DBLServicio.Text='') or (EdNombreE.Text = '') or (EdNombreCliente.Text = '')or (EdApellidoP.Text = '') or (EdApellidoPaternoCliente.Text = '')or (EFecha.Text = '')) then
begin
ValidaCampos:=true;
end
else
  begin
ValidaCampos:=false;
       end

end;

procedure TFServicios.BtbAgregarClick(Sender: TObject);
var
cad:String;
Fecha: TDateTime;
idEmpleado:integer;
idCliente:Integer;
idEntrega:Integer;
begin

if (ValidaCampos) then
begin
  ShowMessage('No puede haber campos vacios, favor de verificar');
end
else
begin
idEmpleado:= consultarIdEmpleado(EdNombreE.Text,EdApellidoP.Text);
idCliente:= consultarIdCliente(EdNombreCliente.Text, EdApellidoPaternoCliente.Text);
InsertarFecha(EFecha.Text);
idEntrega:= regresaIdFecha();
Fecha:= date();
RegistrarVentaServicio(FormatDateTime('yy/mm/dd', Fecha),idEmpleado,idEntrega,idCliente);

DMtintoreria.TventaServicio.Close;
DMtintoreria.TventaServicio.Open;


end;


end;

end.
