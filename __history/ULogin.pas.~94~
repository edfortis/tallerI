unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, pngimage, ExtCtrls;

type
  TFLogin = class(TForm)
    Label1: TLabel;
    TBUsuario: TEdit;
    Label2: TLabel;
    TBContrasena: TEdit;
    BTNIngresar: TBitBtn;
    Image1: TImage;
    BTNCancelar: TButton;
    procedure BTNIngresarClick(Sender: TObject);
    procedure BTNCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);



   
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;
  bandera:Boolean;
implementation

{$R *.dfm}
uses UDMtintoreria;

procedure TFLogin.BTNCancelarClick(Sender: TObject);
begin
Close;
end;

procedure TFLogin.BTNIngresarClick(Sender: TObject);
begin
  if(DMtintoreria.buscarPersona(TBUsuario.Text,TBContrasena.Text))then
  begin
    bandera:=true;
    Close;
  end
  else
  begin
    ShowMessage('Usuario o Contraseña Incorretos!');
    TBUsuario.SetFocus;
  end;
end;

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bandera=false then
  Application.Terminate;
end;

end.
