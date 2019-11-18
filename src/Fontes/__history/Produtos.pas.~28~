unit Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CrudCadastro, StdCtrls, Buttons, ExtCtrls, Mask, SqlExPr,
  PesquisarProdutos, _Produto, UITypes, _Biblioteca, Vcl.Grids, _DB;

type
  TFrProdutos = class(TFrCrudCadastro)
    lbCodigo: TLabel;
    lbNome: TLabel;
    lbPrecoVenda: TLabel;
    eCodigo: TEdit;
    eNome: TEdit;
    ePrecoVenda: TEdit;
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure eCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    produtos: TArrayOfWebProdutos;
    procedure MontarDados(produtos: TArrayOfWebProdutos);
    procedure VerificarDados;
  public
    { Public declarations }
  end;

var
  FrProdutos: TFrProdutos;

implementation

{$R *.dfm}

procedure TFrProdutos.btCancelarClick(Sender: TObject);
begin
  inherited;
  eCodigo.Clear;
  eNome.Clear;
  ePrecoVenda.Clear;

  eCodigo.Enabled := True;
  eNome.Enabled := False;
  ePrecoVenda.Enabled := False;

  eCodigo.SetFocus;
end;

procedure TFrProdutos.btExcluirClick(Sender: TObject);
var
  con: TSqlConnection;
begin
  inherited;
  if eCodigo.Text = '' then
    Abort;

  if MessageDlg('Deseja remover o produto selecionado?', mtconfirmation, mbokcancel, 0) = 1 then begin
    con := _DB.Conexao;

    try
      _Produto.ExcluirProduto(con, StrToInt(eCodigo.Text));
      Application.MessageBox('Registro excluido com sucesso!', 'Atenção', 0);
      btCancelarClick(Self);
    except on e: Exception do
      ShowMessage(e.Message);
    End;
  end;
end;

procedure TFrProdutos.btGravarClick(Sender: TObject);
var
  con: TSqlConnection;
  produto: WebProdutos;
begin
  inherited;
  VerificarDados;
  
  con := _DB.Conexao;

  if eCodigo.Text = '' then
    produto.produto_id := 0
  else
    produto.produto_id := StrToInt(eCodigo.Text);

  produto.nome := eNome.Text;
  produto.preco_venda := StrToCurr(ePrecoVenda.Text);

  try
    _Produto.AtualizarProduto(con, produto);
    Application.MessageBox(Pchar('Produto atualizado com sucesso!'), 'Atenção', 0);
    btCancelarClick(Self);
  except on e: Exception do
    ShowMessage(e.Message);
  end;
end;

procedure TFrProdutos.btPesquisarClick(Sender: TObject);
var
  frmPesquisa: TFrPesquisarProdutos;
begin
  inherited;
  frmPesquisa := TFrPesquisarProdutos.Create(Self);
  frmPesquisa.ShowModal;

  produtos := nil;

  if frmPesquisa.produto.produto_id > 0 then begin
    SetLength(produtos, 1);
    produtos[0].produto_id := frmPesquisa.produto.produto_id;
    produtos[0].nome := frmPesquisa.produto.nome;
    produtos[0].preco_venda := frmPesquisa.produto.preco_venda;
  end;

  FreeAndNil(frmPesquisa);

  if produtos <> nil then
    MontarDados(produtos);
end;

procedure TFrProdutos.eCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  con: TSqlConnection;
begin
  inherited;
  if Key <> VK_RETURN then
    Exit;

  produtos := nil;
  if eCodigo.Text <> '' then begin
    con := _DB.Conexao;
    produtos := _Produto.BuscarProdutos(con, 'and PRODUTO_ID = ' + eCodigo.Text);

    if produtos = nil then begin
      Application.MessageBox('Produto não encontrado!!', 'Atenção', 0);
      Abort;
    end;
  end;

  MontarDados(produtos);
end;

procedure TFrProdutos.MontarDados(produtos: TArrayOfWebProdutos);
var
  i: Integer;
begin
  if not eNome.Enabled then
    eNome.Enabled := True;

  if not ePrecoVenda.Enabled then
    ePrecoVenda.Enabled := True;

  for i := Low(produtos) to High(produtos) do begin
    eCodigo.Text := IntToStr(produtos[i].produto_id);
    eNome.Text := produtos[i].nome;
    ePrecoVenda.Text := CurrToStr(produtos[i].preco_venda);
  end;

  eNome.SetFocus;
  eCodigo.Enabled := False;
end;

procedure TFrProdutos.VerificarDados;
begin
  if ePrecoVenda.Text = '' then begin
    Application.MessageBox('Preço de venda não informado!', 'Atenção', 0);
    ePrecoVenda.SetFocus;
    Abort;
  end;
end;

end.
