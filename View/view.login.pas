unit view.login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.Mask, classLogin, view.abrirConta,
  Vcl.Buttons, FireDAC.Comp.Client;

type
  TFormLogin = class(TForm)
    pnlContainer: TPanel;
    pnlBox: TPanel;
    Panel2: TPanel;
    Logo: TImage;
    Image3: TImage;
    pnlLogar: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image4: TImage;
    Label2: TLabel;
    edtSenha: TMaskEdit;
    Label3: TLabel;
    edtUser: TMaskEdit;
    Label4: TLabel;
    lblCliqueAqui: TLabel;
    lblAbrirConta: TLabel;
    procedure Image3Click(Sender: TObject);
    procedure pnlLogarMouseEnter(Sender: TObject);
    procedure pnlLogarMouseLeave(Sender: TObject);
    procedure pnlLogarClick(Sender: TObject);
    procedure lblAbrirContaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;
implementation

uses
  view.main;


{$R *.dfm}

procedure TFormLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    pnlLogarClick(Sender);
end;

procedure TFormLogin.Image3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormLogin.lblAbrirContaClick(Sender: TObject);
begin
  FormABrirConta.parent:=pnlBox;
  FormAbrirConta.show;
end;

procedure TFormLogin.pnlLogarClick(Sender: TObject);
var
  Login:TLogin;
begin
  Login:=TLogin.Create;
  try
    Login.Conta:=edtUser.Text;
    Login.Cpf:=edtSenha.Text;
    Login.validarLogin;
  finally
    freeandnil(Login);
  end;
end;

procedure TFormLogin.pnlLogarMouseEnter(Sender: TObject);
begin
  pnlLogar.Color:=clnavy;
end;

procedure TFormLogin.pnlLogarMouseLeave(Sender: TObject);
begin
  pnlLogar.Color:=$00FF8000;
end;

end.
