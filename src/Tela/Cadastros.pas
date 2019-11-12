unit Produtores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CrudCadastro, StdCtrls, Buttons, ExtCtrls, Mask, SqlExPr,
  PesquisarProdutores, _Cadastro, UITypes, _Biblioteca;

type
  TFrProdutores = class(TFrCrudCadastro)
    lbCodigo: TLabel;
    lbNome: TLabel;
    lbCpfCnpj: TLabel;
    lbTipo: TLabel;
    eCodigo: TEdit;
    eNome: TEdit;
    meCpfCnpj: TMaskEdit;
    cbTipo: TComboBox;
    rgInscricao: TRadioGroup;
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure eCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgInscricaoClick(Sender: TObject);
  private
    { Private declarations }
    cadastros: TArrayOfWebCadastro;
    procedure MontarDados(cadastros: TArrayOfWebCadastro);
    procedure VerificarDados;
  public
    { Public declarations }
  end;

var
  FrProdutores: TFrProdutores;

implementation

{$R *.dfm}

uses _Conexao;

procedure TFrProdutores.btCancelarClick(Sender: TObject);
begin
  inherited;
  eCodigo.Clear;
  eNome.Clear;
  rgInscricao.ItemIndex := -1;
  lbCpfCnpj.Caption := 'CPF/CNPJ';
  meCpfCnpj.Clear;
  meCpfCnpj.EditMask := '';
  cbTipo.ItemIndex := -1;

  eCodigo.Enabled := True;
  eNome.Enabled := False;
  rgInscricao.Enabled := False;
  meCpfCnpj.Enabled := False;
  cbTipo.Enabled := False;

  eCodigo.SetFocus;
end;

procedure TFrProdutores.btExcluirClick(Sender: TObject);
var
  con: TSqlConnection;
begin
  inherited;
  if eCodigo.Text = '' then
    Abort;

  if MessageDlg('Deseja remover o cadastro selecionado?', mtconfirmation, mbokcancel, 0) = 1 then begin
    con := _Conexao.Conexao;

    try
      _Cadastro.ExcluirCadastro(con, StrToInt(eCodigo.Text));
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
  cadastro: WebCadastro;
begin
  inherited;
  VerificarDados;
  
  con := _Conexao.Conexao;

  if eCodigo.Text = '' then
    cadastro.cadastro_id := 0
  else
    cadastro.cadastro_id := StrToInt(eCodigo.Text);

  cadastro.nome := eNome.Text;

  if rgInscricao.ItemIndex = 0 then
    cadastro.inscricao := 'F'
  else
    cadastro.inscricao := 'J';

  cadastro.cpf_cnpj := meCpfCnpj.Text;

  if cbTipo.ItemIndex = 0 then
    cadastro.tipo := 'P'
  else
    cadastro.tipo := 'D';

  try
    _Cadastro.AtualizarCadastro(con, cadastro);
    Application.MessageBox(Pchar('Cadastro atualizado com sucesso!'), 'Aten��o', 0);
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
  frmPesquisa.tipo_pesquisa := 'CAD';
  frmPesquisa.ShowModal;

  cadastros := nil;

  if frmPesquisa.cadastro.cadastro_id > 0 then begin
    SetLength(cadastros, 1);
    cadastros[0].cadastro_id := frmPesquisa.cadastro.cadastro_id;
    cadastros[0].nome := frmPesquisa.cadastro.nome;
    cadastros[0].inscricao := frmPesquisa.cadastro.inscricao;
    cadastros[0].cpf_cnpj := frmPesquisa.cadastro.cpf_cnpj;
    cadastros[0].tipo := frmPesquisa.cadastro.tipo;
  end;

  FreeAndNil(frmPesquisa);

  if cadastros <> nil then
    MontarDados(cadastros);
end;

procedure TFrProdutores.eCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  con: TSqlConnection;
begin
  inherited;
  if Key = VK_RETURN then begin
    cadastros := nil;
    if eCodigo.Text <> '' then begin
      con := _Conexao.Conexao;
      cadastros := _Cadastro.BuscarProdutores(con, 'and CADASTRO_ID = ' + eCodigo.Text);

      if cadastros = nil then begin
        Application.MessageBox('Cadastro n�o encontrado!!', 'Aten��o', 0);
        Abort;
      end;
    end;

    MontarDados(cadastros);
  end;
end;

procedure TFrProdutores.MontarDados(cadastros: TArrayOfWebCadastro);
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

  if not cbTipo.Enabled then
    cbTipo.Enabled := True;

  for i := Low(cadastros) to High(cadastros) do begin
    eCodigo.Text := IntToStr(cadastros[i].cadastro_id);
    eNome.Text := cadastros[i].nome;

    if cadastros[i].inscricao = 'F' then begin
      rgInscricao.ItemIndex := 0;
      meCpfCnpj.EditMask := '000\.000\.000\-00;1;_';
    end
    else begin
      rgInscricao.ItemIndex := 1;
      meCpfCnpj.EditMask := '00\.000\.000\/0000\-00;1;_';
    end;

    meCpfCnpj.Text := cadastros[i].cpf_cnpj;

    if cadastros[i].tipo = 'P' then
      cbTipo.ItemIndex := 0
    else
      cbTipo.ItemIndex := 1;
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
    Abort;
  end;
end;

end.
