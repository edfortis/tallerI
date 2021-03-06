unit UCatalogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, pngimage, Menus;

type
  TFCatalogo = class(TForm)
    DBGEmpleado: TDBGrid;
    BTNBuscar: TBitBtn;
    EBuscar: TEdit;
    agregar: TImage;
    modificar: TImage;
    borrar: TImage;
    MainMenu1: TMainMenu;
    Catlogos1: TMenuItem;
    Empleado1: TMenuItem;
    Usuario1: TMenuItem;
    Cliente1: TMenuItem;
    Servicio1: TMenuItem;
    procedure BTNBuscarClick(Sender: TObject);

    procedure agregarClick(Sender: TObject);
    procedure modificarClick(Sender: TObject);
    procedure borrarClick(Sender: TObject);
    procedure ReporteClick(Sender: TObject);
    procedure Usuario1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Servicio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCatalogo: TFCatalogo;
  identificador:Integer;
implementation
        uses UDMtintoreria,UAgregarEmpleado,UUsuario,UCliente,UServicio;
{$R *.dfm}

procedure TFCatalogo.borrarClick(Sender: TObject);
var buttonSelected:Integer;
identi:Integer;
cadena:String;
begin
   // Show a confirmation dialog
  buttonSelected := MessageDlg('�Est� seguro?',mtConfirmation , mbOKCancel, 0);

  // Show the button type selected
  if buttonSelected = mrOK then
  try
     identi:=DMtintoreria.TEmpleado.FieldByName('idEmpleado').AsInteger;
     cadena:='DELETE FROM empleado WHERE idEmpleado = '+ IntToStr(identi);
     DMtintoreria.QGeneral.Active:=false;
     DMtintoreria.QGeneral.SQL.Text:=cadena;
     DMtintoreria.QGeneral.ExecSQL;
     DMtintoreria.TEmpleado.Requery;
  except
    ShowMessage('Imposible borrar ahora este registro');
  end;
  ;
  if buttonSelected = mrCancel then ShowMessage('Cancel pressed');
end;

procedure TFCatalogo.BTNBuscarClick(Sender: TObject);
  var
  query:String;
begin

  //query:='SELECT CONCAT_WS('' '',nombre, aPaterno, aMaterno) AS NombreCompleto, correoElectronico as CorreoElectronico, telefono as Tel�fono FROM empleado WHERE aPaterno LIKE'+QuotedStr('%'+EBuscar.Text+'%');
  //query:='SELECT * FROM empleado WHERE  aPaterno LIKE '+QuotedStr('%'+EBuscar.Text+'%');
  DMTintoreria.QClientes.Active:=false;
  DMTintoreria.QClientes.SQL.Text:=query;
  DMTintoreria.QClientes.Active:=true;
//DMTintoreria.TEmpleado.FieldDefList;
  //DBGEmpleado.DataSource:=DMTintoreria.DSQUsuario;
  //DBGEmpleado.Refresh;
//DMTintoreria.TEmpleado.FieldByName('idEmpleado').Visible:=false;
end;



procedure TFCatalogo.Cliente1Click(Sender: TObject);
begin
     Application.CreateForm(TFCliente, FCliente);
     FCliente.Show;
end;

procedure TFCatalogo.ReporteClick(Sender: TObject);
var rutaEXE: String;
begin
rutaEXE:=ExtractFilePath(Application.ExeName);
DMtintoreria.RvProject1.ProjectFile:=rutaEXE+'reportes\Project1.rav';
DMtintoreria.RvProject1.ExecuteReport('ReporteCliente');

end;

procedure TFCatalogo.Servicio1Click(Sender: TObject);
begin
          Application.CreateForm(TFServicio, FServicio);
          FServicio.Show;
          Close;
end;

procedure TFCatalogo.Usuario1Click(Sender: TObject);
begin
   Application.CreateForm(TFUsuario, FUsuario);
   FUsuario.Show;
   Close;
end;

procedure TFCatalogo.agregarClick(Sender: TObject);
begin
  Application.CreateForm(TUAgregar, UAgregar);
  UAgregar.Caption := 'Agregar Empleado';
  UAgregar.Show;
  UDMtintoreria.bandera:= 0;
  Close;
end;

procedure TFCatalogo.modificarClick(Sender: TObject);
begin
  UDMtintoreria.bandera:= 1;
  identificador:= DMtintoreria.TEmpleado.FieldByName('idEmpleado').AsInteger;
  Application.CreateForm(TUAgregar, UAgregar);
  UAgregar.Caption := 'Modificar Empleado';
  UAgregar.Show;
  Close;
end;

end.
