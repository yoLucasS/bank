unit view.main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, classPessoaFisica,
  FireDAC.Comp.Client, view.Transf, Vcl.Mask, Winapi.WebView2, Winapi.ActiveX,
  Vcl.Edge, classTransacoes, Vcl.OleCtrls, SHDocVw, Vcl.WinXPanels;

type
  TCustomDb = class(TCustomDBGrid);
  TFormMain = class(TForm)
    pnlBox: TPanel;
    Panel8: TPanel;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image12: TImage;
    iconClose: TImage;
    Image13: TImage;
    Panel7: TPanel;
    pnlTransferir: TPanel;
    iconPix: TImage;
    Label5: TLabel;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    iconEyes: TImage;
    dbUltimasTransf: TDBGrid;
    Shape3: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Panel9: TPanel;
    edtDeposito: TLabeledEdit;
    pnlDepositar: TPanel;
    Shape4: TShape;
    Label7: TLabel;
    Shape5: TShape;
    Label10: TLabel;
    Panel10: TPanel;
    edtSaque: TLabeledEdit;
    pnlSacar: TPanel;
    pnlSidebar: TPanel;
    pnlHome: TPanel;
    Image2: TImage;
    Panel1: TPanel;
    DataSource2: TDataSource;
    Label2: TLabel;
    Image3: TImage;
    iconRefresh: TImage;
    iconCadPix: TImage;
    Label3: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    procedure iconCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlHomeClick(Sender: TObject);
    procedure iconPixClick(Sender: TObject);
    procedure iconEyesClick(Sender: TObject);
    procedure pnlDepositarClick(Sender: TObject);
    procedure pnlSacarClick(Sender: TObject);
    procedure edtDepositoChange(Sender: TObject);
    procedure edtSaqueChange(Sender: TObject);
    procedure dbUltimasTransfDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure iconRefreshClick(Sender: TObject);
    procedure iconCadPixClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idContaUser:integer;
    idUser:integer;
  end;

var
  FormMain: TFormMain;
  Q:TfdQUery;
  qT:TTransacoes;
  hideEye:Boolean;
implementation

{$R *.dfm}

uses view.cadChavePix;

procedure TFormMain.FormShow(Sender: TObject);
begin
  hideEye:=false;
  qT:=TTransacoes.Create;
  Q:=qT.selectMov(idContaUser);
  DataSource2.DataSet:=Q;
  TCustomDb(dbUltimasTransf).ScrollBars:=ssnone;
end;

procedure TFormMain.dbUltimasTransfDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if Odd(dbUltimasTransf.DataSource.DataSet.RecNo) then
    dbUltimasTransf.canvas.Brush.Color:=$00FF8080
  else begin
    dbUltimasTransf.canvas.Brush.Color:=clwhite;
    dbUltimasTransf.canvas.font.Color:=clblack;
  end;

  if (gdSelected in state) then begin
    dbUltimasTransf.canvas.Brush.Color:=RGB(92,92,92);
    dbUltimasTransf.Canvas.Font.Color:=clwhite;
    dbUltimasTransf.canvas.font.Style:=[fsbold];
  end;

  dbUltimasTransf.Canvas.FillRect(rect);
  dbUltimasTransf.DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFormMain.iconCadPixClick(Sender: TObject);
begin
  FormCadPix.idUser:=idUser;
  FormCadPix.Show;
end;

procedure TFormMain.iconCloseClick(Sender: TObject);
begin
  DataSource2.DataSet:=nil;
  Q.Free;
  qT.Free;
  Application.Terminate;
end;

procedure TFormMain.iconEyesClick(Sender: TObject);
begin
    if hideEye = false then begin
      iconEyes.Picture.LoadFromFile('show.png');
      Panel7.ShowCaption:=true;
      hideEye:=true;
    end else begin
      iconEyes.Picture.LoadFromFile('hide.png');
      Panel7.ShowCaption:=false;
      hideEye:=false;
    end;
end;

procedure TFormMain.iconPixClick(Sender: TObject);
begin
  FormTransferencia.ShowModal;
end;

procedure TFormMain.iconRefreshClick(Sender: TObject);
var
  Q:TTransacoes;
begin
  Q:=TTransacoes.Create;
  panel7.Caption:=' R$'+Q.selectSaldo(idContaUser);
  q.Free;
end;

procedure TFormMain.edtDepositoChange(Sender: TObject);
var
  valor_digitado, valor_formatado: string;
  valor: Double;
begin
  valor_digitado:=edtDeposito.Text;

  valor_digitado:=StringReplace(valor_digitado, '.', '', [rfReplaceAll]);
  valor_digitado:=StringReplace(valor_digitado, ',', '', [rfReplaceAll]);

  if TryStrToFloat(valor_digitado, valor) then begin
    valor_formatado:=FormatFloat('#,##0.00', valor / 100);

    edtDeposito.Text:=valor_formatado;

    edtDeposito.SelStart:=Length(edtDeposito.Text);
  end else begin
    edtDeposito.Text:='';
  end;
end;

procedure TFormMain.edtSaqueChange(Sender: TObject);
var
  valor_digitado, valor_formatado: string;
  valor: Double;
begin
  valor_digitado:=edtSaque.Text;

  valor_digitado:=StringReplace(valor_digitado, '.', '', [rfReplaceAll]);
  valor_digitado:=StringReplace(valor_digitado, ',', '', [rfReplaceAll]);

  if TryStrToFloat(valor_digitado, valor) then begin
    valor_formatado:=FormatFloat('#,##0.00', valor / 100);

    edtSaque.Text:=valor_formatado;

    edtSaque.SelStart:=Length(edtSaque.Text);
  end else begin
    edtSaque.Text:='';
  end;
end;

procedure TFormMain.pnlSacarClick(Sender: TObject);
var
  Q:TTransacoes;
begin
  if edtSaque.Text <> '' then begin
    Q:=TTransacoes.Create;
    try
      Q.saque(idContaUser, edtSaque.Text);
    finally
      Q.Free;
    end;
    dbUltimasTransf.DataSource.DataSet.Refresh;
    iconRefreshClick(Sender);
    edtSaque.Clear;
  end else showmessage('Digite um valor valido!');
end;

procedure TFormMain.pnlHomeClick(Sender: TObject);
begin
  Close;
  DataSource2.DataSet:=nil;
  Q.Free;
  qt.Free;
end;

procedure TFormMain.pnlDepositarClick(Sender: TObject);
var
  Q:TTransacoes;
begin
  if edtDeposito.Text <> '' then begin
    Q:=TTransacoes.Create;
    Q.depositar(idContaUser, edtDeposito.Text);
    Q.Free;
    dbUltimasTransf.DataSource.DataSet.Refresh;
    iconRefreshClick(Sender);
    edtDeposito.Clear;
  end else showmessage('Digite um valor valido!');
end;

end.