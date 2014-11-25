unit UServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, Grids, DBGrids, pngimage, ExtCtrls;

type
  TFServicio = class(TForm)
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
    procedure agregarClick(Sender: TObject);
    procedure modificarClick(Sender: TObject);
    procedure borrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FServicio: TFServicio;
   bandera:Integer;
   inde:Integer;
implementation

uses UAgregarServicio,UDMtintoreria;

{$R *.dfm}

procedure TFServicio.agregarClick(Sender: TObject);
begin

  bandera:=0;
  Application.CreateForm(TFServicioAgregar, FServicioAgregar);
  FServicioAgregar.Caption:='Agregar Servicio';
  FServicioAgregar.Show;
  Close;
end;

procedure TFServicio.borrarClick(Sender: TObject);
  var buttonSelected:Integer;
identi:Integer;
cadena:String;
begin
  // Show a confirmation dialog
  buttonSelected := MessageDlg('¿Está seguro?',mtConfirmation , mbOKCancel, 0);

  // Show the button type selected
  if buttonSelected = mrOK then
  try
     identi:=DMtintoreria.TServicio.FieldByName('idCatalogoServicio').AsInteger;
     cadena:='DELETE FROM catalogoservicio WHERE idCatalogoServicio = '+ IntToStr(identi);
     DMtintoreria.QGeneral.Active:=false;
     DMtintoreria.QGeneral.SQL.Text:=cadena;
     DMtintoreria.QGeneral.ExecSQL;
     DMtintoreria.TServicio.Requery;
   Except
    ShowMessage('Campo referenciado no puedes borrar');
   end;
  ;
  if buttonSelected = mrCancel then ShowMessage('Cancel pressed');
end;

procedure TFServicio.modificarClick(Sender: TObject);
begin
  bandera:=1;
  inde:=DMtintoreria.TServicio.FieldByName('idCatalogoServicio').AsInteger;
  Application.CreateForm(TFServicioAgregar, FServicioAgregar);
  FServicioAgregar.Caption:='Agregar Servicio';
  FServicioAgregar.Show;
  Close;
end;

end.
