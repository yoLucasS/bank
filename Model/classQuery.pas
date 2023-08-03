unit classQuery;

interface
uses FireDAC.DApt, FireDAC.Comp.Client, System.Diagnostics, Vcl.Dialogs,
  System.SysUtils, Conn;

type

TQuery = class
  private
    FTabelas: string;
    FColunas: string;
  public
    property Tabelas: string read FTabelas write FTabelas;
    property Colunas: string read FColunas write FColunas;
    function select(condicoes:string):TFDQuery;
    function insert(values, Return:string):TFDQuery;
    constructor create(ATabela, AColunas:string);
    function Update(Values, Condicao:string):Boolean;
    function construirComponenteSql(sqlText:string):TFDQuery;
end;

implementation

{ TQuery }


function TQuery.construirComponenteSql(sqlText:string):TFDQuery;
var
  Q:TFDQuery;
begin
  Q:=TFDQuery.Create(nil);
  Q.Connection:=DmConn.Conn;
  Q.SQL.Clear;
  Q.SQL.Text:=sqlText;
  result:=Q;
end;
//Melhorar nome das rotinas
constructor TQuery.create(ATabela, AColunas:string);
begin
  Tabelas:=ATabela;
  Colunas:=AColunas;
end;

function TQuery.insert(values, Return: string): TFDQuery;
var
  Qr:TFDQuery;
begin
  //result:=false;
  Qr:=construirComponenteSql('INSERT INTO ' + FTabelas + ' (' + FColunas + ') VALUES (' + values + ')'+Return+'');
  if Return.IsEmpty then
    Qr.ExecSQL else Qr.Open;
  result:=Qr;
  //trocar para boolean
end;

function TQuery.select(condicoes: string): TFDQuery;
var
  Q:TFdQuery;
begin
  Q:=construirComponenteSql('SELECT ' + FColunas + ' FROM ' + FTabelas + ' ' + condicoes);
  Q.Open;
  result:=Q;
end;

function TQuery.Update(Values, Condicao: string): Boolean;
var
  Q: TFDQuery;
begin
  result:=false;
  Q:=construirComponenteSql('UPDATE ' + FTabelas + ' SET ' + values + Condicao);
  try
    Q.ExecSQL;
    result:=true;
  finally
    Q.Free;
  end;
end;


end.
