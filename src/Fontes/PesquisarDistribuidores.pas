unit PesquisarDistribuidores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, SqlExPr, Types, _DB, _Distribuidor;

type
  TDados = record
    codigo: Integer;
    nome: string;
  end;
  TArrayOfDados = array of TDados;

  TFrPesquisarDistribuidores = class(TForm)
    pnFiltros: TPanel;
    lbChave: TLabel;
    lbFiltros: TLabel;
    cbFiltros: TComboBox;
    eChave: TEdit;
    sgPesquisa: TStringGrid;
    procedure eChaveKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sgPesquisaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    dados:TArrayOfDados;
    procedure BuscarDistribuidor;
    procedure PreencherGrid;
  public
    distribuidor: WebDistribuidor;
    distribuidores: TArrayOfWebDistribuidor;
  end;

const
  //sgPesquisa
  cCodigo = 0;
  cNome   = 1;

var
  FrPesquisarDistribuidores: TFrPesquisarDistribuidores;

implementation

uses
  Distribuidores;

{$R *.dfm}

procedure TFrPesquisarDistribuidores.PreencherGrid;
var
  i: Integer;
  linha: Integer;
begin
  linha := sgPesquisa.FixedRows;
  sgPesquisa.RowCount := sgPesquisa.FixedRows + 1;

  for i := Low(dados) to High(dados) do begin
    sgPesquisa.Cells[cCodigo, linha] := IntToStr(dados[i].codigo);
    sgPesquisa.Cells[cNome, linha] := dados[i].nome;

    linha := linha + 1;
  end;

  sgPesquisa.RowCount := linha;
end;

procedure TFrPesquisarDistribuidores.BuscarDistribuidor;
var
  i: Integer;
  con: TSqlConnection;
  comando: string;
begin
  con := _DB.Conexao;
  if cbFiltros.ItemIndex = 0 then
    comando := 'and PRODUTOR_ID = ' + eChave.Text
  else
    comando := 'and NOME like ' + QuotedStr('%' + eChave.Text + '%');

  distribuidores := _Distribuidor.BuscarDistribuidores(con, comando);

  if distribuidores = nil then begin
    Application.MessageBox('Nenhum dado encontrado!', 'Atenção!', 0);
    Abort;
  end;

  dados := nil;
  for i := Low(distribuidores) to High(distribuidores) do begin
    SetLength(dados, Length(dados) + 1);
    dados[High(dados)].codigo := distribuidores[i].distribuidor_id;
    dados[High(dados)].nome := distribuidores[i].nome;
  end;

  PreencherGrid;
end;

procedure TFrPesquisarDistribuidores.eChaveKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    BuscarDistribuidor;
end;

procedure TFrPesquisarDistribuidores.FormShow(Sender: TObject);
begin
  cbFiltros.Items.Clear;
  cbFiltros.Items.Add('Código');
  cbFiltros.Items.Add('Nome');
  cbFiltros.ItemIndex := 1;

  sgPesquisa.Cells[cCodigo, sgPesquisa.FixedRows -1] := 'Código';
  sgPesquisa.Cells[cNome, sgPesquisa.FixedRows -1] := 'Nome';

  eChave.SetFocus;
end;

procedure TFrPesquisarDistribuidores.sgPesquisaDblClick(Sender: TObject);
var
  i: Integer;
begin
  for i := Low(distribuidores) to High(distribuidores) do begin
    if distribuidores[i].distribuidor_id = StrToInt(sgPesquisa.Cells[cCodigo, sgPesquisa.Row]) then begin
      distribuidor.distribuidor_id := distribuidores[i].distribuidor_id;
      distribuidor.nome := distribuidores[i].nome;
      distribuidor.inscricao := distribuidores[i].inscricao;
      distribuidor.cpf_cnpj := distribuidores[i].cpf_cnpj;
    end;
  end;

  Close;
end;

end.
