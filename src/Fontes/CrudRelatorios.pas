unit CrudRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Vcl.ComCtrls, Vcl.Grids;

type
  TFrCrudRelatorios = class(TForm)
    pnBotoes: TPanel;
    btProcessar: TButton;
    btImprimir: TButton;
    pnCampos: TPanel;
    pcRelacao: TPageControl;
    tsFiltros: TTabSheet;
    tsResultados: TTabSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrCrudRelatorios: TFrCrudRelatorios;

implementation

{$R *.dfm}

procedure TFrCrudRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
