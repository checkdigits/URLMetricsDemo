program URLMetricsDemo;

uses
  Vcl.Forms,
  sfrmMain in 'sfrmMain.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Dark');
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
