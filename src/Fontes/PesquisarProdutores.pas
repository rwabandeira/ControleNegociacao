﻿unit PesquisarProdutores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, SqlExPr, Types, _DB, _Produtor,
  CrudPesquisar;

type
  TFrPesquisarProdutores = class(TFrCrudPesquisar)
    procedure eChaveKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sgPesquisaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgPesquisaEnter(Sender: TObject);
  private
    procedure BuscarProdutor;
    procedure PreencherGrid;
  public
    produtor: WebProdutor;
    produtores: TArrayOfWebProdutor;
  end;

const
  //sgPesquisa
  cCodigo = 0;
  cNome   = 1;

var
  FrPesquisarProdutores: TFrPesquisarProdutores;

implementation

{$R *.dfm}

procedure TFrPesquisarProdutores.PreencherGrid;
var
  i: Integer;
  linha: Integer;
begin
  linha := sgPesquisa.FixedRows;
  sgPesquisa.RowCount := sgPesquisa.FixedRows + 1;

  for i := Low(produtores) to High(produtores) do begin
    sgPesquisa.Cells[cCodigo, linha] := IntToStr(produtores[i].produtor_id);
    sgPesquisa.Cells[cNome, linha] := produtores[i].nome;

    linha := linha + 1;
  end;

  sgPesquisa.RowCount := linha;
  sgPesquisa.SetFocus;
end;

procedure TFrPesquisarProdutores.BuscarProdutor;
var
  comando: string;
begin
  if cbFiltros.ItemIndex = 0 then
    comando := 'and PRODUTOR_ID = ' + eChave.Text
  else
    comando := 'and NOME like ' + QuotedStr('%' + eChave.Text + '%');

  produtores := _Produtor.BuscarProdutores(Conexao, comando);

  if produtores = nil then begin
    Application.MessageBox('Nenhum dado encontrado!', 'Atenção!', 0);
    Abort;
  end;

  PreencherGrid;
end;

procedure TFrPesquisarProdutores.eChaveKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    BuscarProdutor;
end;

procedure TFrPesquisarProdutores.FormShow(Sender: TObject);
begin
  cbFiltros.Items.Clear;
  cbFiltros.Items.Add('Código');
  cbFiltros.Items.Add('Nome');
  cbFiltros.ItemIndex := 1;

  sgPesquisa.Cells[cCodigo, sgPesquisa.FixedRows -1] := 'Código';
  sgPesquisa.Cells[cNome, sgPesquisa.FixedRows -1] := 'Nome';

  eChave.SetFocus;
end;

procedure TFrPesquisarProdutores.sgPesquisaDblClick(Sender: TObject);
var
  i: Integer;
begin
  for i := Low(produtores) to High(produtores) do begin
    if produtores[i].produtor_id = StrToInt(sgPesquisa.Cells[cCodigo, sgPesquisa.Row]) then begin
      produtor.produtor_id := produtores[i].produtor_id;
      produtor.nome := produtores[i].nome;
      produtor.inscricao := produtores[i].inscricao;
      produtor.cpf_cnpj := produtores[i].cpf_cnpj;
    end;
  end;

  Close;
end;

procedure TFrPesquisarProdutores.sgPesquisaEnter(Sender: TObject);
begin
  BuscarProdutor;
end;

procedure TFrPesquisarProdutores.sgPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    sgPesquisaDblClick(Sender);
end;

end.
