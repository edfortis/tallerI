program Tintoreria;

uses
  Forms,
  ULogin in 'ULogin.pas' {FLogin},
  UDMtintoreria in 'UDMtintoreria.pas' {DMtintoreria: TDataModule},
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UCatalogo in 'UCatalogo.pas' {FCatalogo},
  UAgregarEmpleado in 'UAgregarEmpleado.pas' {UAgregar},
  UUsuario in 'UUsuario.pas' {FUsuario},
  UAgregarUsuario in 'UAgregarUsuario.pas' {FAgregarUsuario},
  UCliente in 'UCliente.pas' {FCliente},
  UServicio in 'UServicio.pas' {FServicio},
  UAgregarServicio in 'UAgregarServicio.pas' {FServicioAgregar},
  Entregas in 'Entregas.pas' {FEntregas},
  UUServicios in 'UUServicios.pas' {FServicios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMtintoreria, DMtintoreria);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFEntregas, FEntregas);
  Application.CreateForm(TFServicios, FServicios);
  // Application.CreateForm(TFServicio, FServicio);
  //Application.CreateForm(TFServicioAgregar, FServicioAgregar);
  //Application.CreateForm(TFCliente, FCliente);
  //Application.CreateForm(TFAgregarUsuario, FAgregarUsuario);
  //Application.CreateForm(TFUsuario, FUsuario);
  //Application.CreateForm(TUAgregar, UAgregar);
  Application.Run;
end.
