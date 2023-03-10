// -------------------------------------------------------------------------
// File: Form.pas
// Desc: HelpNDoc - Tools for Help authoring.
//
// Code: (c) 2023 by Jens Kallup - paule32
//       all rights reserved.
// -------------------------------------------------------------------------
unit CustomVariablesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Buttons, ExtCtrls, ToolWin, ComCtrls, StdCtrls, Menus, ShellApi, Grids,
  Mask, IniFiles, StrUtils, Dialogs,
  JvExExtCtrls, JvExtComponent, JvPanel, JvOfficeColorPanel, SynEdit,
  SynHighlighterJScript, SynHighlighterHtml, SynEditHighlighter,
  SynHighlighterCSS, JvGradientCaption, JvComponentBase, JvComCtrls,
  JvExComCtrls, ImgList, JvExButtons, JvBitBtn, JvExStdCtrls, JvListBox,
  JvExControls, JvArrowButton, JvCaptionButton, JvAppEvent, JvExGrids,
  JvStringGrid, JvBalloonHint, JvMenus, JvFormToHtml, JvSpeedButton,
  JvDesignSurface, JvDesignUtils, JvInspector,
  SQLite3, SQLite3Wrap, About, Preferences;

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
    SaveBtn: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Splitter1: TSplitter;
    Splitter3: TSplitter;
    PageControl2: TPageControl;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    ScrollBox8: TScrollBox;
    spButtonHelp___: TSpeedButton;
    DbOpenDialog: TOpenDialog;
    TreeView2: TTreeView;
    SynCssSyn1: TSynCssSyn;
    SynHTMLSyn1: TSynHTMLSyn;
    SynJScriptSyn1: TSynJScriptSyn;
    JvGradientCaption1: TJvGradientCaption;
    ImageList1: TImageList;
    JvCaptionButton1: TJvCaptionButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    Splitter4: TSplitter;
    projectPageControl: TPageControl;
    TabSheet10: TTabSheet;
    cvPageControl: TPageControl;
    TabSheet2: TTabSheet;
    ScrollBox2: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditID: TEdit;
    varTypeCB: TComboBox;
    EditName: TEdit;
    EditDesc: TEdit;
    PageControl3: TPageControl;
    TabSheet3: TTabSheet;
    ScrollBox3: TScrollBox;
    Label9: TLabel;
    Label10: TLabel;
    EditNameDEU: TEdit;
    EditDescDEU: TEdit;
    TabSheet4: TTabSheet;
    ScrollBox4: TScrollBox;
    Label11: TLabel;
    Label12: TLabel;
    EditNameFRA: TEdit;
    EditDescFRA: TEdit;
    TabSheet5: TTabSheet;
    ScrollBox5: TScrollBox;
    Label7: TLabel;
    Label8: TLabel;
    EditNameSPA: TEdit;
    EditDescSPA: TEdit;
    cvTabString: TTabSheet;
    ScrollBox6: TScrollBox;
    Label6: TLabel;
    JvArrowButton4: TJvArrowButton;
    JvArrowButton5: TJvArrowButton;
    defaultEdit: TEdit;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    cvTabMemo: TTabSheet;
    ScrollBox7: TScrollBox;
    Label13: TLabel;
    Button1: TJvArrowButton;
    JvArrowButton1: TJvArrowButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    MemoBox: TSynEdit;
    cvTabEnum: TTabSheet;
    ScrollBox10: TScrollBox;
    Label14: TLabel;
    enumButtonLoad: TJvArrowButton;
    enumButtonSave: TJvArrowButton;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    defaultEnum: TEdit;
    enumButtonClear: TButton;
    Button9: TButton;
    Button10: TButton;
    defaultEnumValue: TEdit;
    varEnumListBox: TJvListBox;
    JvBitBtn1: TJvBitBtn;
    JvBitBtn2: TJvBitBtn;
    cvTabBoolean: TTabSheet;
    cvTabColor: TTabSheet;
    ScrollBox17: TScrollBox;
    JvArrowButton6: TJvArrowButton;
    JvArrowButton7: TJvArrowButton;
    JvOfficeColorPanel1: TJvOfficeColorPanel;
    defaultColor: TMaskEdit;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    TabSheet6: TTabSheet;
    ScrollBox11: TScrollBox;
    Label15: TLabel;
    JvArrowButton8: TJvArrowButton;
    JvArrowButton9: TJvArrowButton;
    SynEdit1: TSynEdit;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton3: TRadioButton;
    EditHeaderFrom: TEdit;
    EditHeaderTo: TEdit;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    TabSheet7: TTabSheet;
    ScrollBox12: TScrollBox;
    Label16: TLabel;
    JvArrowButton10: TJvArrowButton;
    JvArrowButton11: TJvArrowButton;
    SynEdit2: TSynEdit;
    RadioGroup2: TRadioGroup;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    EditFooterFrom: TEdit;
    EditFooterTo: TEdit;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    TabSheet12: TTabSheet;
    ScrollBox13: TScrollBox;
    Label17: TLabel;
    JvArrowButton12: TJvArrowButton;
    JvArrowButton13: TJvArrowButton;
    SynEdit3: TSynEdit;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    TabSheet13: TTabSheet;
    ScrollBox14: TScrollBox;
    Label18: TLabel;
    JvArrowButton14: TJvArrowButton;
    JvArrowButton15: TJvArrowButton;
    SynEdit4: TSynEdit;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    TabSheet15: TTabSheet;
    ScrollBox16: TScrollBox;
    Splitter5: TSplitter;
    Label20: TLabel;
    Label23: TLabel;
    JvArrowButton16: TJvArrowButton;
    JvArrowButton17: TJvArrowButton;
    Panel5: TPanel;
    Panel6: TPanel;
    TreeView3: TTreeView;
    EditCATname: TEdit;
    Button5: TButton;
    Button6: TButton;
    EditCATconnect: TEdit;
    Button7: TButton;
    Button29: TButton;
    EnumAddButton: TButton;
    enumDeleteButton: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    JvAppEvents1: TJvAppEvents;
    Panel3: TPanel;
    TabSheet21: TTabSheet;
    projectsGrid: TJvStringGrid;
    JvBalloonHint1: TJvBalloonHint;
    JvOfficeMenuItemPainter1: TJvOfficeMenuItemPainter;
    FilePopupMenu: TJvPopupMenu;
    EditPopupMenu: TJvPopupMenu;
    ActionPopupMenu: TJvPopupMenu;
    HelpPopupMenu: TJvPopupMenu;
    New: TMenuItem;
    Open: TMenuItem;
    N7: TMenuItem;
    Save: TMenuItem;
    SaveAs: TMenuItem;
    N8: TMenuItem;
    MenuFile_ExitApplication: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Paste1: TMenuItem;
    N1: TMenuItem;
    Undo1: TMenuItem;
    Redo1: TMenuItem;
    N2: TMenuItem;
    Delete1: TMenuItem;
    N3: TMenuItem;
    Preferences1: TMenuItem;
    PackTable1: TMenuItem;
    ZipTable1: TMenuItem;
    N4: TMenuItem;
    DbReBase1: TMenuItem;
    DbDelete1: TMenuItem;
    About1: TMenuItem;
    PopupMenu1: TPopupMenu;
    enumPopupLoad: TJvPopupMenu;
    enumPopupSave: TJvPopupMenu;
    varButtonAdd: TButton;
    varButtonDelete: TButton;
    TabSheet22: TTabSheet;
    ScrollBox22: TScrollBox;
    SpeedButton3: TSpeedButton;
    Label35: TLabel;
    projectEdit1: TEdit;
    Label36: TLabel;
    projectEdit2: TEdit;
    Label37: TLabel;
    projectEdit4: TEdit;
    Label38: TLabel;
    projectEdit6: TEdit;
    Label39: TLabel;
    projectEdit5: TEdit;
    Label40: TLabel;
    projectEdit3: TEdit;
    Label41: TLabel;
    projectEdit7: TEdit;
    projectEdit8: TMemo;
    Label42: TLabel;
    Image1: TImage;
    projectsPopupMenu: TJvPopupMenu;
    OpenexistingProject1: TMenuItem;
    CreatenewProject1: TMenuItem;
    N5: TMenuItem;
    DeleteProjectItem1: TMenuItem;
    projectOutput: TStringGrid;
    Label43: TLabel;
    ScrollBox23: TScrollBox;
    PageControl7: TPageControl;
    TabSheet23: TTabSheet;
    TabSheet24: TTabSheet;
    StringGrid2: TStringGrid;
    TabSheet25: TTabSheet;
    ScrollBox15: TScrollBox;
    Label19: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    EditHTMLid: TEdit;
    EditHTMLname: TEdit;
    EditHTMLdesc: TEdit;
    PageControl5: TPageControl;
    TabSheet16: TTabSheet;
    ScrollBox18: TScrollBox;
    Label26: TLabel;
    Label27: TLabel;
    EditHTMLdeuName: TEdit;
    EditHTMLdeuDesc: TEdit;
    TabSheet18: TTabSheet;
    ScrollBox19: TScrollBox;
    Label28: TLabel;
    Label29: TLabel;
    EditHTMLfreName: TEdit;
    EditHTMLfreDesc: TEdit;
    TabSheet19: TTabSheet;
    ScrollBox20: TScrollBox;
    Label30: TLabel;
    Label31: TLabel;
    EditHTMLespName: TEdit;
    EditHTMLespDesc: TEdit;
    Button8: TButton;
    Button33: TButton;
    TabSheet26: TTabSheet;
    ScrollBox21: TScrollBox;
    SynEdit5: TSynEdit;
    TypesGrid: TJvStringGrid;
    Label44: TLabel;
    JvFormToHtml1: TJvFormToHtml;
    Button30: TButton;
    PageControl4: TPageControl;
    TabSheet11: TTabSheet;
    TabSheet14: TTabSheet;
    PageScroller1: TPageScroller;
    propertiesTabSheet: TTabSheet;
    JvInspector1: TJvInspector;
    JvInspectorBorlandPainter1: TJvInspectorBorlandPainter;
    JvDesignScrollBox1: TJvDesignScrollBox;
    JvSpeedButton1: TJvSpeedButton;
    JvSpeedButton2: TJvSpeedButton;
    JvSpeedButton3: TJvSpeedButton;
    JvInspectorDotNETPainter1: TJvInspectorDotNETPainter;
    htmlDesignPanel: TJvDesignPanel;
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
    procedure TypesGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure JvOfficeColorPanel1ColorButtonClick(Sender: TObject);
    procedure JvOfficeColorPanel1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure JvBitBtn2Click(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure editOnEnter(Sender: TObject);
    procedure editOnExit(Sender: TObject);
    procedure varTypeCBEnter(Sender: TObject);
    procedure varTypeCBExit(Sender: TObject);
    procedure EditIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditNameDEUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditDescDEUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editOnKeyPress(Sender: TObject; var Key: Char);
    procedure defaultEnumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure defaultEnumValueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditNameFRAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditDescFRAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure varTypeCBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EnumAddButtonClick(Sender: TObject);
    procedure enumButtonClearClick(Sender: TObject);
    procedure JvAppEvents1Hint(Sender: TObject);
    procedure enumDeleteButtonClick(Sender: TObject);
    procedure enumButtonLoadClick(Sender: TObject);
    procedure enumButtonSaveClick(Sender: TObject);
    procedure varButtonAddClick(Sender: TObject);
    procedure varButtonDeleteClick(Sender: TObject);
    procedure projectsGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure projectPageControlChange(Sender: TObject);
    procedure projectsGridDblClick(Sender: TObject);
    procedure cvPageControlChange(Sender: TObject);
    procedure OpenexistingProject1Click(Sender: TObject);
    procedure CreatenewProject1Click(Sender: TObject);
    procedure projectsGridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure projectsGridMouseEnter(Sender: TObject);
    procedure projectsGridMouseLeave(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    function JvAppEvents1Help(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure htmlDesignPanelPaint(Sender: TObject);
    procedure projectsGridClick(Sender: TObject);
    procedure projectEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure projectsGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure projectEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure projectEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure projectEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure projectEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure projectEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure projectEdit7KeyPress(Sender: TObject; var Key: Char);
  private
    DB         : TSQLite3Database;
    projectsDB : TSQLite3Database;
    Stmt       : TSQLite3Statement;

    appINI     : TIniFile;
    dataStr    : String;

    projectDataField    : Array [0..128,0..2] of String;
    projectCount        : Integer;
    projectHeader       : String;
    projectFocused      : Boolean;
    projectDataModified : Boolean;

    inspCat: TJvInspectorCustomCategoryItem;

    Path  : String;
    idxCmp: String;
    isModified: Boolean;



    function  CheckOpenTrue(dlg: TOpenDialog; flag: Byte): Boolean;
    procedure AddNewProject(num: Integer);
    procedure AddPopupMenu(menuObject: TJvPopupMenu);
    procedure DeleteRow(AGrid: TJvStringGrid; ARow: Integer);
    procedure HideCvPageTabSheets;
    procedure PopMenu(Actor: TPopupMenu);
    procedure PrepareDataBase(name: String);
    procedure ProjectsDBcreate;
    procedure SaveProject;
    procedure SelectProject(num: Integer);
    procedure ShowCellHint(AGrid: TJvStringGrid; x,y: Integer);
    procedure ShowCvPageTabSheet(name: TComponentName);
    procedure UpdateProjectField(
      field    : String;
      text     : TObject;
      var key  : Char;
      nextFocus: TObject);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses HtmHelp;

// HelpNDoc image => visit home page
procedure TForm1.DeleteRow(AGrid: TJvStringGrid; ARow: Integer);
var i: Integer;
begin
  for i := ARow to     AGrid.RowCount - 2 do
  AGrid.Rows[i].Assign(AGrid.Rows[i + 1]);
  AGrid.RowCount := AGrid.RowCount - 1;
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
  try
    cursorOld := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    isModified := false;

    begin
      DB.Close;
      DB.Open(name);
      DB.Execute('CREATE TABLE IF NOT EXISTS customvariables (' +
      'id     INTEGER' + ',' +   // record id #
      'varid  TEXT'    + ',' +   // id of variable
      'name   TEXT'    + ',' +   // name of variable
      'desc   TEXT'    + ',' +   // description: default: english
      'ndeu   TEXT'    + ',' +   // name: german
      'ddeu   TEXT'    + ',' +   // description: german
      'nfra   TEXT'    + ',' +   // name: french
      'dfra   TEXT'    + ',' +   // description: frenche
      'nesp   TEXT'    + ',' +   // name: spain
      'desp   TEXT'    + ',' +   // description: spain
      'deftxt TEXT'    + ',' +   // default String
      'defenu TEXT'    + ',' +   // defailt enum
      'defcol TEXT'    + ',' +   // default color
      'defbol INTEGER' + ',' +   // default bool
      'memo   TEXT'    + ',' +   // default memo field
      'type   INTEGER' + ',' +   // type of variable
      'tyid   INTEGER' + ')' );  // refers to data of type
    end;
    Screen.Cursor := cursorOld;
  except
    on E: Exception do
    begin
      Screen.Cursor := cursorOld;
      Application.MessageBox(PChar(
      'Exception:' + #13#10 + E.Message),PChar(
      'Exception'),MB_OK);
      Close;
      Application.Terminate;
    end;
  end;
end;

procedure TForm1.projectsDBcreate;
begin
//projectsDB.Execute('DROP   TABLE data');
  projectsDB.Execute('CREATE TABLE IF NOT EXISTS data (' +
  'id        INTEGER' + ',' + // record id #
  'name      TEXT'    + ',' + // name of the project
  'path      TEXT'    + ',' + // path to ...
  'title     TEXT'    + ',' + // title ...
  'author    TEXT'    + ',' + // author ...
  'version   TEXT'    + ',' + // version ...
  'copyright TEXT'    + ',' + // copyright
  'summary   TEXT'    + ',' + // summary
  'comment   TEXT'    + ')'); // comment
end;

procedure TForm1.AddNewProject(num: Integer);
begin
  Stmt := projectsDB.Prepare('INSERT INTO data ' +
  '(id,name,path) VALUES (?,?,?)');
  Stmt.BindInt ( 1, num);
  Stmt.BindText( 2, 'Unamed Projekt');
  Stmt.BindText( 3, 'C:\tmp');
  Stmt.Step;

  SelectProject(num);
end;

procedure TForm1.SelectProject(num: Integer);
begin
  Stmt := projectsDB.Prepare(
  'SELECT * FROM data WHERE id=' +
  IntToStr(num));
  Stmt.Step;

  projectDataField[projectCount,0] := Stmt.ColumnText(1);
  projectDataField[projectCount,1] := Stmt.ColumnText(2);

  projectEdit1.Text := Stmt.ColumnText(1);
  projectEdit2.Text := Stmt.ColumnText(2);
  projectEdit3.Text := Stmt.ColumnText(3);
  projectEdit4.Text := Stmt.ColumnText(4);
  projectEdit5.Text := Stmt.ColumnText(5);
  projectEdit6.Text := Stmt.ColumnText(6);
  projectEdit7.Text := Stmt.ColumnText(7);
  projectEdit8.Text := Stmt.ColumnText(8);
end;

procedure TForm1.SaveProject;
begin
  if Application.MessageBox(PChar(
  'The data of this Project have been modified.' + #13#10 +
  'Would You save the data Informations ?'),PChar(
  'Warning'),MB_YESNO) = ID_NO then
  exit;

  Stmt := projectsDB.Prepare('UPDATE data SET ' +
  'name      = "' + projectEdit1.Text + '",' + // name of the project
  'path      = "' + projectEdit2.Text + '",' + // path to ...
  'title     = "' + projectEdit3.Text + '",' + // title ...
  'author    = "' + projectEdit4.Text + '",' + // author ...
  'version   = "' + projectEdit5.Text + '",' + // version ...
  'copyright = "' + projectEdit6.Text + '",' + // copyright
  'summary   = "' + projectEdit7.Text + '",' + // summary
  'comment   = "' + projectEdit8.Text + '" ' + // comment
  'WHERE id  =  ' +
  IntToStr(projectsGrid.Row + 1));
  Stmt.Step;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  cursorOld: TCursor;
  rows,i: Integer;
  dStr: String;
begin
  try
    cursorOld := Screen.Cursor;
    Screen.Cursor := crHourGlass;

    with htmlDesignPanel do
    begin
      Surface.Active := true;
      Width := Screen.Width;
      Height := Screen.Height;
      Color := clBtnFace;
      DrawRules := true;
      Clear;
      Invalidate;
    end;

    projectPageControl.ActivePageIndex   := 0;
    projectPageControl.Pages[1].TabVisible := false;
    projectPageControl.Pages[2].TabVisible := false;

    HideCvPageTabSheets;
    cvPageControl.Pages[0].TabVisible := true;
    cvPageControl.Pages[0].Enabled := true;

    for i := 1 to 5 do
    PageControl1.Pages[i].TabVisible := false;

    with TypesGrid do
    begin
      ColWidths[0] := 24;
      ColWidths[1] := 132;
      ColWidths[2] := 100;

      Cells[1,0] := 'Name:';
      Cells[2,0] := 'ID:';
    end;

    // --------------------------------------------------------
    // prepare database:
    // first, we look, if .ini file exists; then search
    // for the projects.db file path. If not found, get
    // Application.ExeName path.
    // --------------------------------------------------------
    Path := ExtractFilePath(Application.ExeName);
    dStr := 'projects.db';

    if not FileExists(Path + 'config.ini') then
    begin
      Path    := GetCurrentDir;
      dataStr := dStr;
      if not FileExists(Path + 'config.ini') then
      begin
        Application.MessageBox(PChar(
        'no access to "config.ini", use default data file.'),PChar(
        'Error'),MB_OK);
      end else
      begin
        appINI  := TIniFile.Create(Path + 'config.ini');
        dataStr := appINI.ReadString('common','ProjectFile',dStr);
      end;
    end else
    begin
      appINI  := TIniFile.Create(Path + 'config.ini');
      dataStr := appIni.ReadString('common','ProjectFile',dStr);
    end;

    projectsDB := TSQLite3Database.Create;
    projectsDB.Open(dataStr);
    projectsDBcreate;

    projectCount := 0;
    Stmt := projectsDB.Prepare('SELECT * FROM data');
    while Stmt.Step = SQLITE_ROW do
    begin
      inc(projectCount);
    end;

    if projectCount < 1 then
    begin
      projectCount := 0;
      AddNewProject(projectsGrid.RowCount);
    end else
    begin
      projectCount := 0;
      Stmt := projectsDB.Prepare('SELECT * FROM data');
      while Stmt.Step = SQLITE_ROW do
      begin
        projectDataField[projectCount,0] := Stmt.ColumnText(1);
        projectDataField[projectCount,1] := Stmt.ColumnText(2);
        inc(projectCount);
      end;

      projectsGrid.RowCount := projectCount;
      projectFocused := true;
    end;

    SelectProject(1);
    ScrollBox22.Visible := true;

    DB         := TSQLite3Database.Create;

(*
    PrepareDataBase(dataStr);


    // read database
    Stmt := DB.Prepare('SELECT * FROM customvariables');
    Stmt.Step;

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
*)

    Screen.Cursor := cursorOld;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(
      'Error:' + #13#10 + E.Message),PChar(
      'Exception'),MB_OK);
      Close;
      Application.Terminate;
    end;
  end;
end;

procedure TForm1.PackTableClick(Sender: TObject);
begin
  DB.Execute('VACUUM');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
//  inspCat.Clear;
//  inspCat.Free;

  Stmt.Free;
  DB.Free;
  projectsDB.Free;
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
    Application.MessageBox(PChar(
    'something went wrong.' + #13#10 +
    'The last Operation will be rejected.'),PChar(
    'Error'),MB_OK);
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
    Application.MessageBox(PChar(
    'Error:' + #13#10 +
    'Your database file must have the .db Extension.' + #13#10 +
    'Last Operation is rejected !'),PChar(
    'Error'),MB_OK);
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
    Application.MessageBox(PChar(
    'Error:' + #13#10 + 'ID must not be empty !'),PChar(
    'Error'),MB_OK);
    exit;
  end;
  if (Length(Trim(EditName.Text)) < 1) then
  begin
    Application.MessageBox(PChar(
    'Error:' + #13#10 + 'Name must not be empty !'),PChar(
    'Error'),MB_OK);
    exit;
  end;

  if Length(Trim(varTypeCB.Text)) < 1 then
  begin
    Application.MessageBox(PChar(
    'Error:' + #13#10 + 'Type must not be empty !'),PChar(
    'Error'),MB_OK);
    exit;
  end;

  idxCmp := defaultEnum.Text;

  // traverse TypesGrid ID, and check if item exists
  // if so, then error, else insert new record:
  for i := 1 to TypesGrid.RowCount-1 do
  begin
    if (TypesGrid.Cells[1,i] = EditID.Text)
    or (TypesGrid.Cells[2,i] = EditID.Text) then
    begin
      if Application.MessageBox(PChar(
      'Item exists in database !' + #13#10 +
      'Would you overwrite the existing data ?'),PChar(
      'Warning'),
      MB_YESNO) = ID_NO then exit;

      if TypesGrid.Cells[1,0] = 'ID:' then
      begin
        TypesGrid.Cells[1,i] := EditID.Text;
        TypesGrid.Cells[2,i] := EditName.Text;
      end else
      if TypesGrid.Cells[2,0] = 'ID:' then
      begin
        TypesGrid.Cells[1,i] := EditName.Text;
        TypesGrid.Cells[2,i] := EditID.Text;
      end;

      Stmt := DB.Prepare('UPDATE customvariables SET ' +
      'name   = "' + EditName    .Text + '",' +
      'desc   = "' + EditDesc    .Text + '",' +
      'ndeu   = "' + EditNameDEU .Text + '",' +
      'ddeu   = "' + EditDescDEU .Text + '",' +
      'nfra   = "' + EditNameFRA .Text + '",' +
      'dfra   = "' + EditDescFRA .Text + '",' +
      'nesp   = "' + EditNameSPA .Text + '",' +
      'desp   = "' + EditDescSPA .Text + '",' +
      'deftxt = "' + defaultEdit .Text + '",' +
      'defenu = "' + defaultEnum .Text + '",' +
      'defcol = "' + defaultColor.Text + '",' +
      'defbol =  ' + IntToStr(0)       + ' ,' +
      'memo   = "' + MemoBox     .Text + '",' +
      'type   =  ' + IntToStr(varTypeCB.ItemIndex) + ',' +
      'tyid   =  ' + IntToStr(0) + ' ' +
      'WHERE     ' +
      'varid  = "' + EditID.Text + '"');
      Stmt.Step;
      exit;
    end;
  end;

  rows := TypesGrid.RowCount + 1;
  TypesGrid.RowCount := rows;

  if TypesGrid.Cells[1,0] = 'ID:' then
  begin
    TypesGrid.Cells[1,rows-1] := EditID.Text;
    TypesGrid.Cells[2,rows-1] := EditName.Text;
  end else
  if TypesGrid.Cells[2,0] = 'ID:' then
  begin
    TypesGrid.Cells[1,rows-1] := EditName.Text;
    TypesGrid.Cells[2,rows-1] := EditID.Text;
  end;

  if Length(Trim(TypesGrid.Cells[1,1])) < 1 then
  DeleteRow(TypesGrid,1);

  Stmt := DB.Prepare('INSERT INTO customvariables   (' +
  'id,varid,name,desc,ndeu,ddeu,nfra,dfra,nesp,desp, ' +
  'deftxt,defenu,defcol,defbol,memo,type,tyid) VALUES' +
  '(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)');
  Stmt.BindInt ( 1, TypesGrid.RowCount);
  Stmt.BindText( 2, EditID.Text);
  Stmt.BindText( 3, EditName    .Text);
  Stmt.BindText( 4, EditDesc    .Text);
  Stmt.BindText( 5, EditNameDEU .Text);
  Stmt.BindText( 6, EditDescDEU .Text);
  Stmt.BindText( 7, EditNameFRA .Text);
  Stmt.BindText( 8, EditDescFRA .Text);
  Stmt.BindText( 9, EditNameSPA .Text);
  Stmt.BindText(10, EditDescSPA .Text);
  Stmt.BindText(11, defaultEdit .Text);
  Stmt.BindText(12, defaultEnum .Text);
  Stmt.BindText(13, defaultColor.Text);
  Stmt.BindInt (14, 0);
  Stmt.BindText(15, MemoBox     .Text);
  Stmt.BindInt (16, varTypeCB.ItemIndex);
  Stmt.BindInt (17, 0);
  Stmt.Step;
end;

// delete a data record
procedure TForm1.HideCvPageTabSheets;
var i : Integer;
begin
  for i := 0 to cvPageControl.PageCount - 1 do
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
  for i := 0 to cvPageControl.PageCount - 1 do
  begin
    if cvPageControl.Pages[i].Name = name then
    begin
      cvPageControl.Pages[1].TabVisible := true;
      cvPageControl.Pages[1].Visible    := true;
      cvPageControl.Pages[1].Enabled    := true;

      cvPageControl.Pages[i].TabVisible := true;
      cvPageControl.Pages[i].Visible    := true;
      cvPageControl.Pages[i].Enabled    := true;
      cvPageControl.Pages[i].SetFocus;
      cvPageControl.TabIndex := i;
      break;
    end;
  end;
end;

procedure TForm1.TypesGridSelectCell(
  Sender    : TObject ;
  ACol, ARow: Integer ; var
  CanSelect : Boolean);
var
  idCol: Integer;
begin
  if TypesGrid.Cells[1,0] = 'ID:' then
  idCol := 1 else
  idCol := 2;

  Stmt := DB.Prepare('SELECT * FROM customvariables WHERE varid = "' +
  TypesGrid.Cells[idCol,ARow] + '"');
  Stmt.Step;

  if Stmt.ColumnCount > 0 then
  begin
    EditID      .Text := Stmt.ColumnText( 1);
    EditName    .Text := Stmt.ColumnText( 2);
    EditDesc    .Text := Stmt.ColumnText( 3);
    EditNameDEU .Text := Stmt.ColumnText( 4);
    EditDescDEU .Text := Stmt.ColumnText( 5);
    EditNameFRA .Text := Stmt.ColumnText( 6);
    EditDescFRA .Text := Stmt.ColumnText( 7);
    EditNameSPA .Text := Stmt.ColumnText( 8);
    EditDescSPA .Text := Stmt.ColumnText( 9);
    defaultEdit .Text := Stmt.ColumnText(10);
    defaultEnum .Text := Stmt.ColumnText(11);
    defaultColor.Text := Stmt.ColumnText(12);
    // bool
    MemoBox     .Text := Stmt.ColumnText(14);

    varTypeCB   .ItemIndex := Stmt.ColumnInt(15);

    case varTypeCB.ItemIndex of
      0: begin ShowCvPageTabSheet('cvTabString' ); end;
      1: begin ShowCvPageTabSheet('cvTabBoolean'); end;
      2:
      begin
        ShowCvPageTabSheet('cvTabMemo');
        MemoBox.SetFocus;
      end;
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
  defaultColor.Text :=
  ColorToHtml1(JvOfficeColorPanel1.SelectedColor);
end;

procedure TForm1.JvOfficeColorPanel1Click(Sender: TObject);
begin
  JvOfficeColorPanel1ColorButtonClick(Sender);
end;

procedure TForm1.Panel3Click(Sender: TObject);
var URL: String;
begin
  URL := 'https://www.helpndoc.com';
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.JvBitBtn2Click(Sender: TObject);
begin
  if varEnumListBox.Items.Count < 1 then
  begin
    varEnumListBox.Color := clWhite;
    exit;
  end;
  varEnumListBox.Color := clYellow;
  varEnumListBox.MoveSelectedUp;
end;
procedure TForm1.JvBitBtn1Click(Sender: TObject);
begin
  if varEnumListBox.Items.Count < 1 then
  begin
    varEnumListBox.Color := clWhite;
    exit;
  end;
  varEnumListBox.Color := clYellow;
  varEnumListBox.MoveSelectedDown;
end;

procedure TForm1.editOnEnter(Sender: TObject);
begin
  (Sender as TEdit).Color := clYellow;
  projectFocused := false;
  projectsGrid.Repaint;
end;
procedure TForm1.editOnExit (Sender: TObject); begin (Sender as TEdit).Color := clWhite;  end;
procedure TForm1.editOnKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['a'..'z','A'..'Z','0'..'9','_',' ',Chr(127),Chr($8)]) then
  key := #0;
end;

procedure TForm1.varTypeCBEnter(Sender: TObject);
begin
  varTypeCB.Color := clWhite;
end;

procedure TForm1.varTypeCBExit(Sender: TObject);
begin
  varTypeCB.Color := clWhite;
end;

procedure TForm1.EditIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then EditName.SetFocus else
  if key = VK_TAB    then EditName.SetFocus;
end;

procedure TForm1.EditNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then EditDesc.SetFocus else
  if key = VK_TAB    then EditDesc.SetFocus;
end;

procedure TForm1.EditDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then EditID.SetFocus else
  if key = VK_TAB    then EditID.SetFocus;
end;

procedure TForm1.EditNameDEUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then EditDescDEU.SetFocus else
  if key = VK_TAB    then EditDESCDEU.SetFocus;
end;

procedure TForm1.EditDescDEUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then EditNameDEU.SetFocus else
  if key = VK_TAB    then EditNameDEU.SetFocus;
end;

procedure TForm1.defaultEnumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then defaultEnumValue.SetFocus else
  if key = VK_TAB    then defaultEnumValue.SetFocus else
end;

procedure TForm1.defaultEnumValueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then defaultEnum.SetFocus else
  if key = VK_TAB    then defaultEnum.SetFocus;
end;

procedure TForm1.EditNameFRAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then EditDescFRA.SetFocus else
  if key = VK_TAB    then EditDescFRA.SetFocus;
end;

procedure TForm1.EditDescFRAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then EditNameFRA.SetFocus else
  if key = VK_TAB    then EditNameFRA.SetFocus;
end;

procedure TForm1.varTypeCBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_TAB then EditName.SetFocus;
end;

procedure TForm1.EnumAddButtonClick(Sender: TObject);
var
  idxPos: Integer;
  idxCnt: Integer;
  idxStr: String;
begin
  if Length(Trim(defaultEnum.Text)) < 1 then
  begin
    Application.MessageBox(PChar(
    'Enum field must be not empty !'),PChar(
    'Warning'),MB_OK);
    exit;
  end;
  if Length(Trim(defaultEnumValue.Text)) < 1 then
  begin
    if Application.MessageBox(PChar(
       'enum value is empty !' + #13#10 +
       'Would you save empty data informations ?'), PChar(
       'Warning'),
       MB_YESNO) = ID_NO then
    begin
       defaultEnum.SetFocus;
       exit;
    end;
  end;

  // search for defaultEnum
  if varEnumListBox.Items.Count > 0 then
  begin
    for idxCnt := 0 to varEnumListBox.Items.Count - 1 do
    begin
      idxStr := varEnumListBox.Items.Strings[idxCnt];
      idxPos := Pos('=', idxStr);
      idxStr := Copy(idxStr,1,idxPos-1);
      if not (idxStr = defaultEnum.Text) then
      begin
        Application.MessageBox(PChar(
        'enum item name does not match !'),PChar(
        'Warning'),MB_OK);
        defaultEnum.SetFocus;
        exit;
      end;
    end;
  end;

  // search for defauleValue
  if varEnumListBox.Items.Count > 0 then
  begin
    for idxCnt := 0 to varEnumListBox.Items.Count - 1 do
    begin
      idxStr := varEnumListBox.Items.Strings[idxCnt];
      idxPos := Pos('=', idxStr);
      idxStr := Copy(idxStr,idxPos+1,Length(defaultEnumValue.Text));
//      ShowMessage(idxStr + ':' + varEnumListBox.Items.Strings[idxCnt]);
      if idxStr = defaultEnumValue.Text then
      begin
        Application.MessageBox(PChar(
        'enum item already exists !'),PChar(
        'Warning'),MB_OK);
        defaultEnum.SetFocus;
        exit;
      end;
    end;
  end;

  varEnumListBox.Color := clYellow;
  varEnumListBox.Items.Add(
  Trim(defaultEnum     .Text) + '=' +
  Trim(defaultEnumValue.Text));
end;

procedure TForm1.enumButtonClearClick(Sender: TObject);
begin
  if varEnumListBox.Items.Count > 0 then
  begin
    if Application.MessageBox(PChar(
    'do you really delete ALL items ?'),PChar(
    'Warning'),MB_YESNO) = ID_NO then
    begin
      defaultEnum.SetFocus;
      exit;
    end;
  end;

  varEnumListBox.Items.Clear;
  varEnumListBox.Color := clWhite;

  defaultEnum.Text := '';
  defaultEnumValue.Text := '';
  defaultEnum.SetFocus;
end;


procedure TForm1.JvAppEvents1Hint(Sender: TObject);
begin
  JvBalloonHint1.UseBalloonAsApplicationHint := true;
end;

procedure TForm1.enumDeleteButtonClick(Sender: TObject);
begin
  if varEnumListBox.Items.Count > 0 then
  begin
    if Application.MessageBox(PChar(
    'Warning' + #13#10 +
    'Would you delete the current item ?'),PChar(
    'Warning'),MB_YESNO) = ID_NO then
    exit;

    varEnumListBox.DeleteSelected;
    varEnumListBox.SetFocus;

    if varEnumListBox.Items.Count < 1 then
    varEnumListBox.Color := clWhite;
  end;
end;

procedure TForm1.addPopupMenu(menuObject: TJvPopupMenu);
var
  menuItem: TMenuItem;
begin
  if not DbOpenDialog.Execute then
  begin
    Application.MessageBox  (PChar(
    'something went wrong.'),PChar(
    'Error'),MB_OK);
    exit;
  end;

  menuItem := TMenuItem.Create(menuObject);
  menuItem.Caption := DbOpenDialog.FileName;
  menuObject.Items.Add(menuItem);
end;

procedure TForm1.enumButtonLoadClick(Sender: TObject); begin addPopupMenu(enumPopupLoad); end;
procedure TForm1.enumButtonSaveClick(Sender: TObject); begin addPopupMenu(enumPopupSave); end;

procedure TForm1.varButtonAddClick(Sender: TObject);
begin
  SaveBtnClick(Sender);
end;

procedure TForm1.varButtonDeleteClick(Sender: TObject);
begin
//
end;

procedure TForm1.projectsGridDrawCell(
  Sender: TObject; ACol,
  ARow  : Integer;
  Rect  : TRect;
  State : TGridDrawState);
var
  aCanvas: TCanvas;
begin
  aCanvas := (Sender as TJvStringGrid).Canvas;

  if (gdFocused in State) and (projectFocused = true) then
  begin
    aCanvas.Brush.Color := clBlue;
    aCanvas.FillRect(Rect);

    aCanvas.Font.Color := clYellow;
    aCanvas.Font.Size  := 11;
    aCanvas.Font.Style := [fsBold];
    aCanvas.TextOut(Rect.Left+42,Rect.Top+4,projectDataField[ARow,0]);

    aCanvas.Font.Color := clWhite;
    aCanvas.Font.Size  := 9;
    aCanvas.Font.Style := [];
    aCanvas.TextOut(Rect.Left+42,Rect.Top+23,projectDataField[ARow,1]);
  end else
  if (gdSelected in State) then
  begin
    aCanvas.Brush.Color := RGB(128,255,128);
    aCanvas.FillRect(Rect);

    aCanvas.Font.Color := clBlack;
    aCanvas.Font.Size  := 11;
    aCanvas.Font.Style := [fsBold];
    aCanvas.TextOut(Rect.Left+42,Rect.Top+4,projectDataField[ARow,0]);

    aCanvas.Font.Color := clGray;
    aCanvas.Font.Size  := 9;
    aCanvas.Font.Style := [];
    aCanvas.TextOut(Rect.Left+42,Rect.Top+23,projectDataField[ARow,1]);
  end else
  begin
    aCanvas.Brush.Color := clWhite;
    aCanvas.FillRect(Rect);

    aCanvas.Font.Color := clBlack;
    aCanvas.Font.Size  := 11;
    aCanvas.Font.Style := [fsBold];
    aCanvas.TextOut(Rect.Left+42,Rect.Top+4,projectDataField[ARow,0]);

    aCanvas.Font.Color := clGray;
    aCanvas.Font.Size  := 9;
    aCanvas.Font.Style := [];
    aCanvas.TextOut(Rect.Left+42,Rect.Top+23,projectDataField[ARow,1]);
  end;

  ImageList1.Draw(aCanvas,Rect.Left,Rect.Top+4,0);
end;

procedure TForm1.projectPageControlChange(Sender: TObject);
var
  i: Integer;
begin
  if TPageControl(Sender).ActivePage = propertiesTabSheet then
  begin
    if (inspCat = nil) or (not Assigned(inspCat)) then
    begin
      InspCat := TJvInspectorCustomCategoryItem.Create(JvInspector1.Root, nil);
      InspCat.DisplayName := 'Inspector Settings';
    end;
  end;
  exit;

  for i := 0 to cvPageControl.PageCount - 1 do
  cvPageControl.Pages[i].TabVisible := false;

  if projectPageControl.ActivePageIndex = 0 then
  begin
    cvPageControl.Pages[0].TabVisible := true;
    cvPageControl.Pages[0].Enabled    := true;
  end else
  begin
    cvPageControl.Pages[1].TabVisible := true ;
    cvPageControl.Pages[1].Enabled    := true;
  end;
end;

procedure TForm1.projectsGridDblClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to 5 do
  PageControl1.Pages[i].TabVisible := true;

  projectPageControl.Pages[1].TabVisible := true;
  projectPageControl.ActivePageIndex := 1;

  cvPageControl.Pages[0].TabVisible := false;
  cvPageControl.Pages[1].TabVisible := true;
  cvPageControl.Pages[1].Enabled    := true;
end;

procedure TForm1.cvPageControlChange(Sender: TObject);
begin
  if cvPageControl.ActivePageIndex = 1 then
     cvPageControl.Enabled   := true;
end;

procedure TForm1.OpenexistingProject1Click(Sender: TObject);
var
  rows: Integer;
  oldCursor: TCursor;
begin
  if not DBOpenDialog.Execute then
  begin
    Application.MessageBox(  PChar(
    'something went wrong during open database.'),PChar(
    'Warning'),MB_OK);
    exit;
  end;

  oldCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  projectsDB.Close;
  projectsDB.Open(DBOpenDialog.FileName);

  Stmt := projectsDB.Prepare('SELECT * FROM data');
  Stmt.Step;
  if Length(Trim(Stmt.ColumnText(2))) < 1 then
  begin
    if Application.MessageBox(  PChar(
    'something went wrong during read database.' + #13#10 +
    'proberly no records.'                       + #13#10 +
    'would you like create the project DB ?'),PChar(
    'Warning'),MB_YESNO) = ID_NO then exit;

    projectsDBcreate;

    projectEdit1.Text := 'Unknow Name';
    projectEdit2.Text := GetCurrentDir;
    projectEdit3.Text := 'Project Title';
    projectEdit4.Text := '';
    projectEdit5.Text := '1.0.0';
    projectEdit6.Text := 'Copyright (c) 2023';

    Stmt := projectsDB.Prepare('INSERT INTO data (' +
    'id,name,path,title,author,version,copyright) VALUES ' +
    '(?,?,?,?,?,?,?)');
    Stmt.BindInt ( 1, rows);
    Stmt.BindText( 2, projectEdit1.Text);  // project name
    Stmt.BindText( 3, projectEdit2.Text);  // path
    Stmt.BindText( 4, projectEdit3.Text);  // title
    Stmt.BindText( 5, projectEdit4.Text);  // author
    Stmt.BindText( 6, projectEdit5.Text);  // version
    Stmt.BindText( 7, projectEdit6.Text);  // copyright note
    Stmt.Step;

    projectDataField[projectCount+1,0] := projectEdit1.Text;
    projectDataField[projectCount+1,1] := LeftStr(GetCurrentDir,20) + '...';

    inc(projectCount);
    ScrollBox22.Visible := true;
  end else
  begin
    rows := projectsGrid.RowCount + 1;

    projectDataField[projectCount,0] := Stmt.ColumnText(2);
    projectDataField[projectCount,1] := Stmt.ColumnText(3);
  end;

  Screen.Cursor := oldCursor;
end;

procedure TForm1.ShowCellHint(AGrid: TJvStringGrid; x,y: Integer);
var
  ACol, ARow: Integer;
begin
  if not AGrid.ShowHint then
         AGrid.ShowHint := true;

  AGrid.MouseToCell(X,Y,ACol,ARow);

  if (ARow > -1) then
  begin
    JvBalloonHint1.DefaultHeader := 'Project: ' +
    projectDataField[ARow,0]; AGrid.Hint :=
    projectDataField[ARow,1];
  end else
  begin
    Application.CancelHint;
  end;
end;

procedure TForm1.CreatenewProject1Click(Sender: TObject);
var
  rows: Integer;
begin
  rows :=
  projectsGrid.RowCount ;  inc(rows);
  projectsGrid.RowCount := rows;

  inc(projectCount);
  AddNewProject(projectCount);

  (*ShowMessage('new: ' + inttostr(projectCount));
  projectDataField[projectCount,0] := 'Project_A' + inttostr(projectCount);
  projectDataField[projectCount,1] := 'C:\' + inttostr(projectCount);

  projectCount := projectCount + 1;*)
end;

procedure TForm1.projectsGridMouseMove(
  Sender: TObject;
  Shift : TShiftState;
  X, Y  : Integer);
var
  Acol, arow: Integer;
begin
  TJvStringGrid(Sender).MouseToCell(X,Y,ACol,ARow);
  label44.Caption := inttostr(acol) + ' : ' + inttostr(arow);
  ShowCellHint(TJvStringGrid(Sender),x,y);
end;

procedure TForm1.projectsGridMouseEnter(Sender: TObject);
begin
  projectHeader := JvBalloonHint1.DefaultHeader;
end;

procedure TForm1.projectsGridMouseLeave(Sender: TObject);
begin
  JvBalloonHint1.DefaultHeader := projectHeader;
end;

procedure TForm1.Button30Click(Sender: TObject);
var
  htmlForm: TForm;
  htmlButton: TButton;
begin
  htmlForm := TForm.Create(Application);
  htmlForm.Top  := 100;
  htmlForm.Left := 100;
  htmlForm.Width := 300;
  htmlForm.Height := 300;

  htmlButton := TButton.Create(htmlForm);
  htmlButton.Parent := htmlForm;
  htmlButton.Top := 20;
  htmlButton.Left := 20;
  htmlButton.Width := 100;
  htmlButton.Height := 25;
  htmlButton.Caption := 'test';
  htmlButton.Show;

  JvFormToHtml1.FormToHtml(htmlForm,'test.html');
end;

function TForm1.JvAppEvents1Help(
  Command     : Word;
  Data        : Integer;
  var CallHelp: Boolean): Boolean;
  var
  helpWindow  : THandle;
  helpFile    : String;
begin
  // make sure, VCL does not activate WinHelp
  CallHelp := false;
  result := true;
  try
    helpFile := Trim(self.HelpFile);
    if (Length(helpFile) < 3)
    or (FileExists(helpFile) = false) then
    begin
      Application.MessageBox(PChar(
      'Help file: "' + helpFile + '"' + #13#10 +
      'could not be found/open !'),PChar('Warning'),MB_OK);
      result := false;
      exit;
    end;
    if Command in [HELP_CONTEXT,HELP_CONTEXTPOPUP] then
    begin
      // ordinary context jump
      helpWindow := HtmlHelp(Application.Handle,
      PChar(helpFile),
      HH_DISPLAY_TOC, data);
    end;
    if Command = HELP_KEY then
    begin
      // Keyword lookup
      helpWindow := HtmlHelp(Application.Handle,
      PChar(helpFile),
      HH_DISPLAY_INDEX, data);
    end else
    if Command = HELP_QUIT then
    begin
      // Application quits -> close all its help files
      helpWindow := HtmlHelp(Application.Handle, nil,
      HH_CLOSE_ALL, 0);
    end else
    begin
      // Any other command -> display table of contents
      helpWindow := HtmlHelp(Application.Handle,
      PChar(helpFile),
      HH_HELP_FINDER, 0);
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Help file Exception in Application:' + #13#10 +
      E.Message);
    end;
  end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  caller: Boolean;
begin
  if key = VK_F1 then
  JvAppEvents1Help(HELP_CONTEXT or HELP_CONTEXTPOPUP,0,caller);
end;

procedure TForm1.htmlDesignPanelPaint(Sender: TObject);
begin
  with htmlDesignPanel do
    DesignPaintGrid(Canvas, ClientRect, Color);
end;

procedure TForm1.projectsGridSelectCell(
  Sender       : TObject;
  ACol, ARow   : Integer;
  var CanSelect: Boolean);
begin
  if projectDataModified then
  begin
    SaveProject;
    projectsGridClick(Sender);
    projectDataModified := false;
  end;
end;

procedure TForm1.projectsGridClick(Sender: TObject);
begin
  projectFocused := true;
  SelectProject(projectsGrid.Row+1);
  projectsGrid.Repaint;
end;

procedure TForm1.UpdateProjectField(
  field    : String;
  text     : TObject;
  var key  : Char;
  nextFocus: TObject);
  var
  fieldStr : String;
begin
  if (text is TEdit) then fieldStr := TEdit(text).Text else
  if (text is TMemo) then fieldStr := TMemo(text).Text;

  if (key = #10) or (key = #13) then
  begin
    Stmt := projectsDB.Prepare('UPDATE data SET ' +
    field + ' = "' + fieldStr + '" WHERE id = ' +
    IntToStr(projectsGrid.Row + 1));
    Stmt.Step;
    SelectProject(projectsGrid.Row+1);

    if (nextFocus is TEdit) then TEdit(nextFocus).SetFocus else
    if (nextFocus is TMemo) then TMemo(nextFocus).SetFocus;
    
    key := #0;
  end else
  if not (key in ['a'..'z','A'..'Z','0'..'9','_',' ',Chr(127),Chr($8)]) then
  key := #0;
end;

procedure TForm1.projectEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  projectDataModified := true;
  UpdateProjectField('name',
  projectEdit1,key,
  projectEdit2);
end;

procedure TForm1.projectEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  projectDataModified := true;
  UpdateProjectField('path',
  projectEdit2,key,
  projectEdit3);
end;

procedure TForm1.projectEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  projectDataModified := true;
  UpdateProjectField('title',
  projectEdit3,key,
  projectEdit4);
end;

procedure TForm1.projectEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  projectDataModified := true;
  UpdateProjectField('author',
  projectEdit4,key,
  projectEdit5);
end;

procedure TForm1.projectEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  projectDataModified := true;
  UpdateProjectField('version',
  projectEdit5,key,
  projectEdit6);
end;

procedure TForm1.projectEdit6KeyPress(Sender: TObject; var Key: Char);
begin
  projectDataModified := true;
  UpdateProjectField('copyright',
  projectEdit6,key,
  projectEdit7);
end;

procedure TForm1.projectEdit7KeyPress(Sender: TObject; var Key: Char);
begin
  projectDataModified := true;
  UpdateProjectField('summary',
  projectEdit7,key,
  projectEdit8);
end;

end.

