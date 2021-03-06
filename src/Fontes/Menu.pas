unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Produtores, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Distribuidores, Produtos, Negociacoes, ManutencaoNegociacoes,
  RelacaoNegociacoes, _DB;

type
  TFrMenu = class(TForm)
    mmMenu: TMainMenu;
    miCadastros: TMenuItem;
    miProdutores: TMenuItem;
    miDistribuidores: TMenuItem;
    miVendas: TMenuItem;
    sqlConect: TSQLConnection;
    miProdutos: TMenuItem;
    miNegociacoes: TMenuItem;
    miManutencaoNegociacao: TMenuItem;
    miRelatorios: TMenuItem;
    miRelVendas: TMenuItem;
    miRelNegociacoes: TMenuItem;
    miSair: TMenuItem;
    procedure miProdutoresClick(Sender: TObject);
    procedure miDistribuidoresClick(Sender: TObject);
    procedure miProdutosClick(Sender: TObject);
    procedure miNegociacoesClick(Sender: TObject);
    procedure miManutencaoNegociacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miRelNegociacoesClick(Sender: TObject);
    procedure miSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrMenu: TFrMenu;

implementation

{$R *.dfm}

procedure TFrMenu.FormCreate(Sender: TObject);
begin
  Conexao.Create(Application);
end;

procedure TFrMenu.miDistribuidoresClick(Sender: TObject);
var
  frmDistribuidores: TfrDistribuidores;
begin
  frmDistribuidores := TfrDistribuidores.Create(Application);
  frmDistribuidores.Show;
end;

procedure TFrMenu.miManutencaoNegociacaoClick(Sender: TObject);
var
  frmManutencaoNegociacoes: TfrManutencaoNegociacoes;
begin
  frmManutencaoNegociacoes := TfrManutencaoNegociacoes.Create(Application);
  frmManutencaoNegociacoes.Show;
end;

procedure TFrMenu.miNegociacoesClick(Sender: TObject);
var
  frmNegociacoes: TfrNegociacoes;
begin
  frmNegociacoes := TfrNegociacoes.Create(Application);
  frmNegociacoes.Show;
end;

procedure TFrMenu.miProdutoresClick(Sender: TObject);
var
  frmProdutores: TfrProdutores;
begin
  frmProdutores := TfrProdutores.Create(Application);
  frmProdutores.Show;
end;

procedure TFrMenu.miProdutosClick(Sender: TObject);
var
  frmProdutos: TfrProdutos;
begin
  frmProdutos := TfrProdutos.Create(Application);
  frmProdutos.Show;
end;

procedure TFrMenu.miRelNegociacoesClick(Sender: TObject);
var
  frmRelNegociacoes: TfrRelNegociacoes;
begin
  frmRelNegociacoes := TfrRelNegociacoes.Create(Application);
  frmRelNegociacoes.Show;
end;

procedure TFrMenu.miSairClick(Sender: TObject);
begin
  Application.Terminate();
end;

end.
