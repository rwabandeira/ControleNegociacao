inherited FrProdutores: TFrProdutores
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtores'
  ClientHeight = 154
  ClientWidth = 415
  Position = poMainFormCenter
  ExplicitWidth = 421
  ExplicitHeight = 183
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel
    Width = 415
    ExplicitWidth = 415
    inherited btGravar: TButton
      Caption = '&Gravar'
      OnClick = btGravarClick
    end
    inherited btCancelar: TButton
      Caption = '&Cancelar'
      OnClick = btCancelarClick
    end
    inherited btExcluir: TButton
      Caption = '&Excluir'
      OnClick = btExcluirClick
    end
    inherited btPesquisar: TButton
      Left = 344
      Align = alRight
      Caption = '&Pesquisar'
      OnClick = btPesquisarClick
      ExplicitLeft = 344
    end
  end
  inherited pnCampos: TPanel
    Width = 415
    Height = 113
    ExplicitWidth = 415
    ExplicitHeight = 113
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
      Left = 117
      Top = 54
      Width = 48
      Height = 13
      Caption = 'CPF/CNPJ'
    end
    object lbTipo: TLabel
      Left = 238
      Top = 54
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object eCodigo: TEdit
      Left = 6
      Top = 25
      Width = 59
      Height = 21
      CharCase = ecUpperCase
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
      Left = 117
      Top = 73
      Width = 115
      Height = 21
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = ''
    end
    object cbTipo: TComboBox
      Left = 238
      Top = 73
      Width = 154
      Height = 21
      Enabled = False
      TabOrder = 4
      Items.Strings = (
        'Produtor'
        'Distribuidor')
    end
    object rgInscricao: TRadioGroup
      Left = 6
      Top = 54
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
  end
end
