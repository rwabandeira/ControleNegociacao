unit CrudCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrCrudCadastro = class(TForm)
    pnBotoes: TPanel;
    btGravar: TButton;
    btCancelar: TButton;
    btExcluir: TButton;
    btPesquisar: TButton;
    pnCampos: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrCrudCadastro: TFrCrudCadastro;

implementation

{$R *.dfm}

end.
