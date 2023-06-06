unit eUsuario.Model.Conexao.Interfaces;

interface

uses
  Data.DB;

type

  iConexao = interface
    ['{1B20BDCF-C58B-40C5-9CBD-823CD9C36BEA}']
    function Connection : TCustomConnection;
  end;

  iQuery = interface
    ['{2D5D9E34-1316-4ECB-A66B-585729D2F2C5}']
    function SQL(Value : String) : iQuery;
    function DataSet : TDataSet;
  end;

  iEntidade = interface
    ['{37C3FF5A-8BB1-438F-B86D-350790C95B32}']
    function Listar(Value : TDataSource) : iEntidade;
    function ListaCampos(Fields : String; DataSource : TDataSource) : iEntidade;
  end;

implementation

end.
