object FrNegociacoes: TFrNegociacoes
  Left = 0
  Top = 0
  ActiveControl = eProdutorId
  Caption = 'Negocia'#231#245'es'
  ClientHeight = 375
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbProdutorId: TLabel
    Left = 8
    Top = 37
    Width = 42
    Height = 13
    Caption = 'Produtor'
  end
  object Label1: TLabel
    Left = 387
    Top = 37
    Width = 54
    Height = 13
    Caption = 'Distribuidor'
  end
  object lbProduto: TLabel
    Left = 8
    Top = 105
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object lbQuantidade: TLabel
    Left = 622
    Top = 105
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object lbPrecoVenda: TLabel
    Left = 550
    Top = 105
    Width = 60
    Height = 13
    Caption = 'Pre'#231'o venda'
  end
  object lbTotal: TLabel
    Left = 694
    Top = 105
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object lbDataCadastro: TLabel
    Left = 672
    Top = 8
    Width = 83
    Height = 13
    Caption = 'Data do cadastro'
  end
  object lbTotalGeral: TLabel
    Left = 622
    Top = 331
    Width = 51
    Height = 13
    Caption = 'Total geral'
  end
  object eProdutorId: TEdit
    Left = 8
    Top = 52
    Width = 42
    Height = 21
    TabOrder = 1
    OnChange = eProdutorIdChange
    OnKeyDown = eProdutorIdKeyDown
  end
  object eNomeProdutor: TEdit
    Left = 51
    Top = 52
    Width = 249
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 2
  end
  object eDistribuidorId: TEdit
    Left = 387
    Top = 52
    Width = 42
    Height = 21
    TabOrder = 4
    OnChange = eDistribuidorIdChange
    OnKeyDown = eDistribuidorIdKeyDown
  end
  object eNomeDistribuidor: TEdit
    Left = 430
    Top = 52
    Width = 249
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 5
  end
  object btPesqProdutor: TButton
    Left = 301
    Top = 50
    Width = 80
    Height = 26
    Caption = '&Pesquisar'
    TabOrder = 3
    TabStop = False
    OnClick = btPesqProdutorClick
  end
  object btPesqDistribuidor: TButton
    Left = 680
    Top = 50
    Width = 80
    Height = 26
    Caption = '&Pesquisar'
    TabOrder = 6
    TabStop = False
    OnClick = btPesqDistribuidorClick
  end
  object stItens: TStaticText
    Left = 8
    Top = 82
    Width = 752
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Itens'
    Color = clSilver
    ParentColor = False
    TabOrder = 7
    Transparent = False
  end
  object sgItens: TStringGrid
    Left = 8
    Top = 150
    Width = 752
    Height = 175
    DefaultRowHeight = 19
    Enabled = False
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRowSelect]
    TabOrder = 14
    ColWidths = (
      79
      360
      100
      64
      64)
    RowHeights = (
      19
      19)
  end
  object eProdutoId: TEdit
    Left = 8
    Top = 120
    Width = 42
    Height = 21
    Enabled = False
    TabOrder = 8
    OnChange = eProdutoIdChange
    OnKeyDown = eProdutoIdKeyDown
  end
  object eNomeProduto: TEdit
    Left = 51
    Top = 120
    Width = 412
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 9
  end
  object ePrecoVenda: TEdit
    Left = 550
    Top = 120
    Width = 66
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 11
  end
  object eQuantidade: TEdit
    Left = 622
    Top = 120
    Width = 66
    Height = 21
    Enabled = False
    TabOrder = 12
    OnChange = eQuantidadeChange
    OnKeyDown = eQuantidadeKeyDown
  end
  object eTotal: TEdit
    Left = 694
    Top = 120
    Width = 66
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 13
  end
  object btPesqProduto: TButton
    Left = 464
    Top = 118
    Width = 80
    Height = 26
    Caption = '&Pesquisar'
    TabOrder = 10
    TabStop = False
    OnClick = btPesqProdutoClick
  end
  object eDataCadastro: TEdit
    Left = 672
    Top = 23
    Width = 88
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object eTotalGeral: TEdit
    Left = 622
    Top = 346
    Width = 138
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 15
  end
end
