inherited FrPesquisarDistribuidores: TFrPesquisarDistribuidores
  Caption = 'Pesquisa de Distribuidores'
  OnShow = FormShow
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
