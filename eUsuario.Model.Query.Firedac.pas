unit eUsuario.Model.Query.Firedac;

interface

uses
  eUsuario.Model.Conexao.Interfaces,
  Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

Type
  TModelQueryFiredac = class(TInterfacedObject, iQuery)
    private
      FParent : iConexao;
      FQuery : TFDQuery;

    public
      constructor Create(Parent : iConexao);
      destructor Destroy; override;
      class function New(Parent : iConexao) : iQuery;
      function SQL(Value : String) : iQuery;
      function DataSet : TDataSet;
  end;

implementation

uses
  System.SysUtils, eUsuario.Model.Conexao.Firedac;

{ TModelQueryFiredac }

constructor TModelQueryFiredac.Create(Parent : iConexao);
begin
  FParent := Parent;
  FQuery := TFDQuery.Create(nil);

  if not Assigned(FParent) then
    FParent := TModelConexaoFiredac.New;

  FQuery.Connection := TFDConnection(FParent.Connection);
end;

function TModelQueryFiredac.DataSet: TDataSet;
begin
  Result := FQuery;
end;

destructor TModelQueryFiredac.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelQueryFiredac.New(Parent : iConexao) : iQuery;
begin
  Result := Self.Create(Parent);
end;

function TModelQueryFiredac.SQL(Value: String): iQuery;
begin
  Result := Self;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
  FQuery.Active := true;
end;

end.
