unit eUsuario.Model.Entidade.Usuario;

interface

uses
  eUsuario.Model.Conexao.Interfaces, Data.DB;

Type
  TModelEntidadeUsuario = class(TInterfacedObject, iEntidade)
    private
      FQuery : iQuery;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iEntidade;
      function Listar(Value : TDataSource) : iEntidade;
      function ListaCampos(Fields : String; DataSource : TDataSource) : iEntidade;
  end;

implementation

uses
  eUsuario.Controller.Factory.Query;

{ TModelEntidadeUsuario }

constructor TModelEntidadeUsuario.Create;
begin
  FQuery := TControllerFactoryQuery.New.Query(nil);
end;

destructor TModelEntidadeUsuario.Destroy;
begin

  inherited;
end;

function TModelEntidadeUsuario.ListaCampos(Fields: String;
  DataSource: TDataSource): iEntidade;
begin
  Result := Self;
  FQuery.SQL('SELECT ' + Fields + ' FROM Clientes');
  DataSource.DataSet := FQuery.DataSet;
end;

function TModelEntidadeUsuario.Listar(Value: TDataSource): iEntidade;
begin
  Result := Self;
  FQuery.SQL('SELECT * FROM Clientes');
  Value.DataSet := FQuery.DataSet;
end;

class function TModelEntidadeUsuario.New: iEntidade;
begin
  Result := Self.Create;
end;

end.
