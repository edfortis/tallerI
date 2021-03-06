unit UAgregarEmpleado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TUAgregar = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ETNombre: TEdit;
    Label3: TLabel;
    ETPaterno: TEdit;
    Label4: TLabel;
    ETMaterno: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    ETEmail: TEdit;
    Label8: TLabel;
    ETTelefono: TEdit;
    BTNGuardar: TBitBtn;
    BTNCancelar: TBitBtn;
    RSexo: TRadioGroup;
    procedure BTNGuardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UAgregar: TUAgregar;

implementation
      uses UDMtintoreria,UCatalogo;
{$R *.dfm}

procedure TUAgregar.BTNGuardarClick(Sender: TObject);
var
cadena:String;
sexo : String;
begin
  if RSexo.ItemIndex = 0 then
  begin
     sexo:='H';
  end
  else
  begin
    sexo:='M';
  end;
  if bandera = 0 then
  begin
    cadena := 'INSERT INTO `tintoreria`.`empleado`(`idEmpleado`,`nombre`,`aPaterno`,`aMaterno`,`correoElectronico`,`telefono`,`sexo`)VALUES(null,'+QuotedStr(ETNombre.Text)+','+QuotedStr(ETPaterno.Text)+','+QuotedStr(ETMaterno.Text)+','+QuotedStr(ETEmail.Text)+','+QuotedStr(ETTelefono.Text)+','+QuotedStr(sexo)+')';
  end
  else
  begin
    cadena := 'UPDATE `tintoreria`.`empleado` SET `nombre` ='+QuotedStr(ETNombre.Text)+' , `aPaterno` ='+QuotedStr(ETPaterno.Text)+ ' , `aMaterno` ='+QuotedStr(ETMaterno.Text)+' , `correoElectronico` ='+QuotedStr(ETEmail.Text)+' , `telefono` = '+QuotedStr(ETTelefono.Text)+', `sexo` ='+QuotedStr(sexo)+'  WHERE `idEmpleado` = '+IntToStr(UCatalogo.identificador);
  end;
  DMtintoreria.QGeneral.Active:=false;
  DMtintoreria.QGeneral.SQL.Text:=cadena;
  DMtintoreria.QGeneral.ExecSQL;
  DMtintoreria.TEmpleado.Requery;
  Close;

end;
procedure TUAgregar.BTNCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TUAgregar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.CreateForm(TFCatalogo, FCatalogo);
  DMtintoreria.TEmpleado.Requery;
  FCatalogo.Show;
end;

procedure TUAgregar.FormCreate(Sender: TObject);
var
id:Integer;
cadena:String;
begin
  if UDMtintoreria.bandera = 0  then
  begin
       //agregar empleado nuevo

  end
  else
  begin
      //modificar empleado
  cadena:='SELECT * FROM empleado WHERE idEmpleado = '+ IntToStr(UCatalogo.identificador);
  DMtintoreria.QGeneral.Active:=false;
  DMtintoreria.QGeneral.SQL.Text:=cadena;
  DMtintoreria.QGeneral.Active:=true;
  ETNombre.Text:= DMtintoreria.QGeneral.FieldByName('nombre').AsString;
  ETPaterno.Text:= DMtintoreria.QGeneral.FieldByName('aPaterno').AsString;
  ETMaterno.Text:= DMtintoreria.QGeneral.FieldByName('aMaterno').AsString;
  ETEmail.Text:= DMtintoreria.QGeneral.FieldByName('correoElectronico').AsString;
  ETTelefono.Text:=DMtintoreria.QGeneral.FieldByName('telefono').AsString;
  if DMtintoreria.QGeneral.FieldByName('sexo').AsString = 'H' then
  begin
    RSexo.ItemIndex:=0;
  end
  else
  begin
    RSexo.ItemIndex:=1;
  end;


  end;
end;
end.
