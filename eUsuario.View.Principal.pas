unit eUsuario.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, eUsuario.Model.Conexao.Interfaces;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
      FUsuario : iEntidade;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  eUsuario.Model.Entidade.Usuario;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  FUsuario.Listar(DataSource1);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  FUsuario.ListaCampos(Edit1.Text, DataSource1);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FUsuario := TModelEntidadeUsuario.New;
end;
end.
