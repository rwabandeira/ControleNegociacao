inherited FrProdutos: TFrProdutos
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtos'
  ClientHeight = 98
  ClientWidth = 519
  Position = poMainFormCenter
  ExplicitWidth = 525
  ExplicitHeight = 127
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel
    Width = 519
    ExplicitWidth = 519
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
      Left = 449
      Align = alRight
      Caption = '&Pesquisar'
      OnClick = btPesquisarClick
      ExplicitLeft = 449
      ExplicitTop = 0
      ExplicitHeight = 41
    end
  end
  inherited pnCampos: TPanel
    Width = 519
    Height = 57
    ExplicitWidth = 519
    ExplicitHeight = 57
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
    object lbPrecoVenda: TLabel
      Left = 398
      Top = 6
      Width = 75
      Height = 13
      Caption = 'Pre'#231'o de venda'
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
    object ePrecoVenda: TEdit
      Left = 398
      Top = 25
      Width = 115
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 2
    end
  end
end
