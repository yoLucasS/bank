unit view.cadChavePix;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  classTransacoes;

type
  TFormCadPix = class(TForm)
    Panel1: TPanel;
    edtChavePix: TLabeledEdit;
    pnlNewChave: TPanel;
    procedure pnlNewChaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    idUser:integer;
    { Public declarations }
  end;

var
  FormCadPix: TFormCadPix;

implementation

{$R *.dfm}

procedure TFormCadPix.pnlNewChaveClick(Sender: TObject);
var
  iTransacoes:TTransacoes;

begin
  iTransacoes:=TTransacoes.Create;
  iTransacoes.cadastrarChavePix(idUser, edtChavePix.Text);
  iTransacoes.Free;
  edtChavePix.Clear;
end;

end.
