object FrLimiteCreditos: TFrLimiteCreditos
  Left = 0
  Top = 0
  Caption = 'Limite de Cr'#233'dito'
  ClientHeight = 346
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbLimiteCredito: TLabel
    Left = 491
    Top = 8
    Width = 78
    Height = 13
    Caption = 'Limite de cr'#233'dito'
  end
  object lbDistribuidorId: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lbNome: TLabel
    Left = 69
    Top = 8
    Width = 54
    Height = 13
    Caption = 'Distribuidor'
  end
  object eDistribuidorId: TEdit
    Left = 8
    Top = 27
    Width = 60
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    OnChange = eDistribuidorIdChange
    OnKeyDown = eDistribuidorIdKeyDown
  end
  object eLimiteCredito: TEdit
    Left = 491
    Top = 27
    Width = 126
    Height = 21
    Alignment = taRightJustify
    TabOrder = 3
    OnKeyDown = eLimiteCreditoKeyDown
  end
  object eNome: TEdit
    Left = 69
    Top = 27
    Width = 335
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 1
  end
  object btPesquisar: TButton
    Left = 405
    Top = 25
    Width = 80
    Height = 26
    Caption = '&Pesquisar'
    TabOrder = 2
    TabStop = False
    OnClick = btPesquisarClick
  end
  object sgLimiteCredito: TStringGrid
    Left = 8
    Top = 54
    Width = 609
    Height = 238
    ColCount = 3
    DefaultRowHeight = 19
    Enabled = False
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRowSelect]
    TabOrder = 4
    OnKeyDown = sgLimiteCreditoKeyDown
    ColWidths = (
      86
      320
      159)
    RowHeights = (
      19
      19)
  end
  object pnBotoes: TPanel
    Left = 8
    Top = 298
    Width = 609
    Height = 41
    BevelOuter = bvNone
    TabOrder = 5
    object Button1: TButton
      Left = 534
      Top = 0
      Width = 75
      Height = 41
      Align = alRight
      Caption = '&Cancelar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object btOk: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 41
      Align = alLeft
      Caption = '&Ok'
      TabOrder = 1
      OnClick = btOkClick
    end
  end
end
