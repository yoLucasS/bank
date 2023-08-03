unit view.Transf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, System.Bluetooth, System.Bluetooth.Components, BluetoothLE,
  IdMessage, IdAttachment, IdBaseComponent, classTransacoes,
  FireDAC.Comp.Client, System.MaskUtils;

type
  TFormTransferencia = class(TForm)
    Panel1: TPanel;
    edtChavePix: TMaskEdit;
    Label1: TLabel;
    pnlPix: TPanel;
    Label2: TLabel;
    pnlUpdate: TPanel;
    iconClose: TImage;
    pnlBuscarChave: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edtValor: TEdit;
    Label5: TLabel;
    procedure iconCloseClick(Sender: TObject);
    procedure pnlBuscarChaveClick(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pnlUpdateClick(Sender: TObject);

  private
    FSaldoConta: string;
    FIdUser: integer;
    { Private declarations }
  public
    { Public declarations }
    idC:integer;
    property saldoConta: string read FSaldoConta write FSaldoConta;
    property idUserLogado: integer read FidUser write FidUser;
  end;

var
  FormTransferencia: TFormTransferencia;
  idR:integer;

implementation

{$R *.dfm}
uses
  view.main;



procedure TFormTransferencia.edtValorChange(Sender: TObject);
var
  valor_digitado, valor_formatado: string;
  valor: Double;
begin
  valor_digitado:=edtValor.Text;

  valor_digitado:=StringReplace(valor_digitado, '.', '', [rfReplaceAll]);
  valor_digitado:=StringReplace(valor_digitado, ',', '', [rfReplaceAll]);

  if TryStrToFloat(valor_digitado, valor) then begin
    valor_formatado:=FormatFloat('#,##0.00', valor / 100);

    edtValor.Text:=valor_formatado;

    edtValor.SelStart:=Length(edtValor.Text);
  end else begin
    edtValor.Text:='';
  end;
end;

procedure TFormTransferencia.iconCloseClick(Sender: TObject);
begin
  pnlPix.Visible:=false;
  edtValor.Clear;
end;

procedure TFormTransferencia.pnlBuscarChaveClick(Sender: TObject);
var
  selectPix:TTransacoes;
begin
  selectPix:=TTransacoes.Create;
  selectPix.idUserLogado:=idUserLogado;
  selectPix.saldoConta:=saldoConta;
  idR:=selectPix.selectChavePix(edtChavePix.Text, idUserLogado);

  if (edtChavePix.Text <> '') and (idR<>0) then
    pnlPix.Visible:=true else showmessage('Digite uma chave pix v�lida');
  label4.Caption:='R$ ' + FsaldoConta;
  selectPix.Free;
end;

procedure TFormTransferencia.pnlUpdateClick(Sender: TObject);
var
  transacao:TTransacoes;
  Q:Double;
  formatFloat:string;
begin
  formatFloat:=stringreplace(edtValor.Text,'.','',[rfReplaceAll]);
  transacao:=TTransacoes.Create;
  Q:=transacao.realizarPix(StrToFloat(formatFloat), idR, idC,saldoConta);
  transacao.Free;
  showmessage('Transfer�ncia realizada com sucesso!');
  close;
  pnlPix.Visible:=false;
end;

end.
