unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Produtores, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Distribuidores, Produtos, Negociacoes;

type
  TFrMenu = class(TForm)
    mmMenu: TMainMenu;
    miParametros: TMenuItem;
    miProdutores: TMenuItem;
    miDistribuidores: TMenuItem;
    miNegociacao: TMenuItem;
    sqlConect: TSQLConnection;
    miProdutos: TMenuItem;
    procedure miProdutoresClick(Sender: TObject);
    procedure miDistribuidoresClick(Sender: TObject);
    procedure miProdutosClick(Sender: TObject);
    procedure miNegociacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrMenu: TFrMenu;

implementation

{$R *.dfm}

procedure TFrMenu.miDistribuidoresClick(Sender: TObject);
var
  frmDistribuidores: TfrDistribuidores;
begin
  frmDistribuidores := TfrDistribuidores.Create(Application);
  frmDistribuidores.Show;
end;

procedure TFrMenu.miNegociacaoClick(Sender: TObject);
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

end.