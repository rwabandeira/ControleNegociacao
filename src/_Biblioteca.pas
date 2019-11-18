unit _Biblioteca;

interface

uses
  SysUtils, Grids;

function ValidarCpfCnpj(cpf_cnpj: string): Boolean;
function Numeros(valor: string): string;
function IIf(condicao:Boolean; verdadeiro, falso: Variant): Variant;
function FormatarCPFCNPJ(valor: string): string;

procedure RemoverLinhaGrid(grid: TStringGrid; linha: Integer);
function TrocaVirgulaPorPonto(AString: string): String;

implementation

function ValidarCpfCnpj(cpf_cnpj : string): Boolean;
Var
  i, d, b, digito: Byte;
  soma : Integer;
  cnpj : Boolean;
  dig_verif_info, dig_verif_calc : string;
begin
  Result := False;
  cpf_cnpj := Numeros(cpf_cnpj);

  // Caso o n�mero n�o seja 11 (CPF) ou 14 (CNPJ), aborta
  Case Length(cpf_cnpj) of
    11: cnpj := False;
    14: cnpj := True;
  else
    Exit;
  end;

  // Separa o n�mero do digito
  dig_verif_calc := '';
  dig_verif_info := Copy(cpf_cnpj, Length(cpf_cnpj) - 1, 2);
  cpf_cnpj := Copy(cpf_cnpj, 1, Length(cpf_cnpj) - 2);

  // Calcula o digito 1 e 2
  for d := 1 to 2 do begin
    b := IIf(d = 1, 2, 3); // BYTE
    soma := IIf(d = 1, 0, StrToIntDef(dig_verif_calc, 0) * 2);

    for i := Length(cpf_cnpj) downto 1 do begin
      soma := soma + (Ord(cpf_cnpj[i]) - Ord('0')) * b;
      Inc(b);

      if (b > 9) And cnpj then
        b := 2;
    end;

    digito := 11 - soma mod 11;
    if digito >= 10 then
      digito := 0;

    dig_verif_calc := dig_verif_calc + Chr(digito + Ord('0'));
  end;

  Result := dig_verif_calc = dig_verif_info;
end;

function Numeros(valor: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 To Length(valor) do begin
    if CharInSet(valor[i], ['0'..'9',#8]) then
      Result := Result + valor[i];
  end;
end;

function IIf(condicao: Boolean; verdadeiro, falso: Variant): Variant;
begin
  if condicao then
    Result := verdadeiro
  else
    Result := falso;
end;

function FormatarCPFCNPJ(valor: string): string;
begin
  if Length(valor) = 11 then begin
    Result :=
      Copy(valor, 1, 3) + '.' +
      Copy(valor, 4, 3) + '.' +
      Copy(valor, 7, 3) + '-' +
      Copy(valor, 11, 2);
  end
  else if (Length(valor) = 14) then begin
    Result :=
      Copy(valor, 1, 2) + '.' +
      Copy(valor, 3, 3) + '.' +
      Copy(valor, 6, 3) + '/' +
      Copy(valor, 9, 4) + '-' +
      Copy(valor, 13, 2);
  end;
end;

procedure RemoverLinhaGrid(grid: TStringGrid; linha: Integer);
var
  i: Integer;
begin
  for i:= linha to grid.RowCount do
    grid.Rows[i] := grid.Rows[i + 1];

  if grid.RowCount >2 then
    grid.RowCount := grid.RowCount - 1;
end;

function TrocaVirgulaPorPonto(AString: string): String;
var
  i : Integer;
  s : string;
begin
  s := '';

  for i := 1 to Length(AString) do begin
    if  AString[i] = ',' then
      s := s + '.'
    else
      s := s + AString[i];
  end;

  Result := s;
end;

end.