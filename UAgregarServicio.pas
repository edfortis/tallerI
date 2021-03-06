unit UAgregarServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFServicioAgregar = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    ETDescripcion: TEdit;
    ETPrecio: TEdit;
    ETTipo: TEdit;
    BTNGuardar: TBitBtn;
    BTNCancelar: TBitBtn;
    ETPorcetanje: TEdit;
    procedure BTNGuardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BTNCancelarClick(Sender: TObject);

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
    cadena := 'INSERT INTO `tintoreria`.`catalogoservicio` (`idCatalogoServicio`, `descripcion`, `precio`,`tipo`,`porcentaje`)VALUES (null,'+QuotedStr(ETDescripcion.Text)+','+ETPrecio.Text+','+QuotedStr(ETTipo.Text)+','+ ETPorcetanje.Text+')';
  end
  else
  begin
    cadena := 'UPDATE `tintoreria`.`catalogoservicio` SET `descripcion` = '+QuotedStr(ETDescripcion.Text)+',`precio` = '+ETPrecio.Text+',`tipo` = '+QuotedStr(ETTipo.Text)+', `porcentaje` = '+ETPorcetanje.Text+' WHERE `idCatalogoServicio` = ';
  end;
  DMtintoreria.QGeneral.Active:=false;
  DMtintoreria.QGeneral.SQL.Text:=cadena;
  DMtintoreria.QGeneral.ExecSQL;
  DMtintoreria.TServicio.Requery;
  Close;
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
  ETDescripcion.Text:=DMtintoreria.QGeneral.FieldByName('descripcion').AsString;
  ETPrecio.Text:=DMtintoreria.QGeneral.FieldByName('precio').AsString;
  ETTipo.Text:=DMtintoreria.QGeneral.FieldByName('tipo').AsString;
  ETPorcetanje.Text:=DMtintoreria.QGeneral.FieldByName('porcentaje').AsString;


  end;
end;

end.
