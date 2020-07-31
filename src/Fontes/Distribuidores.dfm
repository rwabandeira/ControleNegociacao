inherited FrDistribuidores: TFrDistribuidores
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Distribuidores'
  ClientHeight = 98
  ClientWidth = 631
  Position = poMainFormCenter
  ExplicitWidth = 637
  ExplicitHeight = 127
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel
    Width = 631
    ExplicitWidth = 631
    inherited btGravar: TButton
      OnClick = btGravarClick
    end
    inherited btCancelar: TButton
      OnClick = btCancelarClick
    end
    inherited btExcluir: TButton
      OnClick = btExcluirClick
    end
    inherited btPesquisar: TButton
      Left = 561
      OnClick = btPesquisarClick
      ExplicitLeft = 561
    end
  end
  inherited pnCampos: TPanel
    Width = 631
    Height = 57
    ExplicitWidth = 631
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
      Alignment = taRightJustify
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
  end
end
