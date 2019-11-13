unit _Biblioteca;

interface

uses
  SysUtils;

function ValidarCpfCnpj(cpf_cnpj: string): Boolean;
function Numeros(valor: string): string;
function IIf(condicao:Boolean; verdadeiro, falso: Variant): Variant;

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

  // Caso o número não seja 11 (CPF) ou 14 (CNPJ), aborta
  Case Length(cpf_cnpj) of
    11: cnpj := False;
    14: cnpj := True;
  else
    Exit;
  end;

  // Separa o número do digito
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

end.
