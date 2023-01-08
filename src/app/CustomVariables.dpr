program CustomVariables;

uses
  Forms,
  CustomVariablesForm in 'CustomVariablesForm.pas' {Form1},
  About in 'About.pas' {AboutDlg},
  Preferences in 'Preferences.pas' {PreferDialog},
  MyHintWindow in 'MyHintWindow.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
