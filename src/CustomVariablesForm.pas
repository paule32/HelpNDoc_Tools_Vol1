unit CustomVariablesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ToolWin, ComCtrls, StdCtrls, Menus,
  ShellApi;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    ListBox1: TListBox;
    CoolBar1: TCoolBar;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
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
    Exit1: TMenuItem;
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
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Image1Click(Sender: TObject);
var URL: String;
begin
  URL := 'https://www.helpndoc.com';
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject); begin FilePopupMenu.Popup(Mouse.CursorPos.x, Mouse.CursorPos.y); end;
procedure TForm1.SpeedButton2Click(Sender: TObject); begin EditPopupMenu.Popup(Mouse.CursorPos.x, Mouse.CursorPos.y); end;

procedure TForm1.FormResize(Sender: TObject);
begin
  CoolBar1.Bands.Items[2]
end;

end.
