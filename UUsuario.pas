unit UUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, Grids, DBGrids, pngimage, ExtCtrls;

type
  TFUsuario = class(TForm)
    agregar: TImage;
    modificar: TImage;
    borrar: TImage;
    DBGEmpleado: TDBGrid;
    BTNBuscar: TBitBtn;
    EBuscar: TEdit;
    Reporte: TImage;
    MainMenu1: TMainMenu;
    Catlogos1: TMenuItem;
    Empleado1: TMenuItem;
    Usuario1: TMenuItem;
    Cliente1: TMenuItem;
    Servicio1: TMenuItem;
    procedure agregarClick(Sender: TObject);
    procedure modificarClick(Sender: TObject);
    procedure borrarClick(Sender: TObject);
    procedure Empleado1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUsuario: TFUsuario;
  bandera:Integer;
  identificador:Integer;
implementation
      uses UAgregarUsuario, UDMtintoreria,UCatalogo;
{$R *.dfm}

procedure TFUsuario.agregarClick(Sender: TObject);
begin
   Application.CreateForm(TFAgregarUsuario, FAgregarUsuario);
   FAgregarUsuario.Show;
   FAgregarUsuario.Caption:='Agregar Usuario';
   bandera:=0;
   Close;
end;

procedure TFUsuario.borrarClick(Sender: TObject);
var buttonSelected:Integer;
identi:Integer;
cadena:String;
begin
   // Show a confirmation dialog
  buttonSelected := MessageDlg('�Est� seguro?',mtConfirmation , mbOKCancel, 0);

  // Show the button type selected
  if buttonSelected = mrOK then
     identi:=DMtintoreria.TUsuario.FieldByName('idUsuario').AsInteger;
     cadena:='DELETE FROM usuario WHERE idUsuario = '+ IntToStr(identi);
     DMtintoreria.QGeneral.Active:=false;
     DMtintoreria.QGeneral.SQL.Text:=cadena;
     DMtintoreria.QGeneral.ExecSQL;
     DMtintoreria.TUsuario.Requery;
  ;
  if buttonSelected = mrCancel then ShowMessage('Cancel pressed');

end;

procedure TFUsuario.Empleado1Click(Sender: TObject);
begin
  Application.CreateForm(TFCatalogo, FCatalogo);
  FCatalogo.Show;
  Close;
end;

procedure TFUsuario.modificarClick(Sender: TObject);
begin
   identificador:=DMtintoreria.TUsuario.FieldByName('idUsuario').AsInteger;
   bandera:=1;
   Application.CreateForm(TFAgregarUsuario, FAgregarUsuario);
   FAgregarUsuario.Caption:='Modificar Usuario';
   FAgregarUsuario.Show;
   Close;
end;

end.
