unit CustomVariablesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ToolWin, ComCtrls, StdCtrls, Menus,
  ShellApi, SQLite3, SQLite3Wrap, About;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    ListBox1: TListBox;
    CoolBar1: TCoolBar;
    Panel1: TPanel;
    spButtonFile___: TSpeedButton;
    spButtonEdit___: TSpeedButton;
    spButtonAction_: TSpeedButton;
    Panel2: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Panel3: TPanel;
    Image1: TImage;
    FilePopupMenu: TPopupMenu;
    New1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N2: TMenuItem;
    MenuFile_ExitApplication: TMenuItem;
    EditPopupMenu: TPopupMenu;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Paste1: TMenuItem;
    N3: TMenuItem;
    Delete1: TMenuItem;
    Undo1: TMenuItem;
    Redo1: TMenuItem;
    N4: TMenuItem;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    PageControl1: TPageControl;
    Splitter3: TSplitter;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Edit2: TEdit;
    TabSheet2: TTabSheet;
    ScrollBox2: TScrollBox;
    Label6: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    PageControl3: TPageControl;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ScrollBox3: TScrollBox;
    ScrollBox4: TScrollBox;
    ScrollBox5: TScrollBox;
    Label7: TLabel;
    Edit5: TEdit;
    Label8: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    Edit7: TEdit;
    Label10: TLabel;
    Edit8: TEdit;
    Label11: TLabel;
    Edit9: TEdit;
    Label12: TLabel;
    Edit10: TEdit;
    TabSheet6: TTabSheet;
    ScrollBox6: TScrollBox;
    Label13: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    TabSheet7: TTabSheet;
    ScrollBox7: TScrollBox;
    Label14: TLabel;
    Edit11: TEdit;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    ScrollBox8: TScrollBox;
    ScrollBox9: TScrollBox;
    TreeView1: TPageControl;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    ScrollBox10: TScrollBox;
    ScrollBox11: TScrollBox;
    spButtonHelp___: TSpeedButton;
    ActionPopupMenu: TPopupMenu;
    PackTable: TMenuItem;
    DbReBase: TMenuItem;
    DbDelete: TMenuItem;
    ZipTable: TMenuItem;
    N5: TMenuItem;
    HelpPopupMenu: TPopupMenu;
    About1: TMenuItem;
    DbOpenDialog: TOpenDialog;
    procedure Image1Click(Sender: TObject);
    procedure spButtonFile___Click(Sender: TObject);
    procedure spButtonEdit___Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spButtonAction_Click(Sender: TObject);
    procedure PackTableClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ZipTableClick(Sender: TObject);
    procedure DbDeleteClick(Sender: TObject);
    procedure DbReBaseClick(Sender: TObject);
    procedure spButtonHelp___Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure MenuFile_ExitApplicationClick(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
  private
    DB   : TSQLite3Database;
    Stmt : TSQLite3Statement;

    Path : String;
    isModified: Boolean;

    function  CheckOpenTrue(dlg: TOpenDialog; flag: Byte): Boolean;
    procedure PopMenu(Actor: TPopupMenu);
    procedure PrepareDataBase(name: String);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// HelpNDoc image => visit home page
procedure TForm1.Image1Click(Sender: TObject);
var URL: String;
begin
  URL := 'https://www.helpndoc.com';
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

// helper for smaller code
procedure TForm1.PopMenu(Actor: TPopupMenu);
begin
  Actor.Popup(
  Mouse.CursorPos.x ,
  Mouse.CursorPos.y);
end;

// then menuline
procedure TForm1.spButtonFile___Click(Sender: TObject); begin PopMenu(FilePopupMenu  ); end;
procedure TForm1.spButtonEdit___Click(Sender: TObject); begin PopMenu(EditPopupMenu  ); end;
procedure TForm1.spButtonAction_Click(Sender: TObject); begin PopMenu(ActionPopupMenu); end;
procedure TForm1.spButtonHelp___Click(Sender: TObject); begin PopMenu(HelpPopupMenu  ); end;

// using at start-up, and rebase
procedure TForm1.PrepareDataBase(name: String);
var
  cursorOld : TCursor;
begin
  cursorOld := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  isModified := false;

  DB.Close;
  DB.Open(name);
  DB.Execute('CREATE TABLE IF NOT EXISTS testtable (title TEXT, year INTEGER)');

  Screen.Cursor := cursorOld;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Path := ExtractFilePath(Application.ExeName) + 'wrap.db';
  DB   := TSQLite3Database.Create;

  PrepareDataBase(Path);

  Stmt := DB.Prepare('INSERT INTO testtable (title, year) VALUES (?,?)');
  Stmt.BindText(1,'Hallo');
  Stmt.BindInt (2,2023   );
  Stmt.StepAndReset;
end;

procedure TForm1.PackTableClick(Sender: TObject);
begin
  DB.Execute('VACUUM');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
//  Stmt.Free;
  DB.Free;
end;

procedure TForm1.ZipTableClick(Sender: TObject);
begin
  DB.Execute('DELETE FROM testtable');
end;

procedure TForm1.DbDeleteClick(Sender: TObject);
begin
  DB.Close;
  DeleteFile(Path);
end;

procedure TForm1.DbReBaseClick(Sender: TObject);
begin
  DbDeleteClick(Sender);
  DB.Open(Path);
  DB.Execute('CREATE TABLE IF NOT EXISTS testtable (title TEXT, year INTEGER)');
end;

// menu->Help->About
procedure TForm1.About1Click(Sender: TObject);
begin
  AboutDlg := TAboutDlg.Create(Application);
  try
    AboutDlg.ShowModal;
  finally
    AboutDlg.Free;
  end;
end;

// close the application
procedure TForm1.MenuFile_ExitApplicationClick(Sender: TObject);
begin
  if Application.MessageBox(PChar(
     'Do you want close the Application ?'),PChar(
     'Information'),
     MB_YESNO) = ID_NO then exit;
  Close;
end;

// menu->File->New
procedure TForm1.New1Click(Sender: TObject);
begin
  if Application.MessageBox(PChar(
     'This will close the current database.'     + #13#10 +
     'It will be create a new one that is saved' + #13#10 +
     'into Your given directory.'                + #13#10 + #13#10 +
     'Do You realy do this ?'),PChar(
     'Information'),
     MB_YESNO) = ID_NO then exit;

  if not CheckOpenTrue(DbOpenDialog,1) then
  exit;

  PrepareDataBase(DbOpenDialog.FileName);
end;

function TForm1.CheckOpenTrue(dlg: TOpenDialog; flag: Byte): Boolean;
var ext: String;
begin
  result := false;
  if DbOpenDialog.Execute = false then
  begin
    ShowMessage('something went wrong.' + #13#10 +
    'The last Operation will be rejected.');
    exit;
  end;
  if flag > 0 then
  if FileExists(DbOpenDialog.FileName) then
  begin
    if Application.MessageBox(PChar(
       'A file with your data exists !' + #13#10 +
       'Do you want to overwrite it ?'),PChar(
       'Warning'),
       MB_YESNO) = ID_NO then exit;
  end;
  ext := ExtractFileExt(DbOpenDialog.FileName);
  if LowerCase(ext) <> '.db' then
  begin
    ShowMessage('Error:' + #13#10 +
    'Your database file must have the .db Extension.' + #13#10 +
    'Last Operation is rejected !');
    exit;
  end;

  result := true;
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
  if isModified then
  begin
    if Application.MessageBox(PChar(
       'The database was modified !' + #13#10 +
       'Do you want save the changes ?'),PChar(
       'Attention'),
       MB_YESNO) = ID_YES then
       DB.Execute('COMMIT');
  end;
  if not DbOpenDialog.Execute then
  begin
    ShowMessage('Error:' + #13#10 +
    'something went wrong during open a database.');
    exit;
  end;

  if not CheckOpenTrue(DbOpenDialog,0) then
  exit;
  PrepareDataBase(DbOpenDialog.FileName);
end;

end.
