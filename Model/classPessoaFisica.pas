unit classPessoaFisica;

interface

uses classQuery, Vcl.Dialogs, System.SysUtils, Winapi.Windows, Vcl.Forms,
  FireDAC.Comp.Client,System.Math;

type
  TPessoaFisica = class
    private
      FNome:string;
      FSobrenome:string;
      FTelefone: string;
      FCpf: string;
      FEmail: string;
      FEndereco: string;
      procedure setCpf(const Value: string);
      procedure setEmail(const Value: string);
      procedure setNome(const Value: string);
      procedure setSobrenome(const Value: string);
      procedure setTelefone(const Value: string);
      procedure setEndereco(const Value: string);
    published
      property Nome: string read FNome write setNome;
      property Sobrenome: string read FSobrenome write setSobrenome;
      property Telefone: string read FTelefone write setTelefone;
      property Cpf: string read FCpf write setCpf;
      property Email: string read FEmail write setEmail;
      property Endereco: string read FEndereco write setEndereco;
    public
      function insertPF:TFDQuery;
      function selectPF(condicao:string):TFDQuery;
  end;
implementation

{ TPessoaFisica }

function TPessoaFisica.insertPF: TFDQuery;
var
  Q,qU,qC:TQuery;
  Query,qUsuario,qConta:TFDQuery;
  idPf,Conta:integer;
begin
  Q:=TQuery.create('pessoa_fisica','nome, sobrenome, telefone, email, endereco');
  Query:=Q.insert(Quotedstr(FNome) +','+ Quotedstr(FSobrenome) +','+ Quotedstr(FTelefone) +','+ Quotedstr(FEmail) +','+ Quotedstr(FEndereco), 'RETURNING pf_id');
  idPf:=QUery.FieldByName('pf_id').AsInteger;
  result:=Query;
  qU:=TQuery.create('usuarios','conta, cpf, id_pf');
  randomize;
  qUsuario:=qU.insert(''+RandomRange(100000000, 999999999).ToString+','+QuotedStr(FCpf)+','+idPf.ToString+'','RETURNING conta');
  conta:=qUsuario.FieldByName('conta').AsInteger;
  qC:=TQuery.create('conta','id_pf');
  qConta:=qC.insert(''+idPf.ToString+'','');

  qC.Free;
  qConta.Free;
  qU.Free;
  qUsuario.Free;
  Q.Free;

  showmessage('Cadastro realizado com sucesso!');
  showmessage('Sua conta �: '+Conta.ToString);

  //trocar para boolean
end;

procedure TPessoaFisica.setNome(const Value: string);
begin
  if Value <> '' then begin
    FNome:=Value;
  end else begin
    application.MessageBox('O campo Nome deve ser prenchido corretamente!', 'Aviso', MB_ok + MB_iconInformation);
    raise Exception.Create('O valor do Nome n�o pode ser vazio.');
  end;
end;

procedure TPessoaFisica.setSobrenome(const Value: string);
begin
  if Value <> '' then begin
    FSobrenome:=Value;
  end else begin
    application.MessageBox('O campo Sobrenome deve ser prenchido corretamente!', 'Aviso', MB_ok + MB_iconInformation);
    raise Exception.Create('O valor do Sobrenome n�o pode ser vazio.');
  end;
end;

procedure TPessoaFisica.setTelefone(const Value: string);
begin
  if Value <> '' then begin
    FTelefone:=Value;
  end else begin
    application.MessageBox('O campo Telefone deve ser prenchido corretamente!', 'Aviso', MB_ok + MB_iconInformation);
    raise Exception.Create('O valor do Telefone n�o pode ser vazio.');
  end;
end;

function TPessoaFisica.selectPF(condicao: string): TFDQuery;
var
  Q:TQuery;
begin
  Q:=TQuery.create('usuarios LEFT JOIN pessoa_fisica on id_pf = pf_id', 'nome, cpf');
  result:=Q.select(condicao);
  q.Free;
end;

procedure TPessoaFisica.setCpf(const Value: string);
begin
  if Value <> '' then begin
    FCpf:=Value;
  end else begin
    application.MessageBox('O campo CPF deve ser prenchido corretamente!', 'Aviso', MB_ok + MB_iconInformation);
    raise Exception.Create('O valor do CPF n�o pode ser vazio.');
  end;
end;

procedure TPessoaFisica.setEmail(const Value: string);
begin
  if Value <> '' then begin
    FEmail:=Value;
  end else begin
    application.MessageBox('O campo Email deve ser prenchido corretamente!', 'Aviso', MB_ok + MB_iconInformation);
    raise Exception.Create('O valor do Email n�o pode ser vazio.');
  end;
end;

procedure TPessoaFisica.setEndereco(const Value: string);
begin
  if Value <> '' then begin
      FEndereco:=Value;
  end else begin
    application.MessageBox('O campo Endere�o deve ser prenchido corretamente!', 'Aviso', MB_ok + MB_iconInformation);
    raise Exception.Create('O valor do Endere�o n�o pode ser vazio.');
  end;
end;


end.