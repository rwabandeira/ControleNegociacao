inherited FrDistribuidores: TFrDistribuidores
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Distribuidores'
  ClientHeight = 145
  ClientWidth = 398
  Position = poMainFormCenter
  ExplicitWidth = 404
  ExplicitHeight = 174
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel
    Width = 398
    ExplicitWidth = 398
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
      Left = 328
      Align = alRight
      Caption = '&Pesquisar'
      OnClick = btPesquisarClick
      ExplicitLeft = 328
      ExplicitTop = 0
      ExplicitHeight = 41
    end
  end
  inherited pnCampos: TPanel
    Width = 398
    Height = 104
    ExplicitWidth = 398
    ExplicitHeight = 104
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
      Top = 52
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
      Left = 117
      Top = 71
      Width = 115
      Height = 21
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = ''
    end
    object rgInscricao: TRadioGroup
      Left = 6
      Top = 52
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
