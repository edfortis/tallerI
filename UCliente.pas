unit UCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, Grids, DBGrids, pngimage, ExtCtrls;

type
  TFCliente = class(TForm)
    agregar: TImage;
    modificar: TImage;
    borrar: TImage;
    DBGEmpleado: TDBGrid;
    BTNBuscar: TBitBtn;
    EBuscar: TEdit;
    MainMenu1: TMainMenu;
    Catlogos1: TMenuItem;
    Empleado1: TMenuItem;
    Usuario1: TMenuItem;
    Cliente1: TMenuItem;
    Servicio1: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
    procedure agregarClick(Sender: TObject);
    procedure modificarClick(Sender: TObject);
    procedure borrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCliente: TFCliente;
  bandera:integer;
  identificador:Integer;
implementation
       uses UAgregarCliente,UDMtintoreria,ComObj;
{$R *.dfm}

procedure TFCliente.agregarClick(Sender: TObject);
begin
  bandera := 0;
  Application.CreateForm(TFAgregarCliente, FAgregarCliente);
  FAgregarCliente.Caption:='Agregar Clientes';
  FAgregarCliente.Show;
  Close;
end;

procedure TFCliente.borrarClick(Sender: TObject);
var buttonSelected:Integer;
identi:Integer;
cadena:String;
begin
   // Show a confirmation dialog
  buttonSelected := MessageDlg('¿Está seguro?',mtConfirmation , mbOKCancel, 0);

  // Show the button type selected
  if buttonSelected = mrOK then
  try
     identi:=DMtintoreria.TCliente.FieldByName('idCliente').AsInteger;
     cadena:='DELETE FROM cliente WHERE idCliente = '+ IntToStr(identi);
     DMtintoreria.QGeneral.Active:=false;
     DMtintoreria.QGeneral.SQL.Text:=cadena;
     DMtintoreria.QGeneral.ExecSQL;
     DMtintoreria.TCliente.Requery;
  except
     on E: EOleError do
    ShowMessage('Imposible borrar ahora este registro');
  end;
  ;
  if buttonSelected = mrCancel then ShowMessage('presiono cancelar');

end;

procedure TFCliente.Cliente1Click(Sender: TObject);
begin
 Application.CreateForm(TFCliente, FCliente);
 FCliente.Show;
end;

procedure TFCliente.modificarClick(Sender: TObject);
begin
  bandera := 1;
  identificador:= DMtintoreria.TCliente.FieldByName('idCliente').AsInteger;
  Application.CreateForm(TFAgregarCliente, FAgregarCliente);
  FAgregarCliente.Caption:='Modificar Cliente';
  FAgregarCliente.Show;
  Close;
end;

end.
