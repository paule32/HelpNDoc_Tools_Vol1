unit Preferences;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Dialogs, IniFiles, JvBaseDlg, JvSelectDirectory;

type
  TPreferDialog = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    LanguageCB: TComboBox;
    Label2: TLabel;
    WorkDir: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog: TJvSelectDirectory;
    Label3: TLabel;
    DatabaseName: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    ini: TIniFile;
  public
  end;

var
  PreferDialog: TPreferDialog;

implementation

{$R *.dfm}

procedure TPreferDialog.SpeedButton1Click(Sender: TObject);
begin
  if not OpenDialog.Execute then
  begin
    ShowMessage('Error:' + #13#10 +
    'something went wrong during open directory.');
    exit;
  end;

  WorkDir.Text := OpenDialog.Directory;
end;

procedure TPreferDialog.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPreferDialog.FormCreate(Sender: TObject);
begin
  if Length(Trim(WorkDir.Text)) < 3 then
  begin
    ShowMessage('Working Directory must have over 3 letters !');
    exit;
  end;

  if not DirectoryExists(WorkDir.Text) then
  begin
    ShowMessage('Error - Directory:' + #13#10 +
    WorkDir.Text                     + #13#10 +
    'does not exists !');
    exit;
  end;

  try
    try
      ini := TIniFile.Create(ExtractFilePath(
      Application.ExeName) + 'config.ini');
      DatabaseName.Text := ini.ReadString('common','Database','wrap.db');
      WorkDir.Text      := ini.ReadString('common','WorkingDirectory','C:\');
      LanguageCB.Text   := ini.ReadString('common','Language','English');
    except
      on E: Exception do
      begin
        ShowMessage('Error:' + #13#10 +
        E.Message);
        exit;
      end;
    end;
  finally
    ini.Free;
  end;
end;

procedure TPreferDialog.OKBtnClick(Sender: TObject);
begin
  try
    try
      ini := TIniFile.Create(ExtractFilePath(
      Application.ExeName) + 'config.ini');
      ini.WriteString('common','WorkingDirectory',WorkDir.Text);
      ini.WriteString('common','Language',LanguageCB.Text);
      ini.WriteString('common','Database',DatabaseName.Text);
    except
      on E: Exception do
      begin
        ShowMessage('Error:' + #13#10 +
        'something went wrong during save the preferences.');
        ini.Free;
        exit;
      end;
    end;
  finally
    ini.Free;
    Close;
  end;
end;

end.
