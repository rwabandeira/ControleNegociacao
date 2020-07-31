unit CrudPesquisar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Vcl.Grids;

type
  TFrCrudPesquisar = class(TForm)
    pnFiltros: TPanel;
    lbChave: TLabel;
    lbFiltros: TLabel;
    cbFiltros: TComboBox;
    eChave: TEdit;
    sgPesquisa: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrCrudPesquisar: TFrCrudPesquisar;

implementation

{$R *.dfm}

procedure TFrCrudPesquisar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
