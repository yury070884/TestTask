program Test;

uses
  Vcl.Forms,
  DelphiTest in 'DelphiTest.pas' {MainForm},
  AddCustomer in 'UI\Customers\AddCustomer.pas' {AddCustomerForm},
  AddOrder in 'UI\Orders\AddOrder.pas' {AddOrderForm},
  AddCreditTransaction in 'UI\CreditTransactions\AddCreditTransaction.pas' {AddCreditTransactionForm},
  Report in 'UI\Report.pas' {ReportForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddCustomerForm, AddCustomerForm);
  Application.CreateForm(TAddOrderForm, AddOrderForm);
  Application.CreateForm(TAddCreditTransactionForm, AddCreditTransactionForm);
  Application.CreateForm(TReportForm, ReportForm);
  Application.Run;
end.
