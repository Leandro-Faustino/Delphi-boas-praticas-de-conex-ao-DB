unit eUsuario.Model.Conexao.Firedac;

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
  TModelConexaoFiredac = class(TInterfacedObject, iConexao)
    private
      FConexao: TFDConnection;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iConexao;
      function Connection : TCustomConnection;
  end;

implementation

uses
  System.SysUtils;

{ TModelConexaoFiredac }

function TModelConexaoFiredac.Connection: TCustomConnection;
begin
  Result := FConexao;
end;

constructor TModelConexaoFiredac.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FConexao.DriverName := 'FB';
  FConexao.Params.Database := 'C:\Program Files\Firebird\Firebird_4_0\PROJETOS_DELPHI.DFB';
  FConexao.Params.UserName := 'SYSDBA';
  FConexao.Params.Password := 'sql88';
  FConexao.Connected := true;
end;

destructor TModelConexaoFiredac.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

class function TModelConexaoFiredac.New: iConexao;
begin
  Result := Self.Create;
end;

end.
