object FrMenu: TFrMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object mmMenu: TMainMenu
    Left = 576
    Top = 248
    object miParametros: TMenuItem
      Caption = 'Cadastros'
      object miProdutores: TMenuItem
        Caption = 'Produtores'
        OnClick = miProdutoresClick
      end
      object miDistribuidores: TMenuItem
        Caption = 'Distribuidores'
        OnClick = miDistribuidoresClick
      end
      object miProdutos: TMenuItem
        Caption = 'Produtos'
        OnClick = miProdutosClick
      end
    end
    object miNegociacao: TMenuItem
      Caption = 'Negocia'#231#227'o'
      OnClick = miNegociacaoClick
    end
  end
  object sqlConect: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      
        'Database=C:\Users\RobsonAra'#250'jo-.ROBSON-DELL\Documents\GitHub\Con' +
        'troleNegociacao\data\SGR.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 576
    Top = 192
  end
end