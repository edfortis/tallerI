unit UAgregarUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons;

type
  TFAgregarUsuario = class(TForm)
    label0: TLabel;
    Label1: TLabel;
    EUsuario: TEdit;
    Label2: TLabel;
    EContrasea˝: TEdit;
    Label3: TLabel;
    TConfirmarCon: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboEmpleados: TDBLookupComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAgregarUsuario: TFAgregarUsuario;

implementation
      uses UUsuario,UDMtintoreria;
{$R *.dfm}

procedure TFAgregarUsuario.BitBtn1Click(Sender: TObject);
var cadena:String;

begin
   if UUsuario.bandera = 0 then
   begin
     cadena:= 'INSERT INTO `tintoreria`.`usuario` (`nombre`,`contrasena`,`empleado_idEmpleado`) VALUES ('+QuotedStr(EUsuario.Text)+','+QuotedStr(EContrasea˝.Text)+','+ IntToStr( ComboEmpleados.KeyValue)+')';
   end
   else
   begin
      cadena:='UPDATE `tintoreria`.`usuario` SET `nombre` = '+QuotedStr(EUsuario.Text)+', `contrasena` =  '+QuotedStr(EContrasea˝.Text)+' , `empleado_idEmpleado` ='+ IntToStr( ComboEmpleados.KeyValue)+'  WHERE `idUsuario` = '+ IntToStr( UUsuario.identificador);
   end;
   DMtintoreria.QGeneral.Active:=false;
   DMtintoreria.QGeneral.SQL.Text:=cadena;
   DMtintoreria.QGeneral.ExecSQL;
   DMtintoreria.TUsuario.Requery;
   Close;

end;

procedure TFAgregarUsuario.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFAgregarUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Application.CreateForm(TFUsuario, FUsuario);
   FUsuario.Show;
end;

procedure TFAgregarUsuario.FormCreate(Sender: TObject);
var
cadena:String;
begin
  if UUsuario.bandera = 0 then
  begin

  end
  else
  begin
  //modificar Usuario
  cadena:='SELECT * FROM usuario WHERE idUsuario = '+ IntToStr(UUsuario.identificador);
  DMtintoreria.QGeneral.Active:=false;
  DMtintoreria.QGeneral.SQL.Text:=cadena;
  DMtintoreria.QGeneral.Active:=true;
  EUsuario.Text:= DMtintoreria.QGeneral.FieldByName('nombre').AsString;
  ComboEmpleados.KeyValue:=DMtintoreria.QGeneral.FieldByName('empleado_idEmpleado').AsInteger;

  end;
end;

end.
