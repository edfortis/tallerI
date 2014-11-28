unit UuServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, dblookup, DBCtrls, DB, ADODB, Buttons;

type
  TFServicios = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    DBLServicio: TDBLookupComboBox;
    DBServicios: TDBGrid;
    EPVariacion: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ECambio: TEdit;
    Label4: TLabel;
    EEfectivo: TEdit;
    GroupBox2: TGroupBox;
    DBVentas: TDBGrid;
    lblporcentaje: TLabel;
    lblprecioVariacion: TLabel;
    Label12: TLabel;
    LblCambioV: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EPrenda: TEdit;
    btnCobrar: TBitBtn;
    btnAgregar: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    EFecha: TEdit;
    BtnRevertir: TButton;
    BtbAgregar: TBitBtn;
    DBEmpleado: TDBLookupComboBox;
    DBLCliente: TDBLookupComboBox;
    lblID: TLabel;
    ETotal: TEdit;
    Function ConsultarPrecio(Prenda:String):Real;
    Function ConsultarVariacion(Prenda:String):Real;
     function calculaCambio(Precio:real):real;
    procedure BtbAgregarClick(Sender: TObject);
   function consultarIdEmpleado(Nombre: String; ApellidoP:String):integer;
   function consultarIdCliente(Nombre: String; ApellidoP:String):integer;

  Procedure InsertarFecha(fecha:string; idcliente:integer);
    procedure RegistrarVentaServicio(Fe:String;IDempleado:Integer; idEntrega:integer; idCliente:Integer );
    function regresaIdFecha():integer;
    function ValidaCampos():boolean;
    procedure BtnRevertirClick(Sender: TObject);
    Procedure insertaCarrito(IDCatalogo:Integer; IDVentaServicio:integer; Prenda:String;cantidad:integer; TotalParcial:Double);
    function IDVenta():integer;
    procedure btnAgregarClick(Sender: TObject);
    Function ConsultarIDServicio(Prenda:String):Integer;
    procedure btnCobrarClick(Sender: TObject);
    function SumaTotalParcial(idServicios:integer):integer;
    function ValidaCampos2():boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FServicios: TFServicios;
       Validacion:boolean;

implementation
             uses  ULogin,UDMtintoreria,UCatalogo;

{$R *.dfm}

Function TFServicios.ConsultarPrecio(Prenda:String):Real;    //Consulta el precio de una prenda
var
cadena:String;
resultado:real;
begin
   cadena:='SELECT precio from CatalogoServicio where tipo= '+ QuotedStr(prenda);
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

Procedure TFServicios.InsertarFecha(fecha:string; idcliente:integer);
var
cadena:string;
resultado:integer;
begin

 cadena:='INSERT into entrega (fechaEntrega, cliente_idcliente) values (' + QuotedStr(fecha) + ',' + QuotedStr(IntToStr(idcliente)) + ')';
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

procedure TFServicios.btnAgregarClick(Sender: TObject);     //////////////Operacion Carrito
var
TotalParcial:Double;
    Ide:Integer;

begin

    if (ValidaCampos2) then
       begin
         ShowMessage('Campos vacios, favor de verificar');
       end
       else
       begin
       if (idVenta = 1) and (validacion) then
         begin
              lblID.Caption:= '1';
         end
         else
          begin
      lblID.Caption:= IntToStr(IDVenta+1);
          end;
     TotalParcial:= ConsultarPrecio(DBLServicio.Text) * StrToInt(ETotal.Text);
     Ide:= DBLServicio.KeyValue;
  insertaCarrito(DBLServicio.KeyValue, StrToInt(lblID.Caption) , EPrenda.Text, StrToInt(ETotal.Text) , TotalParcial);
     DMtintoreria.TCarrito.Close;
      DMtintoreria.TCarrito.Open;
        DMtintoreria.TCarrito.Last;
end

       end;


procedure TFServicios.btnCobrarClick(Sender: TObject);
var
cambio:real;
begin
if ((EEfectivo.Text = '') ) then
begin
 ShowMessage('El campo efectivo no puede estar vacio');
end
  else
  begin
 cambio:= StrToInt(EEfectivo.Text) - StrToInt(lblporcentaje.Caption);
 if (cambio < 0) then
 begin
  ShowMessage('Efectivo insuficiente');
   end
  else
  ECambio.Text := FloatToStr(cambio);
   end;
   if (EPVariacion.Text <> '') then
   begin

      lblprecioVariacion.Caption:= FloatToStr(((StrToInt(EPVariacion.Text) * StrToInt(lblporcentaje.Caption))/100 ) + StrToInt(lblporcentaje.Caption));
       LblCambioV.Caption:=  FloatToStr(StrToInt(EEfectivo.Text) - StrToFloat(lblprecioVariacion.Caption))
   end;

end;

{procedure TFServicios.BtnCobrarClick(Sender: TObject);
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

     lblporcentaje.Caption:= FloatToStr(ConsultarPrecio(EPrenda.Text) * StrToInt(ETotal.Text));
      lblprecioVariacion.Caption:= FloatToStr(((StrToInt(EPVariacion.Text) * StrToInt(lblporcentaje.Caption))/100 ) + StrToInt(lblporcentaje.Caption));
       LblCambioV.Caption:=  FloatToStr(StrToInt(EEfectivo.Text) - StrToFloat(lblprecioVariacion.Caption))
   end;

  end;}
Procedure TFServicios.insertaCarrito(IDCatalogo:Integer; IDVentaServicio:integer; Prenda:String;cantidad:integer; TotalParcial:Double);
  var
cadena:String;
begin
   cadena:='INSERT INTO carrito (catalogoServicio_IDCatalogoServicio, VentaServicio_IDVentaServicio, prenda, cantidad, TotalParcial) Values (' + QuotedStr(IntToStr(IDCatalogo)) + ',' + QuotedStr(IntToStr(IDVentaServicio)) + ',' + QuotedStr(Prenda) + ',' + QuotedStr(IntToStr(cantidad))+ ',' + QuotedStr( FloatToStr( TotalParcial)) + ')';
   DMtintoreria.Qgeneral.Active:=false;
   DMtintoreria.Qgeneral.SQL.Text:=cadena;
   DMtintoreria.Qgeneral.ExecSQL;
     ShowMessage('agregado correctamente al carrito');
  end;



function TFServicios.SumaTotalParcial(idServicios:integer):integer;  ///Suma parcial
var
Cadena:String;
Resultado:integer;
begin
    Cadena:= 'Select  sum(TotalParcial) as suma from Carrito Where ventaServicio_idVentaServicio = ' + QuotedStr( IntToStr(idServicios) );
    DMtintoreria.QGeneral.Active:=false;
    DMtintoreria.QGeneral.SQL.Text:= cadena;
    DMtintoreria.QGeneral.Active:= true;
    Resultado := DMtintoreria.QGeneral.Fields[0].AsInteger;
    SumaTotalParcial:=Resultado;
    end;

procedure TFServicios.BtnRevertirClick(Sender: TObject);
begin


ETotal.Text := '';

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

function TFServicios.ValidaCampos2():boolean;
begin
if ((DBLServicio.Text = '') or (ETotal.Text = '') or  (EPrenda.Text = '')) then
begin
ValidaCampos2:=true;
end
else
  begin
ValidaCampos2:=false;
       end

end;

function TFServicios.ValidaCampos():boolean;
begin
if ((DBLCliente.Text = '') or (DBEmpleado.Text= '') or  (EFecha.Text = '')) then
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

InsertarFecha(EFecha.Text, DBLCliente.KeyValue);
idEntrega:= regresaIdFecha();
Fecha:= date();
RegistrarVentaServicio(FormatDateTime('yy/mm/dd', Fecha),DBEmpleado.KeyValue,idEntrega,DBLCliente.KeyValue);
  validacion:= false;
DMtintoreria.TventaServicio.Close;
DMtintoreria.TventaServicio.Open;
 lblporcentaje.Caption:= IntToStr(SumaTotalParcial(StrToInt(lblID.Caption)));
  DMtintoreria.TventaServicio.Last;

end;

end;



end.
