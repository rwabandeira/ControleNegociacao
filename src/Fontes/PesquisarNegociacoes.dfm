inherited FrPesquisarNegociacoes: TFrPesquisarNegociacoes
  Caption = 'Pesquisa de Negocia'#231#245'es'
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
      72
      252
      248)
  end
end
