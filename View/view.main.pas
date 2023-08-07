unit view.main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, classPessoaFisica,
  FireDAC.Comp.Client, view.Transf, Vcl.Mask, Winapi.WebView2, Winapi.ActiveX,
  Vcl.Edge, classTransacoes, Vcl.OleCtrls, SHDocVw, Vcl.WinXPanels,
  System.Generics.Collections;

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
    Shape3: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Panel9: TPanel;
    pnlDepositar: TPanel;
    Shape4: TShape;
    Label7: TLabel;
    Shape5: TShape;
    Label10: TLabel;
    Panel10: TPanel;
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
    edtDeposito: TMaskEdit;
    edtSaque: TMaskEdit;
    Label4: TLabel;
    Label6: TLabel;
    sgTransacoes: TStringGrid;
    iconRefreshGrid: TImage;
    Label11: TLabel;
    Label12: TLabel;
    procedure iconCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlHomeClick(Sender: TObject);
    procedure iconPixClick(Sender: TObject);
    procedure iconEyesClick(Sender: TObject);
    procedure pnlDepositarClick(Sender: TObject);
    procedure pnlSacarClick(Sender: TObject);
    procedure iconRefreshClick(Sender: TObject);
    procedure iconCadPixClick(Sender: TObject);
    procedure iconRefreshGridClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idContaUser:integer;
    idUser:integer;
    procedure popularStringGrid;
  end;

var
  FormMain: TFormMain;
  hideEye:Boolean;
  Mov:TTransacoes;
implementation

{$R *.dfm}

uses view.cadChavePix;

procedure TFormMain.FormShow(Sender: TObject);
begin
  hideEye:=False;
  popularStringGrid;
end;

procedure TFormMain.iconCadPixClick(Sender: TObject);
begin
  FormCadPix.idUser:=idUser;
  FormCadPix.Show;
end;

procedure TFormMain.iconCloseClick(Sender: TObject);
begin
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
  panel7.Caption:=' R$'+Q.selectSaldo(idContaUser).ToString;
  q.Free;
end;

procedure TFormMain.iconRefreshGridClick(Sender: TObject);
begin
  popularStringGrid;
end;

procedure TFormMain.pnlSacarClick(Sender: TObject);
var
  Q:TTransacoes;
begin
  if edtSaque.Text <> '          ,  ' then begin
    Q:=TTransacoes.Create;
    try
      Q.saque(idContaUser, edtSaque.Text);
    finally
      Q.Free;
    end;
    iconRefreshClick(Sender);
    popularStringGrid;
    edtSaque.Clear;
  end else showmessage('Digite um valor valido!');
end;

procedure TFormMain.popularStringGrid;
var
  MovimentosList:TObjectList<TTransacoes>;
  Row:Integer;
  MovInfo:TStringList;
begin
  Mov:=TTransacoes.Create;
  MovimentosList:=Mov.selectMovimento(idContaUser);
  sgTransacoes.Repaint;
  sgTransacoes.RowCount:=MovimentosList.Count + 1;
  sgTransacoes.ColWidths[0]:=140;
  sgTransacoes.ColWidths[5]:=100;
  sgTransacoes.Cells[0, 0]:='Nome';
  sgTransacoes.Cells[1, 0]:='Sobrenome';
  sgTransacoes.Cells[2, 0]:='Tipo';
  sgTransacoes.Cells[3, 0]:='Data';
  sgTransacoes.Cells[4, 0]:='Horario';
  sgTransacoes.Cells[5, 0]:='Valor';
  Row:=1;

  for var Mov in MovimentosList do begin
    MovInfo:=TStringList.Create;
    try
      MovInfo.Add(Mov.Nome);
      MovInfo.Add(Mov.Sobrenome);
      MovInfo.Add(Mov.Tipo);
      MovInfo.Add(DateToStr(Mov.Data));
      MovInfo.Add(TimeToStr(Mov.Horario));
      MovInfo.Add('R$ ' + Mov.Valor);
      for var Col:=0 to MovInfo.Count - 1 do
        sgTransacoes.Cells[Col, Row]:=MovInfo[Col];
      Inc(Row);
    finally
      MovInfo.Free;
    end;
  end;
  MovimentosList.Free;
  Mov.Free;
end;

procedure TFormMain.pnlHomeClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.pnlDepositarClick(Sender: TObject);
var
  Q:TTransacoes;
begin
  if edtDeposito.Text <> '          ,  ' then begin
    Q:=TTransacoes.Create;
    Q.depositar(idContaUser, edtDeposito.Text);
    Q.Free;
    iconRefreshClick(Sender);
    popularStringGrid;
    edtDeposito.Clear;
  end else showmessage('Digite um valor valido!');
end;

end.
