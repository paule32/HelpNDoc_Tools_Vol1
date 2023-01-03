program CustomVariables;

uses
  Forms,
  CustomVariablesForm in 'CustomVariablesForm.pas' {Form1},
  About in 'About.pas' {AboutDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
