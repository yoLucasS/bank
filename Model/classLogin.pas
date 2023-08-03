unit classLogin;

interface

uses classQuery, FireDAC.Comp.Client, Vcl.Dialogs, view.main, view.Transf;

type
  TLogin = class
    private
      FConta:string;
      FCpf: string;
      procedure setConta(const Value: string);
    procedure setCpf(const Value: string);

    public
      property Conta: string read FConta write setConta;
      property Cpf: string read FCpf write setCpf;
      function validarLogin:TFDQuery;
  end;

implementation

uses
  System.SysUtils, Vcl.Forms, Winapi.Windows;

{ TLogin }


procedure TLogin.setConta(const Value: string);
begin
  if Value <> '' then begin
    FConta:=Value;
  end else begin
    application.MessageBox('O campo Conta deve ser prenchido corretamente!', 'Aviso', MB_ok + MB_iconInformation);
    raise Exception.Create('O valor da Conta n�o pode ser vazio.');
  end;
end;

procedure TLogin.setCpf(const Value: string);
begin
  if Value <> '' then begin
    FCpf:=value;
  end else begin
    application.MessageBox('O campo CPF deve ser prenchido corretamente!', 'Aviso', MB_ok + MB_iconInformation);
    raise Exception.Create('O valor do Cpf n�o pode ser vazio.');
  end;
end;

function TLogin.validarLogin:TFDQuery;
var
  Query:TFDQuery;
  Q:TQuery;
begin
  Q:=TQuery.create('usuarios LEFT JOIN conta on conta.id_pf = usuarios.id_pf LEFT JOIN pessoa_fisica on usuarios.id_pf = pf_id','*');
  Query:=Q.select('WHERE conta = '+ QuotedStr(FConta)+' and cpf = '+ QuotedStr(FCpf) +'');
  if Query.RecordCount > 0 then begin
    FormMain.Panel7.Caption:= ' R$' + currtostr(Query.FieldByName('saldo').AsCurrency);
    FormTransferencia.saldoConta:=currtostr(Query.FieldByName('saldo').AsCurrency);
    FormTransferencia.idUserLogado:=Query.FieldByName('user_id').AsInteger;
    FormMain.idUser:=Query.FieldByName('user_id').AsInteger;
    FormTransferencia.idC:=Query.FieldByName('id_conta').AsInteger;
    FormMain.idContaUser:=Query.FieldByName('id_conta').AsInteger;
    FormMain.Panel8.Caption:='Bem vindo de volta, '+Query.FieldByName('nome').AsString;
    FormMain.Show;
  end else begin
    showmessage('Usu�rio ou senha incorretos');
  end;
  result:=Query;
  Q.Free;
  //trocar para boolean trocar para procedure
end;

end.
