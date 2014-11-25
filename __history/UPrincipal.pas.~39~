unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, pngimage, ExtCtrls;

type
  TFPrincipal = class(TForm)
    EtiquetaBienvenida: TLabel;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Image3: TImage;
    Label3: TLabel;
    EtiquetaAyuda: TLabel;

    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation
        uses  ULogin,UDMtintoreria,UCatalogo;
{$R *.dfm}



procedure TFPrincipal.FormShow(Sender: TObject);
begin
   Application.CreateForm(TFLogin, FLogin);
   FLogin.ShowModal;
   EtiquetaBienvenida.Caption:= 'Bienvenido: '+nombre;
end;

procedure TFPrincipal.Image1Click(Sender: TObject);
begin
  Application.CreateForm(TFCatalogo, FCatalogo);
  FCatalogo.Show;
end;

end.
