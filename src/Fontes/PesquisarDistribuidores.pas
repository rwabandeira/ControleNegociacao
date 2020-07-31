unit PesquisarDistribuidores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, SqlExPr, Types, _DB, _Distribuidor,
  _Biblioteca, CrudPesquisar;

type
  TFrPesquisarDistribuidores = class(TFrCrudPesquisar)
    procedure eChaveKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sgPesquisaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgPesquisaEnter(Sender: TObject);
    procedure sgPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
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

{$R *.dfm}

procedure TFrPesquisarDistribuidores.PreencherGrid;
var
  i: Integer;
  linha: Integer;
begin
  linha := sgPesquisa.FixedRows;
  sgPesquisa.RowCount := sgPesquisa.FixedRows + 1;

  for i := Low(distribuidores) to High(distribuidores) do begin
    sgPesquisa.Cells[cCodigo, linha] := IntToStr(distribuidores[i].distribuidor_id);
    sgPesquisa.Cells[cNome, linha] := distribuidores[i].nome;

    linha := linha + 1;
  end;

  sgPesquisa.RowCount := linha;
  sgPesquisa.SetFocus;
end;

procedure TFrPesquisarDistribuidores.BuscarDistribuidor;
var
  comando: string;
begin
  if cbFiltros.ItemIndex = 0 then
    comando := 'and DISTRIBUIDOR_ID = ' + eChave.Text
  else if cbFiltros.ItemIndex = 1 then
    comando := 'and NOME like ' + QuotedStr('%' + eChave.Text + '%')
  else begin
    eChave.Text := _Biblioteca.FormatarCPFCNPJ(eChave.Text);
    comando := 'and CPF_CNPJ = ' + QuotedStr(eChave.Text);
  end;

  distribuidores := _Distribuidor.BuscarDistribuidores(Conexao, comando);

  if distribuidores = nil then begin
    Application.MessageBox('Nenhum dado encontrado!', 'Aten��o!', 0);
    Abort;
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
  cbFiltros.Items.Add('C�digo');
  cbFiltros.Items.Add('Nome');
  cbFiltros.Items.Add('Cpf/Cnpj(somente nmeros)');
  cbFiltros.ItemIndex := 1;

  sgPesquisa.Cells[cCodigo, sgPesquisa.FixedRows -1] := 'C�digo';
  sgPesquisa.Cells[cNome, sgPesquisa.FixedRows -1] := 'Nome';

  eChave.SetFocus;
end;

procedure TFrPesquisarDistribuidores.sgPesquisaDblClick(Sender: TObject);
var
  i: Integer;
begin
  for i := Low(distribuidores) to High(distribuidores) do begin
    if distribuidores[i].distribuidor_id <> StrToInt(sgPesquisa.Cells[cCodigo, sgPesquisa.Row]) then
      Continue;

    distribuidor.distribuidor_id := distribuidores[i].distribuidor_id;
    distribuidor.nome := distribuidores[i].nome;
    distribuidor.inscricao := distribuidores[i].inscricao;
    distribuidor.cpf_cnpj := distribuidores[i].cpf_cnpj;

    Break;
  end;

  Close;
end;

procedure TFrPesquisarDistribuidores.sgPesquisaEnter(Sender: TObject);
begin
  BuscarDistribuidor;
end;

procedure TFrPesquisarDistribuidores.sgPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    sgPesquisaDblClick(Sender);
end;

end.
