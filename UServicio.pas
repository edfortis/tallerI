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
    Reporte: TImage;
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

uses UAgregarServicio;

{$R *.dfm}

procedure TFServicio.agregarClick(Sender: TObject);
begin
  Application.CreateForm(TFServicioAgregar, FServicioAgregar);
  bandera:=0;
  FServicioAgregar.Show;
  Close;
end;

procedure TFServicio.modificarClick(Sender: TObject);
begin
  Application.CreateForm(TFServicioAgregar, FServicioAgregar);
  bandera:=1;
  FServicioAgregar.Show;
  Close;
end;

end.