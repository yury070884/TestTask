unit DelphiTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, AddCustomer, AddOrder, AddCreditTransaction, Report,
  Vcl.WinXPickers, FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.Text,
  FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.BatchMove.SQL;

type
  TMainForm = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDUpdateSQL1: TFDUpdateSQL;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBGrid1: TDBGrid;
    FDQuery1code: TFDAutoIncField;
    FDQuery1name: TWideStringField;
    FDQuery1address: TWideStringField;
    FDQuery1VAT: TWideStringField;
    FDQuery1creditLimit: TBCDField;
    FDQuery1salesVolume: TBCDField;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid2: TDBGrid;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    FDQuery2: TFDQuery;
    FDQuery2customerCode: TIntegerField;
    FDQuery2date: TSQLTimeStampField;
    FDQuery2serviceDescription: TWideStringField;
    FDQuery2saleValue: TBCDField;
    FDQuery2id: TFDAutoIncField;
    FDQuery3: TFDQuery;
    DBGrid3: TDBGrid;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    FDQuery3id: TFDAutoIncField;
    FDQuery3customerCode: TIntegerField;
    FDQuery3date: TSQLTimeStampField;
    FDQuery3creditValue: TBCDField;
    DataSource4: TDataSource;
    FDQuery4: TFDQuery;
    DataSource5: TDataSource;
    FDQuery5: TFDQuery;
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    Button10: TButton;
    FDQuery4date: TSQLTimeStampField;
    FDQuery4serviceDescription: TWideStringField;
    FDQuery4saleValue: TBCDField;
    FDQuery5date: TSQLTimeStampField;
    FDQuery5creditValue: TBCDField;
    FDQuery6: TFDQuery;
    DataSource6: TDataSource;
    DatePicker1: TDatePicker;
    DatePicker2: TDatePicker;
    Button11: TButton;
    FDQuery6date: TSQLTimeStampField;
    FDQuery6serviceDescription: TWideStringField;
    FDQuery6saleValue: TBCDField;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button12: TButton;
    FDBatchMove1: TFDBatchMove;
    FDQuery7: TFDQuery;
    FDBatchMoveTextReader1: TFDBatchMoveTextReader;
    FDQuery8: TFDQuery;
    FDBatchMoveSQLWriter1: TFDBatchMoveSQLWriter;
    DataSource7: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FDQuery2AfterInsert(DataSet: TDataSet);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FDQuery3AfterInsert(DataSet: TDataSet);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure FDBatchMove1WriteValue(ASender: TObject;
      AItem: TFDBatchMoveMappingItem; var AValue: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  currentCustomerCode : integer;
  currentCreditValue : real;

implementation

{$R *.dfm}

procedure TMainForm.Button10Click(Sender: TObject);
begin
  FDQuery4.Active := false;
  FDQuery5.Active := false;
  FDQuery4.ParamByName('code').AsInteger := StrToInt(Edit1.Text);
  FDQuery5.ParamByName('code').AsInteger := StrToInt(Edit1.Text);
  FDQuery4.Active := true;
  FDQuery5.Active := true;
end;

procedure TMainForm.Button11Click(Sender: TObject);
begin
  FDQuery6.Active := false;
  FDQuery6.ParamByName('code').AsInteger := StrToInt(Edit1.Text);
  FDQuery6.ParamByName('date1').AsDate := DatePicker1.Date;
  FDQuery6.ParamByName('date2').AsDate := DatePicker2.Date;
  FDQuery6.Active := true;
  ReportForm.RLReport1.Preview();
end;

procedure TMainForm.Button12Click(Sender: TObject);
var
  selectedFile: string;
  dlg: TOpenDialog;
  i: integer;
begin
  selectedFile := '';
  dlg := TOpenDialog.Create(nil);
  try
    dlg.InitialDir := 'C:\';
    dlg.Filter := 'CSV (*.csv)|*.csv';
    if dlg.Execute(Handle) then
      selectedFile := dlg.FileName;
  finally
    dlg.Free;
  end;

  if selectedFile <> '' then
  begin
    FDBatchMoveTextReader1.FileName := selectedFile;
    try
      FDBatchMoveTextReader1.DataDef.Separator := ';';
      FDBatchMoveTextReader1.DataDef.WithFieldNames := true;
      FDBatchMove1.Execute();
      DBGrid3.DataSource := DataSource7;
      FDQuery7.Close();
      FDQuery7.Open();
    except
      on e: exception do ShowMessage(e.message);
    end;
  end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  FDQuery1.Append();
  AddCustomerForm.Caption := 'Add Item';
  AddCustomerForm.ShowModal();
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
  FDQuery1.Edit();
  AddCustomerForm.Caption := 'Edit Item';
  AddCustomerForm.ShowModal();
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  FDQuery1.Delete();
  FDQuery1.Close();
  FDQuery1.Open();
end;

procedure TMainForm.Button4Click(Sender: TObject);
begin
  FDQuery2.Append();
  AddOrderForm.Caption := 'Add Item';
  AddOrderForm.ShowModal();
end;

procedure TMainForm.Button5Click(Sender: TObject);
begin
  FDQuery2.Edit();
  AddOrderForm.Caption := 'Edit Item';
  AddOrderForm.ShowModal();
end;

procedure TMainForm.Button6Click(Sender: TObject);
begin
  FDQuery2.Delete();
  FDQuery2.Close();
  FDQuery2.Open();
end;

procedure TMainForm.Button7Click(Sender: TObject);
begin
  FDQuery3.Append();
  AddCreditTransactionForm.Caption := 'Add Item';
  AddCreditTransactionForm.ShowModal();
end;

procedure TMainForm.Button8Click(Sender: TObject);
begin
  FDQuery3.Edit();
  AddCreditTransactionForm.Caption := 'Edit Item';
  AddCreditTransactionForm.ShowModal();
end;

procedure TMainForm.Button9Click(Sender: TObject);
begin
  FDQuery3.Delete();
  FDQuery3.Close();
  FDQuery3.Open();
end;

procedure TMainForm.FDBatchMove1WriteValue(ASender: TObject;
  AItem: TFDBatchMoveMappingItem; var AValue: Variant);
begin
  if (AItem.AsText = 'customerCode') then
  begin
    currentCustomerCode := AValue;
  end;
  if (AItem.AsText = 'creditValue') then
  begin
    currentCreditValue := AValue;
    FDQuery8.ExecSQL('update Customer set creditLimit = creditLimit + ' + FloatToStr(currentCreditValue) + ' where code = ' + IntToStr(currentCustomerCode));
    DataSource1.DataSet.Refresh;
  end;
end;

procedure TMainForm.FDQuery2AfterInsert(DataSet: TDataSet);
begin
  FDQuery2.FieldByName('date').AsDateTime := Now();
end;

procedure TMainForm.FDQuery3AfterInsert(DataSet: TDataSet);
begin
  FDQuery3.FieldByName('date').AsDateTime := Now();
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FDConnection1.Close();
  FDConnection1.Open();

  FDQuery1.Close();
  FDQuery1.Open();

  FDQuery2.Close();
  FDQuery2.Open();

  FDQuery3.Close();
  FDQuery3.Open();

  FDQuery4.Close();
  FDQuery4.Open();

  FDQuery5.Close();
  FDQuery5.Open();

  FDQuery6.Close();
  FDQuery6.Open();
end;

end.
