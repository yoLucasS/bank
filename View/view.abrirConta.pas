unit view.abrirConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Mask, classPessoaFisica, FireDAC.Comp.Client, Vcl.Buttons;

type
  TFormAbrirConta = class(TForm)
    pnlBoxLeft: TPanel;
    pnlBoxRight: TPanel;
    iconBack: TImage;
    Image1: TImage;
    Label1: TLabel;
    Nome: TLabeledEdit;
    Sobrenome: TLabeledEdit;
    pnlLogar: TPanel;
    Endereco: TLabeledEdit;
    Email: TLabeledEdit;
    Cpf: TMaskEdit;
    Label2: TLabel;
    Telefone: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure iconBackClick(Sender: TObject);
    procedure pnlLogarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbrirConta: TFormAbrirConta;

implementation

{$R *.dfm}

procedure TFormAbrirConta.iconBackClick(Sender: TObject);
begin
  close;
end;

procedure TFormAbrirConta.pnlLogarClick(Sender: TObject);
var
  Q:TPessoaFisica;
begin
   Q:=TPessoaFisica.Create;
  try
    Q.Nome:=Nome.Text;
    Q.Sobrenome:=Sobrenome.Text;
    Q.Telefone:=Telefone.Text;
    Q.Email:=Email.Text;
    Q.Cpf:=Cpf.Text;
    Q.Endereco:=Endereco.Text;
    Q.insertPF;
    for var i := 0 to self.ComponentCount -1 do begin
      if self.Components[i] is TLabeledEdit  then begin
        TLabeledEdit(self.Components[i]).Clear;
      end else if self.Components[i] is TMaskEdit then begin
        TMaskEdit(self.Components[i]).Clear;
      end;
    end;
  except
  end;
    Q.Free;
end;

end.
