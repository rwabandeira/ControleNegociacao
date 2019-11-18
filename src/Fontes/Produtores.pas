unit Produtores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CrudCadastro, StdCtrls, Buttons, ExtCtrls, Mask, SqlExPr,
  PesquisarProdutores, _Produtor, UITypes, _Biblioteca, Grids, _LimiteCredito,
  PesquisarDistribuidores, LimiteCreditos;

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
    btInserir: TButton;
    btAlterar: TButton;
    btRemover: TButton;
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure eCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgInscricaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btInserirClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
  private
    { Private declarations }
    limite_creditos: TArrayOfWebLimiteCreditos;
    novo_registro: Boolean;
    produtores: TArrayOfWebProdutor;
    procedure MontarDados(produtores: TArrayOfWebProdutor);
    procedure VerificarDados;
    procedure PreencherGrid;
  public
    { Public declarations }
  end;

const
  //sgLimiteCredito
  cDistribuidor_Id  = 0;
  cNome             = 1;
  cLimite_Credito   = 2;

var
  FrProdutores: TFrProdutores;

implementation

{$R *.dfm}

uses _DB;

procedure TFrProdutores.PreencherGrid;
var
  i: Integer;
  linha: Integer;
begin
  linha := sgLimiteCredito.FixedRows;
  sgLimiteCredito.RowCount := sgLimiteCredito.FixedRows + 1;

  for i := Low(limite_creditos) to High(limite_creditos) do begin
    sgLimiteCredito.Cells[cDistribuidor_Id, linha] := IntToStr(limite_creditos[i].distribuidor_id);
    sgLimiteCredito.Cells[cNome, linha] := limite_creditos[i].nome_distribuidor;
    sgLimiteCredito.Cells[cLimite_Credito, linha] := FloatToStr(limite_creditos[i].limite_credito);

    linha := linha + 1;
  end;

  sgLimiteCredito.RowCount := IIf(linha <> sgLimiteCredito.RowCount -1, linha, sgLimiteCredito.RowCount);
end;

procedure TFrProdutores.btCancelarClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  eCodigo.Clear;
  eNome.Clear;
  rgInscricao.ItemIndex := -1;
  lbCpfCnpj.Caption := 'CPF/CNPJ';
  meCpfCnpj.Clear;
  meCpfCnpj.EditMask := '';
  sgLimiteCredito.RowCount := sgLimiteCredito.FixedRows + 1;

  for i := 0 to sgLimiteCredito.ColCount -1 do begin
    sgLimiteCredito.Cells[i, sgLimiteCredito.FixedRows] := '';
  end;

  sgLimiteCredito.Row := sgLimiteCredito.FixedRows;

  eCodigo.Enabled := True;
  eNome.Enabled := False;
  rgInscricao.Enabled := False;
  meCpfCnpj.Enabled := False;
  sgLimiteCredito.Enabled := False;
  btInserir.Enabled := False;
  btAlterar.Enabled := False;
  btRemover.Enabled := False;

  novo_registro := True;
  limite_creditos := nil;

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
  i: Integer;
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

  produtor.limite_creditos := nil;
  for i := sgLimiteCredito.FixedRows to sgLimiteCredito.RowCount -1 do begin
    if sgLimiteCredito.Cells[cDistribuidor_Id, i] = '' then
      Break;

    SetLength(produtor.limite_creditos, Length(produtor.limite_creditos) + 1);
    produtor.limite_creditos[High(produtor.limite_creditos)].produtor_id := StrToInt(eCodigo.Text);
    produtor.limite_creditos[High(produtor.limite_creditos)].distribuidor_id := StrToInt(sgLimiteCredito.Cells[cDistribuidor_Id, i]);
    produtor.limite_creditos[High(produtor.limite_creditos)].limite_credito := StrToInt(sgLimiteCredito.Cells[cLimite_Credito, i]);
  end;

  try
    _Produtor.AtualizarProdutor(con, produtor);
    Application.MessageBox(Pchar('Produtor atualizado com sucesso!'), 'Aten��o', 0);
    btCancelarClick(Self);
  except on e: Exception do
    ShowMessage(e.Message);
  end;
end;

procedure TFrProdutores.btInserirClick(Sender: TObject);
var
  limite_creditos: TArrayOfWebLimiteCreditos;
  form: TFrLimiteCreditos;
  linha: Integer;
  i: Integer;
begin
  inherited;
  form := TFrLimiteCreditos.Create(Self);
  form.ShowModal;

  if form._cancelou then begin
    form.limite_creditos := nil;
    Application.MessageBox('Opera��o cancelada', 'Aten��o', 0);
  end;

  limite_creditos := form.limite_creditos;

  FreeAndNil(form);

  if limite_creditos = nil then
    Exit;

  for i := Low(limite_creditos) to High(limite_creditos) do begin
    linha := sgLimiteCredito.RowCount -1;
    sgLimiteCredito.Cells[cDistribuidor_Id, linha] := IntToStr(limite_creditos[i].distribuidor_id);
    sgLimiteCredito.Cells[cNome, linha] := limite_creditos[i].nome_distribuidor;
    sgLimiteCredito.Cells[cLimite_Credito, linha] := FloatToStr(limite_creditos[i].limite_credito);

    linha := linha + 1;

    sgLimiteCredito.RowCount := linha +1;
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

procedure TFrProdutores.btRemoverClick(Sender: TObject);
begin
  inherited;
  _Biblioteca.RemoverLinhaGrid(sgLimiteCredito, sgLimiteCredito.Row);
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

      novo_registro := False;
    end;

    MontarDados(produtores);
  end;
end;

procedure TFrProdutores.FormCreate(Sender: TObject);
begin
  inherited;
  novo_registro := True;
  limite_creditos := nil;
end;

procedure TFrProdutores.FormShow(Sender: TObject);
begin
  inherited;
  sgLimiteCredito.Cells[cDistribuidor_Id, sgLimiteCredito.FixedRows -1] := 'C�digo';
  sgLimiteCredito.Cells[cNome, sgLimiteCredito.FixedRows -1] := 'Distribuidor';
  sgLimiteCredito.Cells[cLimite_Credito, sgLimiteCredito.FixedRows -1] := 'Limite de cr�dito';
end;

procedure TFrProdutores.MontarDados(produtores: TArrayOfWebProdutor);
var
  i: Integer;
  con: TSqlConnection;
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

    if not sgLimiteCredito.Enabled then begin
      sgLimiteCredito.Enabled := True;
      btInserir.Enabled := True;
      btAlterar.Enabled := True;
      btRemover.Enabled := True;
    end;
  end;

  if not novo_registro then begin
    con := _DB.Conexao;
    limite_creditos := _LimiteCredito.BuscarLimiteCreditos(con, StrToInt(eCodigo.Text));

    PreencherGrid;
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