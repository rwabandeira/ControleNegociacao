inherited FrPesquisarProdutos: TFrPesquisarProdutos
  Caption = 'Pesquisa de Produtos'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnFiltros: TPanel
    inherited eChave: TEdit
      OnKeyDown = eChaveKeyDown
    end
  end
  inherited sgPesquisa: TStringGrid
    ColCount = 3
    OnDblClick = sgPesquisaDblClick
    OnEnter = sgPesquisaEnter
    OnKeyDown = sgPesquisaKeyDown
    ColWidths = (
      66
      368
      122)
  end
end
