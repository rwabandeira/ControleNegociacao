object FrPesquisarProdutores: TFrPesquisarProdutores
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Pesquisa de Produtores'
  ClientHeight = 313
  ClientWidth = 605
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnFiltros: TPanel
    Left = 0
    Top = 0
    Width = 605
    Height = 56
    Align = alTop
    TabOrder = 0
    object lbChave: TLabel
      Left = 207
      Top = 10
      Width = 91
      Height = 13
      Caption = 'Chave de pesquisa'
    end
    object lbFiltros: TLabel
      Left = 8
      Top = 10
      Width = 29
      Height = 13
      Caption = 'Filtros'
    end
    object cbFiltros: TComboBox
      Left = 8
      Top = 29
      Width = 193
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object eChave: TEdit
      Left = 207
      Top = 29
      Width = 386
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnKeyDown = eChaveKeyDown
    end
  end
  object sgPesquisa: TStringGrid
    Left = 0
    Top = 56
    Width = 605
    Height = 257
    Align = alClient
    ColCount = 2
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRowSelect]
    TabOrder = 1
    OnDblClick = sgPesquisaDblClick
    OnEnter = sgPesquisaEnter
    OnKeyDown = sgPesquisaKeyDown
    ColWidths = (
      188
      397)
    RowHeights = (
      19
      19)
  end
end
