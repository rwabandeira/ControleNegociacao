unit _LimiteCredito;

interface

uses
  SysUtils, _DB, SqlExPr, Forms;

Type
  WebLimiteCreditos = record
    produtor_id: Integer;
    limite_credito: Double;
    nome_distribuidor: string;
    distribuidor_id: Integer;
  end;
  TArrayOfWebLimiteCreditos = array of WebLimiteCreditos;

function BuscarLimiteCreditos(con: TSqlConnection; produtor_id: Integer): TArrayOfWebLimiteCreditos;
procedure AtualizarLimiteCredito(con: TSqlConnection; limite_creditos: TArrayOfWebLimiteCreditos);

implementation

procedure AtualizarLimiteCredito(con: TSqlConnection; limite_creditos: TArrayOfWebLimiteCreditos);
var
  i: Integer;
  pesq: TSqlQuery;
begin
  pesq := TSqlQuery.Create(con);
  pesq.SQLConnection := con;

  for i := Low(limite_creditos) to High(limite_creditos) do begin
    pesq.Close;
    pesq.SQL.Clear;

    pesq.SQL.Add('insert into LIMITE_CREDITOS (');
    pesq.SQL.Add('  PRODUTOR_ID,');
    pesq.SQL.Add('  DISTRIBUIDOR_ID,');
    pesq.SQL.Add('  LIMITE_CREDITO');
    pesq.SQL.Add(') values (');
    pesq.SQL.Add('  ' + QuotedStr(IntToStr(limite_creditos[i].produtor_id)) + ',');
    pesq.SQL.Add('  ' + QuotedStr(IntToStr(limite_creditos[i].distribuidor_id)) + ',');
    pesq.SQL.Add('  ' + QuotedStr(FloatToStr(limite_creditos[i].limite_credito)) + '');
    pesq.SQL.Add(')');

    pesq.ExecSQL;
  end;

  pesq.Active := False;
  pesq.Free;
end;

function BuscarLimiteCreditos(con: TSqlConnection; produtor_id: Integer): TArrayOfWebLimiteCreditos;
var
  pesq: TSqlQuery;
begin
  Result := nil;

  pesq := TSqlQuery.Create(con);
  pesq.SQLConnection := con;

  pesq.SQL.Add('select');
  pesq.SQL.Add('  LCR.PRODUTOR_ID,');
  pesq.SQL.Add('  LCR.DISTRIBUIDOR_ID,');
  pesq.SQL.Add('  DTR.NOME as NOME_DISTRIBUIDOR,');
  pesq.SQL.Add('  LCR.LIMITE_CREDITO');
  pesq.SQL.Add('from');
  pesq.SQL.Add('  LIMITE_CREDITOS LCR');

  pesq.SQL.Add('inner join DISTRIBUIDORES DTR');
  pesq.SQL.Add('on LCR.DISTRIBUIDOR_ID = DTR.DISTRIBUIDOR_ID');

  pesq.SQL.Add('where LCR.PRODUTOR_ID = ' + QuotedStr(IntToStr(produtor_id)));

  pesq.SQL.Add('order by');
  pesq.SQL.Add('  LCR.DISTRIBUIDOR_ID');

  pesq.Open;

  while not pesq.Eof do begin
    SetLength(Result, Length(Result) + 1);

    Result[High(Result)].produtor_id := pesq.FieldByName('PRODUTOR_ID').AsInteger;
    Result[High(Result)].distribuidor_id := pesq.FieldByName('DISTRIBUIDOR_ID').AsInteger;
    Result[High(Result)].nome_distribuidor := pesq.FieldByName('NOME_DISTRIBUIDOR').AsString;
    Result[High(Result)].limite_credito := pesq.FieldByName('LIMITE_CREDITO').AsCurrency;

    pesq.Next;
  end;

  pesq.Active := False;
  pesq.Free;
end;

end.
