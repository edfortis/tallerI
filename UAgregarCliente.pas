unit UAgregarCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFAgregarCliente = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ETNombre: TEdit;
    ETPaterno: TEdit;
    ETMaterno: TEdit;
    Label5: TLabel;
    ETDireccion: TEdit;
    Label6: TLabel;
    ETTelefono: TEdit;
    BTNGuardar: TBitBtn;
    BTNCancelar: TBitBtn;
    procedure BTNGuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BTNCancelarClick(Sender: TObject);
    procedure ETNombreKeyPress(Sender: TObject; var Key: Char);
    procedure ETPaternoKeyPress(Sender: TObject; var Key: Char);
    procedure ETMaternoKeyPress(Sender: TObject; var Key: Char);
    procedure ETTelefonoKeyPress(Sender: TObject; var Key: Char);
    function  valida(nombre:String):boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAgregarCliente: TFAgregarCliente;

implementation
         uses UCliente,UDMtintoreria;
{$R *.dfm}

procedure TFAgregarCliente.BTNCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFAgregarCliente.BTNGuardarClick(Sender: TObject);
var
cadena:string;
begin
if (UCliente.bandera = 0) and (valida(ETNombre.Text) =  false) then
  begin
    cadena := 'INSERT INTO `tintoreria`.`cliente`(`nombre`,`aPaterno`,`aMaterno`,`telefono`,`direccion`)VALUES('+QuotedStr(ETNombre.Text)+','+QuotedStr(ETPaterno.Text)+','+QuotedStr(ETMaterno.Text)+','+QuotedStr(ETTelefono.Text)+','+QuotedStr(ETDireccion.Text)+')';
  end
  else
  begin
    cadena := 'UPDATE `tintoreria`.`cliente`SET `nombre` ='+QuotedStr(ETNombre.Text)+' ,`aPaterno` ='+QuotedStr(ETPaterno.Text)+',`aMaterno` ='+QuotedStr(ETMaterno.Text)+' ,`telefono` ='+QuotedStr(ETTelefono.Text)+' ,`direccion` = '+QuotedStr(ETDireccion.Text)+' WHERE `idCliente` ='+ IntToStr( UCliente.identificador);
  end;
  DMtintoreria.QGeneral.Active:=false;
  DMtintoreria.QGeneral.SQL.Text:=cadena;
  DMtintoreria.QGeneral.ExecSQL;
  DMtintoreria.TCliente.Requery;
  Close;
end;

procedure TFAgregarCliente.ETMaternoKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #8)
or ((Key >= 'a') and (Key <= 'z'))
or ((Key >= 'A') and (Key <= 'Z')) then
else abort;
end;

procedure TFAgregarCliente.ETNombreKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #8)
or ((Key >= 'a') and (Key <= 'z'))
or ((Key >= 'A') and (Key <= 'Z')) then
else abort;
end;

procedure TFAgregarCliente.ETPaternoKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #8)
or ((Key >= 'a') and (Key <= 'z'))
or ((Key >= 'A') and (Key <= 'Z')) then
else abort;
end;

procedure TFAgregarCliente.ETTelefonoKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #8)
or ((Key >= '0') and (Key <= '9')) then
else abort;
end;

procedure TFAgregarCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.CreateForm(TFCliente, FCliente);
  FCliente.Show;
end;

procedure TFAgregarCliente.FormCreate(Sender: TObject);
var
cadena:String;
begin
  if UCliente.bandera = 0 then
  begin

  end
  else
  begin
  //modifica
    cadena:='SELECT * FROM cliente WHERE idCliente = '+IntToStr( UCliente.identificador);
    DMtintoreria.QGeneral.Active:=false;
    DMtintoreria.QGeneral.SQL.Text:=cadena;
    DMtintoreria.QGeneral.Active:=true;
    ETNombre.Text:= DMtintoreria.QGeneral.FieldByName('nombre').AsString;
    ETPaterno.Text:= DMtintoreria.QGeneral.FieldByName('aPaterno').AsString;
    ETMaterno.Text:= DMtintoreria.QGeneral.FieldByName('aMaterno').AsString;
    ETDireccion.Text:=DMtintoreria.QGeneral.FieldByName('direccion').AsString;
    ETTelefono.Text:=DMtintoreria.QGeneral.FieldByName('telefono').AsString;
  end;

end;
function TFAgregarCliente.valida(nombre:String):boolean;
var
cadena:String;

begin
    cadena:= 'SELECT * FROM cliente WHERE nombre = '+QuotedStr(nombre);
    DMtintoreria.QGeneral.Active:=false;
    DMtintoreria.QGeneral.SQL.Text:=cadena;
    DMtintoreria.QGeneral.Active:=true;
    if DMtintoreria.QGeneral.RecordCount > 0 then
    begin
        ShowMessage('El cliente ya existe');
        valida:=true;
    end
    else
    begin
       valida:=false;
    end;
end;

end.
