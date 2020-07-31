﻿unit PesquisarNegociacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, SqlExPr, Types, _DB, _Negociacao,
  CrudPesquisar;

type
  TFrPesquisarNegociacoes = class(TFrCrudPesquisar)
    procedure eChaveKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sgPesquisaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgPesquisaEnter(Sender: TObject);
  private
    procedure BuscarNegociacao;
    procedure PreencherGrid;
  public
    negociacao: WebNegociacao;
    negociacaoes: TArrayOfWebNegociacao;
  end;

const
  //sgPesquisa
  cNegociacao_Id  = 0;
  cProdutor       = 1;
  cDistribuidor   = 2;

var
  FrPesquisarNegociacoes: TFrPesquisarNegociacoes;

implementation

{$R *.dfm}

procedure TFrPesquisarNegociacoes.PreencherGrid;
var
  i: Integer;
  linha: Integer;
begin
  linha := sgPesquisa.FixedRows;
  sgPesquisa.RowCount := sgPesquisa.FixedRows + 1;

  for i := Low(negociacaoes) to High(negociacaoes) do begin
    sgPesquisa.Cells[cNegociacao_Id, linha] := IntToStr(negociacaoes[i].negociacao_id);
    sgPesquisa.Cells[cProdutor, linha] :=
      IntToStr(negociacaoes[i].produtor_id) + '-' +
      negociacaoes[i].nome_produtor;
    sgPesquisa.Cells[cDistribuidor, linha] :=
      IntToStr(negociacaoes[i].distribuidor_id) + '-' +
      negociacaoes[i].nome_distribuidor;

    linha := linha + 1;
  end;

  sgPesquisa.RowCount := linha;
  sgPesquisa.SetFocus;
end;

procedure TFrPesquisarNegociacoes.BuscarNegociacao;
var
  comando: string;
begin
  if eChave.Text = '' then
    comando := ''
  else
    comando := 'and NEGOCIACAO_ID = ' + eChave.Text;

  negociacaoes := _Negociacao.BuscarNegociacoes(Conexao, comando);
  if negociacaoes = nil then begin
    Application.MessageBox('Nenhum dado encontrado!', 'Atenção!', 0);
    Abort;
  end;

  PreencherGrid;
end;

procedure TFrPesquisarNegociacoes.eChaveKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    BuscarNegociacao;
end;

procedure TFrPesquisarNegociacoes.FormShow(Sender: TObject);
begin
  cbFiltros.Items.Clear;
  cbFiltros.Items.Add('Código');
  cbFiltros.ItemIndex := 0;

  sgPesquisa.Cells[cNegociacao_Id, sgPesquisa.FixedRows -1] := 'Negociação';
  sgPesquisa.Cells[cProdutor, sgPesquisa.FixedRows -1] := 'Produtor';
  sgPesquisa.Cells[cDistribuidor, sgPesquisa.FixedRows -1] := 'Distribuidor';

  eChave.SetFocus;
end;

procedure TFrPesquisarNegociacoes.sgPesquisaDblClick(Sender: TObject);
var
  i: Integer;
begin
  for i := Low(negociacaoes) to High(negociacaoes) do begin
    if negociacaoes[i].negociacao_id = StrToInt(sgPesquisa.Cells[cNegociacao_Id, sgPesquisa.Row]) then
      negociacao := negociacaoes[i];
  end;

  Close;
end;

procedure TFrPesquisarNegociacoes.sgPesquisaEnter(Sender: TObject);
begin
  BuscarNegociacao;
end;

procedure TFrPesquisarNegociacoes.sgPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    sgPesquisaDblClick(Sender);
end;

end.
