unit classTransacoes;

interface

uses
  FireDAC.Comp.Client, classQuery, System.SysUtils, Vcl.Dialogs, Vcl.Forms, 
  Winapi.Windows;
type
  TTransacoes = class
    private
    FidUser: integer;
    FsaldoConta: string;

    public
      property idUserLogado: integer read FidUser write FidUser;
      property saldoConta: string read FsaldoConta write FsaldoConta;
      function selectChavePix(chave:string; idLogado:integer):Integer;
      function realizarPix(valor:double; ID, IdC: Integer; saldo:string):double;
      procedure depositar(idU:integer; saldo:string);
      procedure saque(idU:integer; saldo:string);
      procedure logMov(tipo:string; idConta:integer);
      function selectMov(idContaUser:integer):TFDQuery;
      function selectSaldo(idLogado:integer):string;
      procedure cadChavePix(idUser:integer; chave:string);
    end;
implementation

{ TTransacoes }

procedure TTransacoes.cadChavePix(idUser: integer; chave: string);
var
  Q:TFDQuery;
  Query:TQuery;
begin
  Query:=TQuery.create('chaves_pix','chave, id_user');
  Q:=Query.insert(quotedstr(chave)+','+idUser.ToString, '');
  showmessage('Chave Pix inserida com sucesso!');
  //tratamento de falhas a fazer!
  Query.Free;
  Q.Free;
end;

procedure TTransacoes.depositar(idU: integer; saldo:string);
var
  Query:TQuery;
  valorFormatado, valor:string;
begin
  Query:=TQuery.create('conta','');
  valor:=StringReplace(saldo, ',','.', [rfReplaceAll]);
  valor:=StringReplace(valor, '.','', [rfReplaceAll]);
  valorFormatado:=FormatFloat('####.##', valor.ToDouble);
  Query.Update('saldo = saldo + '+valorFormatado+'',' WHERE id_conta = '+idU.tostring+'');
  logMov('deposito', idU);
  showmessage('Deposito feito com sucesso!');
  query.Free;
  //transf em procedure e verificar o stringreplace do ponto
end;

procedure TTransacoes.logMov(tipo: string; idConta: integer);
var
  Query:TQuery;
begin
  Query:=TQuery.create('movimentos','tipo, conta_id, data, horario');
  Query.insert(quotedstr(tipo)+', '+idConta.ToString +', '''+Formatdatetime('YYYY-mm-dd', Now)+''', '''+formatdatetime('HH:MM:SS', Now)+'''', '');
  Query.Free;
end;

function TTransacoes.realizarPix(valor: double; ID, IdC: Integer; saldo:string):double;
var
  Query:TQuery;
  valorFormatado:string;
  valorPost:double;
begin
  //transf em procedure e revisar o valor do segundo uP e gerar log de saida
  Query:=TQuery.create('conta','');
  try
    valorPost:=strtofloat(saldo) + valor;
    valorFormatado:=StringReplace(valorPost.ToString, ',','.', [rfReplaceAll]);
    Query.Update('saldo = '+valorFormatado+'', ' WHERE id_conta = '+inttostr(ID)+'');
    result:=valorPost;
  finally
    Query.Free;
  end;
  Query:=TQuery.create('conta','');
  try
    Query.Update('saldo = saldo - '+valor.ToString+'', ' WHERE id_conta = '+IdC.ToString+'');
    Query.Free;
  finally
    logMov('Pix',IdC);
  end;
end;

procedure TTransacoes.saque(idU: integer; saldo: string);
var
  Query:TQuery;
  valorFormatado:string;
begin
  //transf em procedure
  Query:=TQuery.create('conta','');
  valorFormatado:=StringReplace(saldo, ',','.', [rfReplaceAll]);
  Query.Update('saldo = saldo - '+valorFormatado+'',' WHERE id_conta = '+idU.tostring+'');
  logMov('Saque',idU);
  showmessage('Saque feito com sucesso!');
  Query.Free;
end;

function TTransacoes.selectChavePix(chave: string; idLogado:integer): Integer;
var
  Q:TFDQuery;
  Query:TQuery;
begin
  Query:=TQuery.create('chaves_pix LEFT JOIN usuarios on id_user = user_id LEFT JOIN conta on conta.id_pf = usuarios.id_pf', '*');
  Q:=Query.select('WHERE chave = '+Quotedstr(chave)+'');
  if Q.FieldByName('user_id').AsInteger = idLogado  then begin
    result:=0;
  end else begin
    result:=q.FieldByName('id_conta').AsInteger;
  end;
    Q.Free;
    Query.Free;
    //verificar qual situa��o precisava do assigned
end;

function TTransacoes.selectMov(idContaUser:integer): TFDQuery;
var
  Q:TFDQuery;
  Query:TQuery;
begin
  Query:=TQuery.create('movimentos LEFT JOIN conta on conta_id = id_conta LEFT JOIN pessoa_fisica on id_pf = pf_id','nome, sobrenome, tipo, data, horario');
  Q:=Query.select('WHERE movimentos.conta_id = '+idContaUser.ToString+' ORDER BY data desc');
  result:=q;
  Query.Free;
end;

function TTransacoes.selectSaldo(idLogado:integer): string;
var
  Q:TFDQuery;
  Query:TQuery;
begin
  Query:=TQuery.create('conta', '*');
  Q:=Query.select('WHERE id_conta = '+idLogado.tostring+'');
  result:=q.FieldByName('saldo').AsString;
  Query.Free;
  Q.Free;
  //alterar para retronar um valor double
end;

end.