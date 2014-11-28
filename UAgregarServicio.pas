unit UAgregarServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFServicioAgregar = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    ETPrecio: TEdit;
    ETTipo: TEdit;
    BTNGuardar: TBitBtn;
    BTNCancelar: TBitBtn;
    ETPorcetanje: TEdit;
    Label2: TLabel;
    ETRespuesta: TEdit;
    procedure BTNGuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BTNCancelarClick(Sender: TObject);
    procedure ETPrecioKeyPress(Sender: TObject; var Key: Char);
    procedure ETPorcetanjeKeyPress(Sender: TObject; var Key: Char);
    procedure ETRespuestaKeyPress(Sender: TObject; var Key: Char);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FServicioAgregar: TFServicioAgregar;

implementation
    uses   UDMtintoreria,UServicio;
{$R *.dfm}

procedure TFServicioAgregar.BTNCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFServicioAgregar.BTNGuardarClick(Sender: TObject);
var
cadena:String;

begin
  if UServicio.bandera = 0 then
  begin
    cadena := 'INSERT INTO `tintoreria`.`catalogoservicio` (`idCatalogoServicio`,  `precio`,`tipo`,`porcentaje`,`minutos`)VALUES (null,'+ETPrecio.Text+','+QuotedStr(ETTipo.Text)+','+ ETPorcetanje.Text+','+ETRespuesta.Text+')';
  end
  else
  begin
    cadena := 'UPDATE `tintoreria`.`catalogoservicio` SET `precio` = '+ETPrecio.Text+',`tipo` = '+QuotedStr(ETTipo.Text)+', `porcentaje` = '+ETPorcetanje.Text+', `minutos` = '+ETRespuesta.Text+' WHERE `idCatalogoServicio` = '+IntToStr( UServicio.inde);
  end;
  DMtintoreria.QGeneral.Active:=false;
  DMtintoreria.QGeneral.SQL.Text:=cadena;
  DMtintoreria.QGeneral.ExecSQL;
  DMtintoreria.TServicio.Requery;
  Close;
end;

procedure TFServicioAgregar.ETPorcetanjeKeyPress(Sender: TObject;
  var Key: Char);
begin
if (Key = #8)
or ((Key >= '0') and (Key <= '9'))or (key = '%')   then
else abort;
end;

procedure TFServicioAgregar.ETPrecioKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #8)
or ((Key >= '0') and (Key <= '9'))or (key = '$') or (key = '.') then
else abort;
end;



procedure TFServicioAgregar.ETRespuestaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #8)
or ((Key >= '0') and (Key <= '9'))or (key = '$') or (key = '.') then
else abort;
end;

procedure TFServicioAgregar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Application.CreateForm(TFServicio, FServicio);
   FServicio.Show;
end;

procedure TFServicioAgregar.FormCreate(Sender: TObject);
var
cadena:String;
begin
if UServicio.bandera = 0 then
begin

end
else
begin
  //modificar Servicio
  cadena:='SELECT * FROM catalogoservicio WHERE idCatalogoServicio = '+ IntToStr(UServicio.inde);
  DMtintoreria.QGeneral.Active:=false;
  DMtintoreria.QGeneral.SQL.Text:=cadena;
  DMtintoreria.QGeneral.Active:=true;

  ETPrecio.Text:=DMtintoreria.QGeneral.FieldByName('precio').AsString;
  ETTipo.Text:=DMtintoreria.QGeneral.FieldByName('tipo').AsString;
  ETPorcetanje.Text:=DMtintoreria.QGeneral.FieldByName('porcentaje').AsString;
  ETRespuesta.Text:=DMtintoreria.QGeneral.FieldByName('minutos').AsString;

  end;
end;

end.
