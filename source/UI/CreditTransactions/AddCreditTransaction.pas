unit AddCreditTransaction;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Mask,
  Vcl.DBCtrls;

type
  TAddCreditTransactionForm = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Button2: TButton;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddCreditTransactionForm: TAddCreditTransactionForm;

implementation

{$R *.dfm}

uses DelphiTest;

procedure TAddCreditTransactionForm.Button1Click(Sender: TObject);
begin
  MainForm.FDQuery3.Cancel();
  Close();
end;

procedure TAddCreditTransactionForm.Button2Click(Sender: TObject);
begin
  MainForm.FDQuery3.Post();
  MainForm.FDQuery1.Edit();
  MainForm.FDQuery1.FieldByName('creditLimit').AsFloat := MainForm.FDQuery1.FieldByName('creditLimit').AsFloat + StrToFloat(DBEdit2.Text);
  MainForm.FDQuery1.Post();
  Close();
end;

end.
