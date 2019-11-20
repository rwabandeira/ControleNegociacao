unit Negociacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, PesquisarProdutores,
  PesquisarDistribuidores, PesquisarProdutos, SqlExPr, _DB, _Produtor, _Distribuidor,
  _Produto, _Biblioteca, CrudCadastro, Vcl.ExtCtrls;

type
  TfrNegociacoes = class(TFrCrudCadastro)
    lbProdutorId: TLabel;
    lbDistribuidorId: TLabel;
    lbProduto: TLabel;
    lbQuantidade: TLabel;
    lbPrecoVenda: TLabel;
    lbTotal: TLabel;
    lbDataCadastro: TLabel;
    lbTotalGeral: TLabel;
    eProdutorId: TEdit;
    eNomeProdutor: TEdit;
    eDistribuidorId: TEdit;
    eNomeDistribuidor: TEdit;
    btPesqProdutor: TButton;
    btPesqDistribuidor: TButton;
    stItens: TStaticText;
    sgItens: TStringGrid;
    eProdutoId: TEdit;
    eNomeProduto: TEdit;
    ePrecoVenda: TEdit;
    eQuantidade: TEdit;
    eTotal: TEdit;
    btPesqProduto: TButton;
    eDataCadastro: TEdit;
    eTotalGeral: TEdit;
    procedure btPesqProdutorClick(Sender: TObject);
    procedure btPesqDistribuidorClick(Sender: TObject);
    procedure btPesqProdutoClick(Sender: TObject);
    procedure eProdutorIdChange(Sender: TObject);
    procedure eDistribuidorIdChange(Sender: TObject);
    procedure eProdutoIdChange(Sender: TObject);
    procedure eProdutorIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eDistribuidorIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eProdutoIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eQuantidadeChange(Sender: TObject);
  private
    { Private declarations }
    total_geral: Double;
  public
    { Public declarations }
  end;

const
  //sgItens
  cProduto_Id   = 0;
  cNome         = 1;
  cPreco_Venda  = 2;
  cQuantidade   = 3;
  cTotal        = 4;

var
  FrNegociacoes: TFrNegociacoes;

implementation

{$R *.dfm}

procedure TFrNegociacoes.btPesqDistribuidorClick(Sender: TObject);
var
  frmPesquisa: TFrPesquisarDistribuidores;
begin
  frmPesquisa := TFrPesquisarDistribuidores.Create(Self);
  frmPesquisa.ShowModal;

  if frmPesquisa.distribuidor.distribuidor_id > 0 then begin
    eProdutorId.Text := IntToStr(frmPesquisa.distribuidor.distribuidor_id);
    eNomeProdutor.Text := frmPesquisa.distribuidor.nome;
  end;

  FreeAndNil(frmPesquisa);
  eProdutoId.SetFocus;
end;

procedure TFrNegociacoes.btPesqProdutoClick(Sender: TObject);
var
  frmPesquisa: TFrPesquisarProdutos;
begin
  frmPesquisa := TFrPesquisarProdutos.Create(Self);
  frmPesquisa.ShowModal;

  if frmPesquisa.produto.produto_id > 0 then begin
    eProdutorId.Text := IntToStr(frmPesquisa.produto.produto_id);
    eNomeProdutor.Text := frmPesquisa.produto.nome;
    ePrecoVenda.Text := CurrToStr(frmPesquisa.produto.preco_venda);
  end;

  FreeAndNil(frmPesquisa);
  eQuantidade.SetFocus;
end;

procedure TFrNegociacoes.btPesqProdutorClick(Sender: TObject);
var
  frmPesquisa: TFrPesquisarProdutores;
begin
  frmPesquisa := TFrPesquisarProdutores.Create(Self);
  frmPesquisa.ShowModal;

  if frmPesquisa.produtor.produtor_id > 0 then begin
    eProdutorId.Text := IntToStr(frmPesquisa.produtor.produtor_id);
    eNomeProdutor.Text := frmPesquisa.produtor.nome;
  end;

  FreeAndNil(frmPesquisa);
  eDistribuidorId.SetFocus;
end;

procedure TFrNegociacoes.eDistribuidorIdChange(Sender: TObject);
begin
  if eDistribuidorId.Text = '' then
    eNomeDistribuidor.Clear;
end;

procedure TFrNegociacoes.eDistribuidorIdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  con: TSqlConnection;
  distribuidores: TArrayOfWebDistribuidor;
begin
  if Key <> VK_RETURN then
    Exit;

  distribuidores := nil;
  if eDistribuidorId.Text <> '' then begin
    con := _DB.Conexao;
    distribuidores := _Distribuidor.BuscarDistribuidores(con, 'and DISTRIBUIDOR_ID = ' + eDistribuidorId.Text);

    if distribuidores = nil then begin
      Application.MessageBox('Distribuidor não encontrado!!', 'Atenção', 0);
      Abort;
    end;
  end;

  if distribuidores <> nil then begin
    eDistribuidorId.Text := IntToStr(distribuidores[0].distribuidor_id);
    eNomeDistribuidor.Text := distribuidores[0].nome;
  end;

  if (eProdutorId.Text <> '') and (eDistribuidorId.Text <> '') then begin
    eDataCadastro.Text := DateToStr(Trunc(Now));
    eProdutorId.Enabled := False;
    btPesqProdutor.Enabled := False;
    eDistribuidorId.Enabled := False;
    btPesqDistribuidor.Enabled := False;

    eProdutoId.Enabled := True;
    eQuantidade.Enabled := True;
    sgItens.Enabled := True;

    eProdutoId.SetFocus;
  end;
end;

procedure TFrNegociacoes.eProdutoIdChange(Sender: TObject);
begin
  if eProdutoId.Text = '' then
    eNomeProduto.Clear;
end;

procedure TFrNegociacoes.eProdutoIdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  con: TSqlConnection;
  produtos: TArrayOfWebProdutos;
begin
  if Key <> VK_RETURN then
    Exit;

  produtos := nil;
  if eProdutoId.Text <> '' then begin
    con := _DB.Conexao;
    produtos := _Produto.BuscarProdutos(con, 'and PRODUTO_ID = ' + eProdutoId.Text);

    if produtos = nil then begin
      Application.MessageBox('Produto não encontrado!!', 'Atenção', 0);
      Abort;
    end;
  end;

  if produtos <> nil then begin
    eProdutoId.Text := IntToStr(produtos[0].produto_id);
    eNomeProduto.Text := produtos[0].nome;
    ePrecoVenda.Text := CurrToStr(produtos[0].preco_venda);
  end;

  eQuantidade.SetFocus;
end;

procedure TFrNegociacoes.eProdutorIdChange(Sender: TObject);
begin
  if eProdutorId.Text = '' then
    eNomeProdutor.Clear;
end;

procedure TFrNegociacoes.eProdutorIdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  con: TSqlConnection;
  produtores: TArrayOfWebProdutor;
begin
  if Key <> VK_RETURN then
    Exit;

  produtores := nil;
  if eProdutorId.Text <> '' then begin
    con := _DB.Conexao;
    produtores := _Produtor.BuscarProdutores(con, 'and PRODUTOR_ID = ' + eProdutorId.Text);

    if produtores = nil then begin
      Application.MessageBox('Produtor não encontrado!!', 'Atenção', 0);
      Abort;
    end;
  end;

  if produtores <> nil then begin
    eProdutorId.Text := IntToStr(produtores[0].produtor_id);
    eNomeProdutor.Text := produtores[0].nome;
  end;

  eDistribuidorId.SetFocus;
end;

procedure TFrNegociacoes.eQuantidadeChange(Sender: TObject);
var
  preco_venda: Double;
  quantidade: Double;
begin
  preco_venda := StrToFloat(ePrecoVenda.Text);
  quantidade := StrToFloat(eQuantidade.Text);
  eTotal.Text := FloatToStr(preco_venda * quantidade);
end;

procedure TFrNegociacoes.eQuantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  preco_venda: Double;
  quantidade: Double;
  linha: Integer;
begin
  if Key <> VK_RETURN then
    Exit;

  linha := sgItens.RowCount -1;
  sgItens.Cells[cProduto_Id, linha] := eProdutoId.Text;
  sgItens.Cells[cNome, linha] := eNomeProduto.Text;
  sgItens.Cells[cPreco_Venda, linha] := ePrecoVenda.Text;
  sgItens.Cells[cQuantidade, linha] := eQuantidade.Text;
  sgItens.Cells[cTotal, linha] := eTotal.Text;

  sgItens.RowCount := IIf(linha <> sgItens.RowCount -1, linha, sgItens.RowCount);

  preco_venda := StrToFloat(ePrecoVenda.Text);
  quantidade := StrToFloat(eQuantidade.Text);
  total_geral := total_geral + (preco_venda * quantidade);

  eProdutoId.Clear;
  eNomeProduto.Clear;
  ePrecoVenda.Clear;
  eQuantidade.Clear;
  eTotal.Clear

end;

end.
