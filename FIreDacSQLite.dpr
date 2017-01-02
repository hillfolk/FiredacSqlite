program FIreDacSQLite;

uses
  Vcl.Forms,
  Main in 'Main.pas' {fxMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfxMain, fxMain);
  Application.Run;
end.
