unit PesquisarProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, SqlExPr, Types, _DB, _Produto;

type
  TFrPesquisarProdutos = class(TForm)
    pnFiltros: TPanel;
    lbChave: TLabel;
    lbFiltros: TLabel;
    cbFiltros: TComboBox;
    eChave: TEdit;
    sgPesquisa: TStringGrid;
    procedure eChaveKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sgPesquisaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgPesquisaEnter(Sender: TObject);
  private
    procedure BuscarProdutos;
    procedure PreencherGrid;
  public
    produto: WebProdutos;
    produtos: TArrayOfWebProdutos;
  end;

const
  //sgPesquisa
  cCodigo       = 0;
  cNome         = 1;
  cPreco_Venda  = 2;

var
  FrPesquisarProdutos: TFrPesquisarProdutos;

implementation

uses
  Produtos;

{$R *.dfm}

procedure TFrPesquisarProdutos.PreencherGrid;
var
  i: Integer;
  linha: Integer;
begin
  linha := sgPesquisa.FixedRows;
  sgPesquisa.RowCount := sgPesquisa.FixedRows + 1;

  for i := Low(produtos) to High(produtos) do begin
    sgPesquisa.Cells[cCodigo, linha] := IntToStr(produtos[i].produto_id);
    sgPesquisa.Cells[cNome, linha] := produtos[i].nome;
    sgPesquisa.Cells[cPreco_Venda, linha] := CurrToStr(produtos[i].preco_venda);

    linha := linha + 1;
  end;

  sgPesquisa.RowCount := linha;
  sgPesquisa.SetFocus;
end;

procedure TFrPesquisarProdutos.BuscarProdutos;
var
  con: TSqlConnection;
  comando: string;
begin
  con := _DB.Conexao;
  if cbFiltros.ItemIndex = 0 then
    comando := 'and PRODUTO_ID = ' + eChave.Text
  else
    comando := 'and NOME like ' + QuotedStr('%' + eChave.Text + '%');

  produtos := _Produto.BuscarProdutos(con, comando);

  if produtos = nil then begin
    Application.MessageBox('Nenhum dado encontrado!', 'Atenção!', 0);
    Abort;
  end;

  PreencherGrid;
end;

procedure TFrPesquisarProdutos.eChaveKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    BuscarProdutos;
end;

procedure TFrPesquisarProdutos.FormShow(Sender: TObject);
begin
  cbFiltros.Items.Clear;
  cbFiltros.Items.Add('Código');
  cbFiltros.Items.Add('Nome');
  cbFiltros.ItemIndex := 1;

  sgPesquisa.Cells[cCodigo, sgPesquisa.FixedRows -1] := 'Código';
  sgPesquisa.Cells[cNome, sgPesquisa.FixedRows -1] := 'Nome';
  sgPesquisa.Cells[cPreco_Venda, sgPesquisa.FixedRows -1] := 'Preço de venda';

  eChave.SetFocus;
end;

procedure TFrPesquisarProdutos.sgPesquisaDblClick(Sender: TObject);
var
  i: Integer;
begin
  for i := Low(produtos) to High(produtos) do begin
    if produtos[i].produto_id = StrToInt(sgPesquisa.Cells[cCodigo, sgPesquisa.Row]) then begin
      produto.produto_id := produtos[i].produto_id;
      produto.nome := produtos[i].nome;
      produto.preco_venda := produtos[i].preco_venda;
    end;
  end;

  Close;
end;

procedure TFrPesquisarProdutos.sgPesquisaEnter(Sender: TObject);
begin
  BuscarProdutos;
end;

procedure TFrPesquisarProdutos.sgPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    sgPesquisaDblClick(Sender);
end;

end.
