program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Round_U in 'Round_U.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'tyut';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

