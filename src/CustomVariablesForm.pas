unit CustomVariablesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ToolWin, ComCtrls, StdCtrls, Menus,
  ShellApi, SQLite3, SQLite3Wrap, About, Preferences, Grids, Mask,
  JvExExtCtrls, JvExtComponent, JvPanel, JvOfficeColorPanel;

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
    cvPageControl: TPageControl;
    Splitter3: TSplitter;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    EditID: TEdit;
    Label2: TLabel;
    varTypeCB: TComboBox;
    Label3: TLabel;
    EditName: TEdit;
    cvTabString: TTabSheet;
    ScrollBox2: TScrollBox;
    Label6: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    EditDesc: TEdit;
    PageControl3: TPageControl;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ScrollBox3: TScrollBox;
    ScrollBox4: TScrollBox;
    ScrollBox5: TScrollBox;
    Label7: TLabel;
    EditNameSPA: TEdit;
    Label8: TLabel;
    EditDescSPA: TEdit;
    Label9: TLabel;
    EditNameDEU: TEdit;
    Label10: TLabel;
    EditDescDEU: TEdit;
    Label11: TLabel;
    EditNameFRA: TEdit;
    Label12: TLabel;
    EditDescFRA: TEdit;
    cvTabMemo: TTabSheet;
    ScrollBox6: TScrollBox;
    Label13: TLabel;
    MemoBox: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    cvTabEnum: TTabSheet;
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
    N6: TMenuItem;
    Preferences1: TMenuItem;
    TypesGrid: TStringGrid;
    TreeView2: TTreeView;
    SaveBtn: TButton;
    DeleteBtn: TButton;
    cvTabBoolean: TTabSheet;
    cvTabColor: TTabSheet;
    ScrollBox10: TScrollBox;
    JvOfficeColorPanel1: TJvOfficeColorPanel;
    ColorMaskEdit: TMaskEdit;
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
    procedure Preferences1Click(Sender: TObject);
    procedure TypesGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SaveBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure TypesGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure JvOfficeColorPanel1ColorButtonClick(Sender: TObject);
  private
    DB   : TSQLite3Database;
    Stmt : TSQLite3Statement;

    Path : String;
    isModified: Boolean;

    function  CheckOpenTrue(dlg: TOpenDialog; flag: Byte): Boolean;
    procedure DeleteRow(ARow: Integer);
    procedure HideCvPageTabSheets;
    procedure PopMenu(Actor: TPopupMenu);
    procedure PrepareDataBase(name: String);
    procedure ShowCvPageTabSheet(name: TComponentName);
    procedure WriteDataFields;
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

procedure TForm1.DeleteRow(ARow: Integer);
var i: Integer;
begin
  for i := ARow to TypesGrid.RowCount - 2 do
  TypesGrid.Rows[i].Assign(TypesGrid.Rows[i + 1]);
  TypesGrid.RowCount := TypesGrid.RowCount - 1;
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
  DB.Execute('CREATE TABLE IF NOT EXISTS customvariables (' +
  'id    INTEGER' + ',' +   // record id #
  'varid TEXT'    + ',' +   // id of variable
  'name  TEXT'    + ',' +   // name of variable
  'desc  TEXT'    + ',' +   // description: default: english
  'ndeu  TEXT'    + ',' +   // name: german
  'ddeu  TEXT'    + ',' +   // description: german
  'nfra  TEXT'    + ',' +   // name: french
  'dfra  TEXT'    + ',' +   // description: frenche
  'nesp  TEXT'    + ',' +   // name: spain
  'desp  TEXT'    + ',' +   // description: spain
  'memo  TEXT'    + ',' +   // memo field
  'type  INTEGER' + ',' +   // type of variable
  'tyid  INTEGER' + ')' );  // refers to data of type

  Screen.Cursor := cursorOld;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  cursorOld: TCursor;
  rows : Integer;
begin
  cursorOld := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  HideCvPageTabSheets;

  with TypesGrid do
  begin
    ColWidths[0] := 24;
    ColWidths[1] := 132;
    ColWidths[2] := 100;

    Cells[1,0] := 'Name:';
    Cells[2,0] := 'ID:';
  end;

  Path := ExtractFilePath(Application.ExeName) + 'wrap.db';
  DB   := TSQLite3Database.Create;

  PrepareDataBase(Path);

  // read database
  Stmt := DB.Prepare('SELECT * FROM customvariables');
  if Stmt.ColumnCount > 0 then
  begin
    rows := TypesGrid.RowCount-1;
    while Stmt.Step = SQLITE_ROW do
    begin
      TypesGrid.Cells[2,rows] := Stmt.ColumnText(1);
      TypesGrid.Cells[1,rows] := Stmt.ColumnText(2);

      inc(rows);
      TypesGrid.RowCount := rows;
    end;
  end;

  Screen.Cursor := cursorOld;
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
  PrepareDataBase(Path);
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
  isModified := false;

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

  if not CheckOpenTrue(DbOpenDialog,0) then
  exit;
  Path := DbOpenDialog.FileName;
  PrepareDataBase(DbOpenDialog.FileName);
end;

procedure TForm1.Preferences1Click(Sender: TObject);
begin
  PreferDialog := TPreferDialog.Create(Application);
  PreferDialog.ShowModal;
  PreferDialog.Free;
end;

procedure TForm1.TypesGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ACol = 0) and (ARow > 0) then
  begin
    TypesGrid.Canvas.TextOut(
    Rect.Left + 4,
    Rect.Top  + 4, IntToStr(ARow));
  end;

  if (ACol > 0) and (ARow > 0) then
  begin
    with TypesGrid.Canvas do
    begin
      if (gdSelected in State) then
      begin
        Brush.Color := clBlue;
        Font .Color := clWhite;
        Font .Style := [fsBold];
        FillRect(Rect);
      end else
      begin
        Brush.Color := clWhite;
        Font .Color := clBlack;
        Font .Style := [fsBold];
        FillRect(Rect);
      end;

      if ACol = 1 then
      begin
        TextOut(Rect.Left + 4, Rect.Top + 4,
        TypesGrid.Cells[ACol,ARow]);
      end else
      if ACol = 2 then
      begin
        TextOut(Rect.Left + 4, Rect.Top + 4,
        TypesGrid.Cells[ACol,ARow]);
      end;

      if (gdFocused in State) then
      DrawFocusRect(Rect);
    end;
  end;
end;

// save/update a data record
procedure TForm1.SaveBtnClick(Sender: TObject);
var
  i: Integer;
  rows: Integer;
begin
  // when ID + Name is ok, then save record
  if (Length(Trim(EditID.Text)) < 1) then
  begin
    ShowMessage('Error:' + #13#10 +
    'ID must not be empty !');
    exit;
  end;
  if (Length(Trim(EditName.Text)) < 1) then
  begin
    ShowMessage('Error:' + #13#10 +
    'Name must not be empty !');
    exit;
  end;

  if Length(Trim(varTypeCB.Text)) < 1 then
  begin
    ShowMessage('Error:' + #13#10 +
    'Type must not be empty !');
    exit;
  end;

  // traverse TypesGrid ID, and check if item exists
  // if so, then error, else insert new record:
  for i := 1 to TypesGrid.RowCount-1 do
  begin
    if TypesGrid.Cells[2,i] = EditID.Text then
    begin
      if Application.MessageBox(PChar(
      'Item exists in database !' + #13#10 +
      'Would you overwrite the existing data ?'),PChar(
      'Warning'),
      MB_YESNO) = ID_NO then exit;
      TypesGrid.Cells[1,i] := EditName.Text;
      TypesGrid.Cells[2,i] := EditID.Text;
      Stmt := DB.Prepare('UPDATE customvariables SET ' +
      'name  = "' + EditName   .Text + '",' +
      'desc  = "' + EditDesc   .Text + '",' +
      'ndeu  = "' + EditNameDEU.Text + '",' +
      'ddeu  = "' + EditDescDEU.Text + '",' +
      'nfra  = "' + EditNameFRA.Text + '",' +
      'dfra  = "' + EditDescFRA.Text + '",' +
      'nesp  = "' + EditNameSPA.Text + '",' +
      'desp  = "' + EditDescSPA.Text + '",' +
      'memo  = "' + MemoBox    .Text + '",' +
      'type  =  ' + IntToStr(varTypeCB.ItemIndex) + ',' +
      'tyid  =  ' + IntToStr(0) + ' ' +
      'WHERE    ' +
      'varid = "' + EditID.Text + '"');
      Stmt.StepAndReset;
      exit;
    end;
  end;

  rows := TypesGrid.RowCount + 1;
  TypesGrid.RowCount := rows;

  TypesGrid.Cells[1,rows-1] := EditName.Text;
  TypesGrid.Cells[2,rows-1] := EditID.Text;

  if Length(Trim(TypesGrid.Cells[1,1])) < 1 then
  DeleteRow(1);

  Stmt := DB.Prepare('INSERT INTO customvariables (' +
  'id,varid,name,desc,ndeu,ddeu,nfra,dfra,nesp,desp,memo,type,tyid)' +
  'VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)');
  Stmt.BindInt ( 1, TypesGrid.RowCount);
  Stmt.BindText( 2, EditID.Text);
  Stmt.BindText( 3, EditName.Text);
  Stmt.BindText( 4, EditDesc.Text);
  Stmt.BindText( 5, EditNameDEU.Text);
  Stmt.BindText( 6, EditDescDEU.Text);
  Stmt.BindText( 7, EditNameFRA.Text);
  Stmt.BindText( 8, EditDescFRA.Text);
  Stmt.BindText( 9, EditNameSPA.Text);
  Stmt.BindText(10, EditDescSPA.Text);
  Stmt.BindBlob(11, @MemoBox.Text[1],Length(MemoBox.Text));
  Stmt.BindInt (12, varTypeCB.ItemIndex);
  Stmt.BindInt (13, 0);
  Stmt.StepAndReset;
end;

procedure TForm1.WriteDataFields;
begin

end;

// delete a data record
procedure TForm1.DeleteBtnClick(Sender: TObject);
begin
//
end;

procedure TForm1.HideCvPageTabSheets;
var i : Integer;
begin
  for i := 1 to 5 do
  begin
    cvPageControl.Pages[i].Enabled    := false;
    cvPageControl.Pages[i].Visible    := false;
    cvPageControl.Pages[i].TabVisible := false;
  end;
end;
procedure TForm1.ShowCvPageTabSheet(name: TComponentName);
var i : Integer;
begin
  HideCvPageTabSheets;
  for i := 1 to 5 do
  begin
    if cvPageControl.Pages[i].Name = name then
    begin
      cvPageControl.Pages[i].TabVisible := true;
      cvPageControl.Pages[i].Visible    := true;
      cvPageControl.Pages[i].Enabled    := true;
      cvPageControl.Pages[i].SetFocus;
      cvPageControl.TabIndex := i;
      break;
    end;
  end;
end;

procedure TForm1.TypesGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  Stmt := DB.Prepare('SELECT * FROM customvariables WHERE varid = "' +
  TypesGrid.Cells[2,ARow] + '"');

  if Stmt.ColumnCount > 0 then
  begin
    Stmt.Step;
    EditID     .Text      := Stmt.ColumnText( 2);
    EditName   .Text      := Stmt.ColumnText( 3);
    EditDesc   .Text      := Stmt.ColumnText( 4);
    EditNameDEU.Text      := Stmt.ColumnText( 5);
    EditDescDEU.Text      := Stmt.ColumnText( 6);
    EditNameFRA.Text      := Stmt.ColumnText( 7);
    EditDescFRA.Text      := Stmt.ColumnText( 8);
    EditNameSPA.Text      := Stmt.ColumnText( 9);
    EditDescSPA.Text      := Stmt.ColumnText(10);
    MemoBox    .Text      := Stmt.ColumnText(11);
    varTypeCB  .ItemIndex := Stmt.ColumnInt (12);

    case varTypeCB.ItemIndex of
      0: begin ShowCvPageTabSheet('cvTabString' ); end;
      1: begin ShowCvPageTabSheet('cvTabBoolean'); end;
      2: begin ShowCvPageTabSheet('cvTabMemo'   ); end;
      3: begin ShowCvPageTabSheet('cvTabEnum'   ); end;
      4: begin ShowCvPageTabSheet('cvTabColor'  ); end;
    end;
  end;
end;

procedure TForm1.JvOfficeColorPanel1ColorButtonClick(Sender: TObject);
  function ColorToHtml1(Color: TColor): String;
  var COL: LongInt;
  begin
    COL := ColorToRGB(Color);
    Result := '#' +
    IntToHex(COL        and $FF, 2) +
    IntToHex(COL shr  8 and $FF, 2) +
    IntToHex(COL shr 16 and $FF, 2) ;
  end;
begin
  ColorMaskEdit.Text :=
  ColorToHtml1(JvOfficeColorPanel1.SelectedColor);
end;

end.
