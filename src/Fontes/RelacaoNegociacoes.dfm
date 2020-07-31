inherited FrRelNegociacoes: TFrRelNegociacoes
  Caption = 'Rela'#231#227'o de Negocia'#231#245'es'
  ClientHeight = 433
  ClientWidth = 781
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 797
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel
    Height = 433
    ExplicitHeight = 433
    inherited btProcessar: TButton
      OnClick = btProcessarClick
    end
    inherited btImprimir: TButton
      OnClick = btImprimirClick
    end
  end
  inherited pnCampos: TPanel
    Width = 701
    Height = 433
    ExplicitWidth = 701
    ExplicitHeight = 433
  end
  inherited pcRelacao: TPageControl
    Width = 701
    Height = 433
    ActivePage = tsResultados
    ExplicitWidth = 701
    ExplicitHeight = 433
    inherited tsFiltros: TTabSheet
      ExplicitWidth = 693
      ExplicitHeight = 405
      object lbProdutorId: TLabel
        Left = 8
        Top = 6
        Width = 42
        Height = 13
        Caption = 'Produtor'
      end
      object lbDistribuidorId: TLabel
        Left = 8
        Top = 48
        Width = 54
        Height = 13
        Caption = 'Distribuidor'
      end
      object eProdutorId: TEdit
        Left = 8
        Top = 21
        Width = 42
        Height = 21
        NumbersOnly = True
        TabOrder = 0
        OnChange = eProdutorIdChange
        OnKeyDown = eProdutorIdKeyDown
      end
      object eNomeProdutor: TEdit
        Left = 51
        Top = 21
        Width = 247
        Height = 21
        TabStop = False
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 1
      end
      object eDistribuidorId: TEdit
        Left = 8
        Top = 63
        Width = 42
        Height = 21
        NumbersOnly = True
        TabOrder = 2
        OnChange = eDistribuidorIdChange
        OnKeyDown = eDistribuidorIdKeyDown
      end
      object eNomeDistribuidor: TEdit
        Left = 51
        Top = 63
        Width = 247
        Height = 21
        TabStop = False
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 3
      end
      object btPesqProdutor: TButton
        Left = 299
        Top = 19
        Width = 80
        Height = 26
        Caption = 'Pesquisar'
        TabOrder = 4
        TabStop = False
        OnClick = btPesqProdutorClick
      end
      object btPesqDistribuidor: TButton
        Left = 299
        Top = 61
        Width = 80
        Height = 26
        Caption = 'Pesquisar'
        TabOrder = 5
        TabStop = False
        OnClick = btPesqDistribuidorClick
      end
    end
    inherited tsResultados: TTabSheet
      ExplicitWidth = 693
      ExplicitHeight = 405
      object stNegociacoes: TStaticText
        Left = 0
        Top = 0
        Width = 693
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'Negocia'#231#245'es'
        Color = clMenuBar
        ParentColor = False
        TabOrder = 0
        Transparent = False
      end
      object pnItensNegociacao: TPanel
        Left = 0
        Top = 168
        Width = 693
        Height = 237
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object stItensNegociacao: TStaticText
          Left = 0
          Top = 0
          Width = 693
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = 'Itens da Negocia'#231#227'o'
          Color = clMenuBar
          ParentColor = False
          TabOrder = 0
          Transparent = False
        end
        object sgItensNegociacao: TStringGrid
          Left = 0
          Top = 17
          Width = 693
          Height = 220
          Align = alClient
          DefaultRowHeight = 19
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goColSizing]
          TabOrder = 1
          ColWidths = (
            70
            270
            90
            90
            90)
          RowHeights = (
            19
            19)
        end
      end
      object sgNegociacoes: TStringGrid
        Left = 0
        Top = 17
        Width = 693
        Height = 151
        Align = alClient
        ColCount = 9
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goColSizing]
        TabOrder = 2
        OnClick = sgNegociacoesClick
        ColWidths = (
          90
          200
          200
          100
          100
          100
          100
          100
          100)
        RowHeights = (
          19
          19)
      end
    end
  end
  object frxRelNegociacoes: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44042.697901817090000000
    ReportOptions.LastChange = 44042.821932037030000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 104
    Top = 192
    Datasets = <
      item
        DataSet = frxDSItensNegociacao
        DataSetName = 'frxDSItensNegociacao'
      end
      item
        DataSet = frxDSNegociacoes
        DataSetName = 'frxDSNegociacoes'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Line4: TfrxLineView
          Top = 49.133889999999990000
          Width = 718.110236220000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo11: TfrxMemoView
          Align = baClient
          Width = 718.110700000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Negocia'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 404.409710000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        DataSet = frxDSItensNegociacao
        DataSetName = 'frxDSItensNegociacao'
        RowCount = 0
        object frxDSItensNegociacaoITEM_ID: TfrxMemoView
          Left = 7.559060000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'ITEM_ID'
          DataSet = frxDSItensNegociacao
          DataSetName = 'frxDSItensNegociacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDSItensNegociacao."ITEM_ID"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDSItensNegociacaoPRODUTO_ID: TfrxMemoView
          Left = 77.102362200000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'PRODUTO_ID'
          DataSet = frxDSItensNegociacao
          DataSetName = 'frxDSItensNegociacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDSItensNegociacao."PRODUTO_ID"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDSItensNegociacaoNOME_PRODUTO: TfrxMemoView
          Left = 154.204824000000000000
          Width = 260.787521180000000000
          Height = 18.897650000000000000
          DataField = 'NOME_PRODUTO'
          DataSet = frxDSItensNegociacao
          DataSetName = 'frxDSItensNegociacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDSItensNegociacao."NOME_PRODUTO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDSItensNegociacaoPRECO_VENDA: TfrxMemoView
          Left = 420.016018000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'PRECO_VENDA'
          DataSet = frxDSItensNegociacao
          DataSetName = 'frxDSItensNegociacao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDSItensNegociacao."PRECO_VENDA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDSItensNegociacaoQUANTIDADE: TfrxMemoView
          Left = 529.890106000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'QUANTIDADE'
          DataSet = frxDSItensNegociacao
          DataSetName = 'frxDSItensNegociacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDSItensNegociacao."QUANTIDADE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDSItensNegociacaoTOTAL_PRODUTO: TfrxMemoView
          Left = 612.283860000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_PRODUTO'
          DataSet = frxDSItensNegociacao
          DataSetName = 'frxDSItensNegociacao'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDSItensNegociacao."TOTAL_PRODUTO"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 113.385900000000000000
        Top = 136.063080000000000000
        Width = 718.110700000000000000
        AllowSplit = True
        Condition = 'frxDSItensNegociacao."NEGOCIACAO_ID"'
        object Memo1: TfrxMemoView
          Left = 102.047310000000000000
          Top = 11.338590000000010000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[frxDSItensNegociacao."NEGOCIACAO_ID"]')
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 11.338590000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Negocia'#231#227'o:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 362.834880000000000000
          Top = 11.338590000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'Value = 0'
          Highlight.FillType = ftBrush
          Highlight.Visible = False
          Memo.UTF8W = (
            '[frxDSNegociacoes."DATA_CADASTRO"]')
        end
        object Memo4: TfrxMemoView
          Left = 238.110390000000000000
          Top = 11.338590000000010000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data do Cadastro:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 616.063390000000000000
          Top = 11.338590000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[frxDSNegociacoes."STATUS"]')
        end
        object Memo6: TfrxMemoView
          Left = 563.149970000000000000
          Top = 11.338590000000010000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Status:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 102.047310000000000000
          Top = 37.795299999999910000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            
              '[frxDSNegociacoes."PRODUTOR_ID"] - [frxDSNegociacoes."NOME_PRODU' +
              'TOR"]')
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795299999999910000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Produtor:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 453.543600000000000000
          Top = 37.795300000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            
              '[frxDSNegociacoes."DISTRIBUIDOR_ID"] - [frxDSNegociacoes."NOME_D' +
              'ISTRIBUIDOR"]')
          Formats = <
            item
            end
            item
            end>
        end
        object Memo10: TfrxMemoView
          Left = 355.275820000000000000
          Top = 37.795299999999910000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Distribuidor:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 136.063080000000000000
          Top = 64.252009999999900000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'Value = 0'
          Highlight.FillType = ftBrush
          Highlight.Visible = False
          Memo.UTF8W = (
            '[frxDSNegociacoes."DATA_APROVACAO"]')
        end
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Top = 64.252009999999900000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data da Aprova'#231#227'o:')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 370.393940000000000000
          Top = 64.252009999999900000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'Value = 0'
          Highlight.FillType = ftBrush
          Highlight.Visible = False
          Memo.UTF8W = (
            '[frxDSNegociacoes."DATA_CONCLUSAO"]')
        end
        object Memo15: TfrxMemoView
          Left = 238.110390000000000000
          Top = 64.252009999999900000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data de Conclus'#227'o:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 627.401980000000000000
          Top = 64.252009999999900000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Highlight.ApplyFont = False
          Highlight.ApplyFill = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = 'Value = 0'
          Highlight.FillType = ftBrush
          Highlight.Visible = False
          Memo.UTF8W = (
            '[frxDSNegociacoes."DATA_CANCELAMENTO"]')
        end
        object Memo17: TfrxMemoView
          Left = 472.441250000000000000
          Top = 64.252009999999900000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data do Cancelamento:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 7.559060000000000000
          Top = 91.488250000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Item')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 77.102412000000000000
          Top = 91.488250000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 154.204824000000000000
          Top = 91.488250000000000000
          Width = 260.787521180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 529.890106000000000000
          Top = 91.488250000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 420.016018000000000000
          Top = 91.488250000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Pre'#231'o de Venda')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 612.283860000000000000
          Top = 91.488250000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 111.385900000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Diagonal = True
        end
        object Line1: TfrxLineView
          Top = 90.708720000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Diagonal = True
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        object Line3: TfrxLineView
          Top = 3.948824999999885000
          Width = 718.110236220000000000
          Color = clBlack
          Diagonal = True
        end
        object Line5: TfrxLineView
          Top = 22.677180000000020000
          Width = 718.110236220000000000
          Color = clBlack
          Diagonal = True
        end
        object SysMemo1: TfrxSysMemoView
          Left = 612.283860000000000000
          Top = 3.559059999999988000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDSItensNegociacao."TOTAL_PRODUTO">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDSNegociacoes: TfrxDBDataset
    UserName = 'frxDSNegociacoes'
    CloseDataSource = False
    DataSet = fdQryNegociacoes
    BCDToCurrency = False
    Left = 596
    Top = 80
  end
  object fdQryNegociacoes: TFDQuery
    IndexFieldNames = 'NEGOCIACAO_ID'
    Connection = fdConexao
    SQL.Strings = (
      'select'
      '  NEG.NEGOCIACAO_ID,'
      '  NEG.PRODUTOR_ID,'
      '  PRO.NOME as NOME_PRODUTOR,'
      '  NEG.DISTRIBUIDOR_ID,'
      '  DIS.NOME as NOME_DISTRIBUIDOR,'
      '  NEG.DATA_CADASTRO,'
      '  NEG.STATUS,'
      '  NEG.DATA_APROVACAO,'
      '  NEG.DATA_CONCLUSAO,'
      '  NEG.DATA_CANCELAMENTO'
      'from'
      '  NEGOCIACOES NEG'
      ''
      'inner join PRODUTORES PRO'
      'on NEG.PRODUTOR_ID = PRO.PRODUTOR_ID'
      ''
      'inner join DISTRIBUIDORES DIS'
      'on NEG.DISTRIBUIDOR_ID = DIS.DISTRIBUIDOR_ID')
    Left = 596
    Top = 136
  end
  object fdConexao: TFDConnection
    Params.Strings = (
      'ConnectionDef=ConFirebird')
    Connected = True
    LoginPrompt = False
    Left = 108
    Top = 136
  end
  object frxDSItensNegociacao: TfrxDBDataset
    UserName = 'frxDSItensNegociacao'
    CloseDataSource = False
    DataSet = fdQryItensNegociacao
    BCDToCurrency = False
    Left = 700
    Top = 80
  end
  object fdQryItensNegociacao: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'select'
      '  ITE.NEGOCIACAO_ID,'
      '  ITE.ITEM_ID,'
      '  ITE.PRODUTO_ID,'
      '  PRO.NOME as NOME_PRODUTO,'
      '  ITE.QUANTIDADE,'
      '  ITE.PRECO_VENDA,'
      '  (ITE.QUANTIDADE * ITE.PRECO_VENDA) as TOTAL_PRODUTO'
      'from'
      '  NEGOCIACOES NEG'
      ''
      'inner join ITENS_NEGOCIACOES ITE'
      'on NEG.NEGOCIACAO_ID = ITE.NEGOCIACAO_ID'
      ''
      'inner join PRODUTOS PRO'
      'on ITE.PRODUTO_ID = PRO.PRODUTO_ID')
    Left = 700
    Top = 136
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 720
    Top = 376
  end
end
