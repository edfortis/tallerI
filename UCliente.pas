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
    procedure Cliente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCliente: TFCliente;

implementation

{$R *.dfm}

procedure TFCliente.Cliente1Click(Sender: TObject);
begin
 Application.CreateForm(TFCliente, FCliente);
 FCliente.Show;
end;

end.
