inherited FrPesquisarProdutores: TFrPesquisarProdutores
  Caption = 'Pesquisa de Produtores'
  Visible = False
  OnShow = FormShow
  ExplicitWidth = 611
  ExplicitHeight = 342
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnFiltros: TPanel
    inherited eChave: TEdit
      OnKeyDown = eChaveKeyDown
    end
  end
  inherited sgPesquisa: TStringGrid
    OnDblClick = sgPesquisaDblClick
    OnEnter = sgPesquisaEnter
    OnKeyDown = sgPesquisaKeyDown
  end
end
