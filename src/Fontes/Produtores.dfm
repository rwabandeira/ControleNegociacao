inherited FrProdutores: TFrProdutores
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtores'
  ClientHeight = 376
  ClientWidth = 631
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 637
  ExplicitHeight = 405
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel
    Width = 631
    ExplicitWidth = 631
    inherited btGravar: TButton
      Caption = '&Gravar'
      OnClick = btGravarClick
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 41
    end
    inherited btCancelar: TButton
      Caption = '&Cancelar'
      OnClick = btCancelarClick
      ExplicitLeft = 140
      ExplicitTop = 0
      ExplicitHeight = 41
    end
    inherited btExcluir: TButton
      Caption = '&Excluir'
      OnClick = btExcluirClick
      ExplicitLeft = 70
      ExplicitTop = 0
      ExplicitHeight = 41
    end
    inherited btPesquisar: TButton
      Left = 561
      Align = alRight
      Caption = '&Pesquisar'
      OnClick = btPesquisarClick
      ExplicitLeft = 561
      ExplicitTop = 0
      ExplicitHeight = 41
    end
  end
  inherited pnCampos: TPanel
    Width = 631
    Height = 335
    ExplicitWidth = 631
    ExplicitHeight = 335
    object lbCodigo: TLabel
      Left = 6
      Top = 6
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lbNome: TLabel
      Left = 71
      Top = 6
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object lbCpfCnpj: TLabel
      Left = 509
      Top = 6
      Width = 48
      Height = 13
      Caption = 'CPF/CNPJ'
    end
    object eCodigo: TEdit
      Left = 6
      Top = 25
      Width = 59
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      OnKeyDown = eCodigoKeyDown
    end
    object eNome: TEdit
      Left = 71
      Top = 25
      Width = 321
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 1
    end
    object meCpfCnpj: TMaskEdit
      Left = 509
      Top = 25
      Width = 115
      Height = 21
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = ''
    end
    object rgInscricao: TRadioGroup
      Left = 398
      Top = 6
      Width = 105
      Height = 40
      Caption = 'Inscri'#231#227'o'
      Columns = 2
      Enabled = False
      Items.Strings = (
        'CPF'
        'CNPJ')
      TabOrder = 2
      OnClick = rgInscricaoClick
    end
    object stLimiteCredito: TStaticText
      Left = 6
      Top = 52
      Width = 618
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Limite de Cr'#233'dito'
      Color = clSilver
      ParentColor = False
      TabOrder = 4
      Transparent = False
    end
    object sgLimiteCredito: TStringGrid
      Left = 6
      Top = 75
      Width = 618
      Height = 222
      ColCount = 2
      DefaultRowHeight = 19
      Enabled = False
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRowSelect]
      TabOrder = 5
      ColWidths = (
        412
        181)
      RowHeights = (
        19
        19)
    end
    object btInserir: TButton
      Left = 372
      Top = 303
      Width = 80
      Height = 26
      Caption = '&Inserir'
      Enabled = False
      TabOrder = 6
      TabStop = False
      OnClick = btInserirClick
    end
    object btAlterar: TButton
      Left = 458
      Top = 303
      Width = 80
      Height = 26
      Caption = '&Alterar'
      Enabled = False
      TabOrder = 7
      TabStop = False
    end
    object btRemover: TButton
      Left = 544
      Top = 303
      Width = 80
      Height = 26
      Caption = '&Remover'
      Enabled = False
      TabOrder = 8
      TabStop = False
    end
  end
end
