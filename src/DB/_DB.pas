unit _DB;

interface

uses
  SqlExPr;

function Conexao: TSQLConnection;

implementation

function Conexao: TSQLConnection;
begin
  Result := TSQLConnection.Create(nil);

  Result.Params.Clear;
  Result.Connected := False;
  Result.KeepConnection := False;
  Result.LoginPrompt := False;
  Result.ConnectionName := 'FBConnection';
  Result.DriverName := 'Firebird';
  Result.Params.Add('VendorLib=fbclient.dll');
  Result.Params.Add('VendorLibWin64=fbclient.dll');
  Result.Params.Add('VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird');
  Result.Params.Add('Database=127.0.0.1/3050:C:\ControleNegociacao\data\SGR.FDB');
  Result.Params.Add('User_Name=sysdba');
  Result.Params.Add('Password=masterkey');
  Result.Params.Add('DriverName=Firebird');

  Result.Connected := True;
end;

end.
