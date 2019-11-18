program ControleNegociacao;

uses
  Forms,
  Menu in 'Fontes\Menu.pas' {FrMenu},
  _DB in 'DB\_DB.pas',
  CrudCadastro in 'Fontes\CrudCadastro.pas' {FrCrudCadastro},
  Produtores in 'Fontes\Produtores.pas' {FrProdutores},
  _Produtor in 'Bancos\_Produtor.pas',
  PesquisarProdutores in 'Fontes\PesquisarProdutores.pas' {FrPesquisarProdutores},
  _Biblioteca in '_Biblioteca.pas',
  Distribuidores in 'Fontes\Distribuidores.pas' {FrDistribuidores},
  PesquisarDistribuidores in 'Fontes\PesquisarDistribuidores.pas' {FrPesquisarDistribuidores},
  _Distribuidor in 'Bancos\_Distribuidor.pas',
  _LimiteCredito in 'Bancos\_LimiteCredito.pas',
  LimiteCreditos in 'Fontes\LimiteCreditos.pas' {FrLimiteCreditos},
  Produtos in 'Fontes\Produtos.pas' {FrProdutos},
  _Produto in 'Bancos\_Produto.pas',
  PesquisarProdutos in 'Fontes\PesquisarProdutos.pas' {FrPesquisarProdutos},
  Negociacoes in 'Fontes\Negociacoes.pas' {frNegociacoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrMenu, FrMenu);
  Application.CreateForm(TFrCrudCadastro, FrCrudCadastro);
  Application.CreateForm(TFrProdutores, FrProdutores);
  Application.CreateForm(TFrPesquisarProdutores, FrPesquisarProdutores);
  Application.CreateForm(TFrDistribuidores, FrDistribuidores);
  Application.CreateForm(TFrPesquisarDistribuidores, FrPesquisarDistribuidores);
  Application.CreateForm(TFrProdutos, FrProdutos);
  Application.CreateForm(TFrPesquisarProdutos, FrPesquisarProdutos);
  Application.CreateForm(TfrNegociacoes, frNegociacoes);
  Application.Run;
end.