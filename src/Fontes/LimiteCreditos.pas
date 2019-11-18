unit LimiteCreditos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, _LimiteCredito,
  PesquisarDistribuidores, Vcl.ExtCtrls, Distribuidores, _Distribuidor, _DB,
  SqlExPr;

type
  TFrLimiteCreditos = class(TForm)
    lbLimiteCredito: TLabel;
    eDistribuidorId: TEdit;
    eLimiteCredito: TEdit;
    lbDistribuidorId: TLabel;
    lbNome: TLabel;
    eNome: TEdit;
    btPesquisar: TButton;
    sgLimiteCredito: TStringGrid;
    pnBotoes: TPanel;
    Button1: TButton;
    btOk: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure sgLimiteCreditoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eDistribuidorIdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btPesquisarClick(Sender: TObject);
    procedure eLimiteCreditoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure eDistribuidorIdChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    limite_creditos: TArrayOfWebLimiteCreditos;
    _cancelou: Boolean;
  end;

const
  //sgLimiteCredito
  cDistribuidor_Id  = 0;
  cNome             = 1;
  cLimite_Credito   = 2;
  //sgLimiteCredito(ocultas)

var
  FrLimiteCredito: TFrLimiteCreditos;

implementation

{$R *.dfm}

procedure TFrLimiteCreditos.btOkClick(Sender: TObject);
var
  i: Integer;
begin
  for i := sgLimiteCredito.FixedRows to sgLimiteCredito.RowCount -1 do  begin
    if sgLimiteCredito.Cells[cDistribuidor_Id, i] = '' then
      Break;

    SetLength(limite_creditos, Length(limite_creditos) + 1);
    limite_creditos[High(limite_creditos)].distribuidor_id := StrToInt(sgLimiteCredito.Cells[cDistribuidor_Id, i]);
    limite_creditos[High(limite_creditos)].nome_distribuidor := sgLimiteCredito.Cells[cNome, i];
    limite_creditos[High(limite_creditos)].limite_credito := StrToInt(sgLimiteCredito.Cells[cLimite_Credito, i]);
  end;

  Close;
end;

procedure TFrLimiteCreditos.btPesquisarClick(Sender: TObject);
var
  frmPesquisa: TFrPesquisarDistribuidores;
begin
  frmPesquisa := TFrPesquisarDistribuidores.Create(Self);
  frmPesquisa.ShowModal;

  if frmPesquisa.distribuidor.distribuidor_id > 0 then begin
    eDistribuidorId.Text := IntToStr(frmPesquisa.distribuidor.distribuidor_id);
    eNome.Text := frmPesquisa.distribuidor.nome;
  end;

  FreeAndNil(frmPesquisa);
  eLimiteCredito.SetFocus;
end;

procedure TFrLimiteCreditos.Button1Click(Sender: TObject);
begin
  _cancelou := True;
  Close;
end;

procedure TFrLimiteCreditos.eDistribuidorIdChange(Sender: TObject);
begin
  if eDistribuidorId.Text = '' then
    eNome.Clear;
end;

procedure TFrLimiteCreditos.eDistribuidorIdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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
      Application.MessageBox('Distribuidor n�o encontrado!!', 'Aten��o', 0);
      Abort;
    end;
  end;

  if distribuidores <> nil then begin
    eDistribuidorId.Text := IntToStr(distribuidores[0].distribuidor_id);
    eNome.Text := distribuidores[0].nome;
  end;

  eLimiteCredito.SetFocus;
end;

procedure TFrLimiteCreditos.eLimiteCreditoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
//  limite_creditos: TArrayOfWebLimiteCreditos;
  linha: Integer;
  i: Integer;
  posicao: Integer;
begin
  inherited;
  if Key <> VK_RETURN then
    Exit;

  if eDistribuidorId.Text = '' then begin
    Application.MessageBox('Distribuidor n�o informado', 'Aten��o', 0);
    eDistribuidorId.SetFocus;
    Exit;
  end;

  if eLimiteCredito.Text = '' then begin
    Application.MessageBox('Limite de cr�dito n�o informado', 'Aten��o', 0);
    eLimiteCredito.SetFocus;
    Exit;
  end;

  if sgLimiteCredito.FixedRows < sgLimiteCredito.RowCount -1 then begin
    posicao := -1;
    for i := sgLimiteCredito.FixedRows to sgLimiteCredito.RowCount -1 do  begin
      if sgLimiteCredito.Cells[cDistribuidor_Id, i] = '' then
        Break;

      if StrToInt(sgLimiteCredito.Cells[cDistribuidor_Id, i]) <> StrToInt(eDistribuidorId.Text) then
        Continue;

      posicao := i;
      Break;
    end;

    if posicao <> -1 then begin
      Application.MessageBox('Distribuidor j� inclu�do', 'Aten��o', 0);
      sgLimiteCredito.Row := posicao;
      Exit;
    end;
  end;

  linha := sgLimiteCredito.RowCount -1;
  sgLimiteCredito.Cells[cDistribuidor_Id, linha] := eDistribuidorId.Text;
  sgLimiteCredito.Cells[cNome, linha] := eNome.Text;
  sgLimiteCredito.Cells[cLimite_Credito, linha] := eLimiteCredito.Text;

  linha := linha + 1;

  sgLimiteCredito.RowCount := linha +1;

  eDistribuidorId.Clear;
  eNome.Clear;
  eLimiteCredito.Clear;

  eDistribuidorId.SetFocus
end;

procedure TFrLimiteCreditos.FormCreate(Sender: TObject);
begin
  sgLimiteCredito.Cells[cDistribuidor_Id, sgLimiteCredito.FixedRows -1] := 'C�digo';
  sgLimiteCredito.Cells[cNome, sgLimiteCredito.FixedRows -1] := 'Nome';
  sgLimiteCredito.Cells[cLimite_Credito, sgLimiteCredito.FixedRows -1] := 'Limite de cr�dito';

  _cancelou := False;
  limite_creditos := nil
end;

procedure TFrLimiteCreditos.sgLimiteCreditoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  if Key = VK_DELETE then
//    sgLimiteCredito.
end;

end.
