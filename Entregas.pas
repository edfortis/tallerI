unit Entregas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TFEntregas = class(TForm)
    DBGrid1: TDBGrid;
    btnReporte: TBitBtn;
    btnEliminarEntregas: TBitBtn;
    procedure btnReporteClick(Sender: TObject);
    procedure btnEliminarEntregasClick(Sender: TObject);
    Procedure VaciarTabla();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEntregas: TFEntregas;

implementation
          uses  UDMtintoreria;
{$R *.dfm}

Procedure TFEntregas.VaciarTabla();
var
cadena:string;

begin

cadena:='SET FOREIGN_KEY_CHECKS = 0';
   DMtintoreria.Qgeneral.Active:=false;
   DMtintoreria.Qgeneral.SQL.Text:=cadena;
   DMtintoreria.Qgeneral.ExecSQL;

cadena:='TRUNCATE TABLE Entrega';
   DMtintoreria.Qgeneral.Active:=false;
   DMtintoreria.Qgeneral.SQL.Text:=cadena;
   DMtintoreria.Qgeneral.ExecSQL;

cadena:='SET FOREIGN_KEY_CHECKS = 1';
   DMtintoreria.Qgeneral.Active:=false;
   DMtintoreria.Qgeneral.SQL.Text:=cadena;
   DMtintoreria.Qgeneral.ExecSQL;

DMtintoreria.Tentregas.Close;
 DMtintoreria.Tentregas.Open;
  ShowMessage('Vaciado de registros exitoso');
   end;

procedure TFEntregas.btnEliminarEntregasClick(Sender: TObject);
begin
   VaciarTabla();
end;

procedure TFEntregas.btnReporteClick(Sender: TObject);
var
rutaExe:STRING;
begin
rutaEXE:=ExtractFilePath(Application.ExeName);
DMTintoreria.RvProject1.ProjectFile:=rutaEXE+'\Reportes\ReporteEntregas.rav';
DMTintoreria.RvProject1.ExecuteReport('ReporteEntregas');
end;
end.
