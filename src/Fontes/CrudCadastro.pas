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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrCrudCadastro: TFrCrudCadastro;

implementation

{$R *.dfm}

procedure TFrCrudCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
