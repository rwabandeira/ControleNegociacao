object FrCrudRelatorios: TFrCrudRelatorios
  Left = 0
  Top = 0
  Caption = 'Crud'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnBotoes: TPanel
    Left = 0
    Top = 0
    Width = 80
    Height = 299
    Align = alLeft
    BevelOuter = bvNone
    Color = cl3DLight
    ParentBackground = False
    TabOrder = 0
    object btProcessar: TButton
      Left = 0
      Top = 0
      Width = 80
      Height = 22
      Caption = '&Processar'
      TabOrder = 0
      TabStop = False
    end
    object btImprimir: TButton
      Left = 0
      Top = 46
      Width = 80
      Height = 22
      Caption = '&Imprimir'
      TabOrder = 1
      TabStop = False
    end
  end
  object pnCampos: TPanel
    Left = 80
    Top = 0
    Width = 555
    Height = 299
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 1
  end
  object pcRelacao: TPageControl
    Left = 80
    Top = 0
    Width = 555
    Height = 299
    ActivePage = tsFiltros
    Align = alClient
    TabOrder = 2
    object tsFiltros: TTabSheet
      Caption = 'Filtros'
    end
    object tsResultados: TTabSheet
      Caption = 'Resultados'
      ImageIndex = 1
    end
  end
end
