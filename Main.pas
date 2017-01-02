unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, RzEdit, Vcl.Mask, RzButton;

type
  TfxMain = class(TForm)
    FDConnection1: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDTable1: TFDTable;
    RzDBGrid1: TRzDBGrid;
    DataSource1: TDataSource;
    FDTable1NAME: TStringField;
    FDTable1AGE: TIntegerField;
    RzMemo1: TRzMemo;
    edDBPath: TRzEdit;
    btnCreate: TRzButton;
    btnActiveDB: TRzButton;
    FDTable1ID: TStringField;
    edID: TRzEdit;
    edAGE: TRzEdit;
    edName: TRzEdit;
    btnAddRecord: TRzButton;
    procedure btnCreateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure FDPhysSQLiteDriverLink1DriverCreated(Sender: TObject);
    procedure FDPhysSQLiteDriverLink1DriverDestroying(Sender: TObject);
    procedure btnActiveDBClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnAddRecordClick(Sender: TObject);
  private
    { Private declarations }
    procedure Log(Log: string);
  public
    { Public declarations }
  end;

var
  fxMain: TfxMain;

implementation

{$R *.dfm}

procedure TfxMain.btnActiveDBClick(Sender: TObject);
begin

  FDTable1.Open;

end;

procedure TfxMain.btnAddRecordClick(Sender: TObject);
var
  SQL: String;
begin
  FDTable1.SQL.Clear;
  SQL := '';
  SQL := format('INSERT INTO FDPERSION VALUES("%s",%s,%d);',
    [edID.Text, edName.Text, StrToInt(edAGE.Text)]);
  FDTable1.SQL.Add(SQL);
  FDTable1.ExecSQL;
  FDTable1.Open;

end;

procedure TfxMain.btnCreateClick(Sender: TObject);
begin

  with FDConnection1 do
  begin
    Params.Values['DriverID'] := 'SQLite';
    Params.Values['Database'] := edDBPath.Text + 'demo.sdb';
  end;
  FDConnection1.Connected := True;
  FDTable1.CreateTable;

end;

procedure TfxMain.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if Field <> nil then
    Log('OnCreated' + Field.ToString);
end;

procedure TfxMain.FDConnection1AfterConnect(Sender: TObject);
begin
  Log('Database Connected');
end;

procedure TfxMain.FDPhysSQLiteDriverLink1DriverCreated(Sender: TObject);
begin
  Log('OnCreated');
end;

procedure TfxMain.FDPhysSQLiteDriverLink1DriverDestroying(Sender: TObject);
begin
  Log('DriverDestroying');
end;

procedure TfxMain.FormShow(Sender: TObject);
begin
  RzEdit1.Text := ExtractFilePath(Application.ExeName);
end;

procedure TfxMain.Log(Log: string);
begin
  RzMemo1.Lines.Add(Log);
end;

end.
