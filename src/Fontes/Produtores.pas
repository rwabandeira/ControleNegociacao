unit Produtores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CrudCadastro, StdCtrls, Buttons, ExtCtrls, Mask, SqlExPr,
  PesquisarProdutores, _Produtor, UITypes, _Biblioteca, Vcl.Grids;

type
  TFrProdutores = class(TFrCrudCadastro)
    lbCodigo: TLabel;
    lbNome: TLabel;
    lbCpfCnpj: TLabel;
    eCodigo: TEdit;
    eNome: TEdit;
    rgInscricao: TRadioGroup;
    meCpfCnpj: TMaskEdit;
    stLimiteCredito: TStaticText;
    sgLimiteCredito: TStringGrid;
    btIncluir: TButton;
    btAlterar: TButton;
    btRemover: TButton;
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure eCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgInscricaoClick(Sender: TObject);
  private
    { Private declarations }
    produtores: TArrayOfWebProdutor;
    procedure MontarDados(produtores: TArrayOfWebProdutor);
    procedure VerificarDados;
  public
    { Public declarations }
  end;

var
  FrProdutores: TFrProdutores;

implementation

{$R *.dfm}

uses _DB;

procedure TFrProdutores.btCancelarClick(Sender: TObject);
begin
  inherited;
  eCodigo.Clear;
  eNome.Clear;
  rgInscricao.ItemIndex := -1;
  lbCpfCnpj.Caption := 'CPF/CNPJ';
  meCpfCnpj.Clear;
  meCpfCnpj.EditMask := '';
  sgLimiteCredito.RowCount := 1;

  eCodigo.Enabled := True;
  eNome.Enabled := False;
  rgInscricao.Enabled := False;
  meCpfCnpj.Enabled := False;
  sgLimiteCredito.Enabled := False;

  eCodigo.SetFocus;
end;

procedure TFrProdutores.btExcluirClick(Sender: TObject);
var
  con: TSqlConnection;
begin
  inherited;
  if eCodigo.Text = '' then
    Abort;

  if MessageDlg('Deseja remover o produtor selecionado?', mtconfirmation, mbokcancel, 0) = 1 then begin
    con := _DB.Conexao;

    try
      _Produtor.ExcluirProdutor(con, StrToInt(eCodigo.Text));
      Application.MessageBox('Registro excluido com sucesso!', 'Aten��o', 0);
      btCancelarClick(Self);
    except on e: Exception do
      ShowMessage(e.Message);
    End;
  end;
end;

procedure TFrProdutores.btGravarClick(Sender: TObject);
var
  con: TSqlConnection;
  produtor: WebProdutor;
begin
  inherited;
  VerificarDados;
  
  con := _DB.Conexao;

  if eCodigo.Text = '' then
    produtor.produtor_id := 0
  else
    produtor.produtor_id := StrToInt(eCodigo.Text);

  produtor.nome := eNome.Text;

  if rgInscricao.ItemIndex = 0 then
    produtor.inscricao := 'F'
  else
    produtor.inscricao := 'J';

  produtor.cpf_cnpj := meCpfCnpj.Text;

  try
    _Produtor.AtualizarProdutor(con, produtor);
    Application.MessageBox(Pchar('Produtor atualizado com sucesso!'), 'Aten��o', 0);
    btCancelarClick(Self);
  except on e: Exception do
    ShowMessage(e.Message);
  end;
end;

procedure TFrProdutores.btPesquisarClick(Sender: TObject);
var
  frmPesquisa: TFrPesquisarProdutores;
begin
  inherited;
  frmPesquisa := TFrPesquisarProdutores.Create(Self);
  frmPesquisa.ShowModal;

  produtores := nil;

  if frmPesquisa.produtor.produtor_id > 0 then begin
    SetLength(produtores, 1);
    produtores[0].produtor_id := frmPesquisa.produtor.produtor_id;
    produtores[0].nome := frmPesquisa.produtor.nome;
    produtores[0].inscricao := frmPesquisa.produtor.inscricao;
    produtores[0].cpf_cnpj := frmPesquisa.produtor.cpf_cnpj;
  end;

  FreeAndNil(frmPesquisa);

  if produtores <> nil then
    MontarDados(produtores);
end;

procedure TFrProdutores.eCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  con: TSqlConnection;
begin
  inherited;
  if Key = VK_RETURN then begin
    produtores := nil;
    if eCodigo.Text <> '' then begin
      con := _DB.Conexao;
      produtores := _Produtor.BuscarProdutores(con, 'and PRODUTOR_ID = ' + eCodigo.Text);

      if produtores = nil then begin
        Application.MessageBox('Produtor n�o encontrado!!', 'Aten��o', 0);
        Abort;
      end;
    end;

    MontarDados(produtores);
  end;
end;

procedure TFrProdutores.MontarDados(produtores: TArrayOfWebProdutor);
var
  i: Integer;
begin
  if not eNome.Enabled then
    eNome.Enabled := True;

  if not rgInscricao.Enabled then
    rgInscricao.Enabled := True;

  rgInscricao.ItemIndex := 0;

  if not meCpfCnpj.Enabled then
    meCpfCnpj.Enabled := True;

  for i := Low(produtores) to High(produtores) do begin
    eCodigo.Text := IntToStr(produtores[i].produtor_id);
    eNome.Text := produtores[i].nome;

    if produtores[i].inscricao = 'F' then begin
      rgInscricao.ItemIndex := 0;
      meCpfCnpj.EditMask := '000\.000\.000\-00;1;_';
    end
    else begin
      rgInscricao.ItemIndex := 1;
      meCpfCnpj.EditMask := '00\.000\.000\/0000\-00;1;_';
    end;

    meCpfCnpj.Text := produtores[i].cpf_cnpj;
  end;

  eNome.SetFocus;
  eCodigo.Enabled := False;
end;

procedure TFrProdutores.rgInscricaoClick(Sender: TObject);
begin
  inherited;
  if rgInscricao.ItemIndex = 0 then begin
    lbCpfCnpj.Caption := 'CPF';
    meCpfCnpj.EditMask := '000\.000\.000\-00;1;_';
  end
  else begin
    lbCpfCnpj.Caption := 'CNPJ';
    meCpfCnpj.EditMask := '00\.000\.000\/0000\-00;1;_';
  end;
end;

procedure TFrProdutores.VerificarDados;
begin
  if not _Biblioteca.ValidarCpfCnpj(meCpfCnpj.Text) then begin
    MessageDlg('CPF ou CNPJ inv�lido!', mtInformation, mbOKCancel, 0);
    meCpfCnpj.SetFocus;
    Abort;
  end;
end;

end.
