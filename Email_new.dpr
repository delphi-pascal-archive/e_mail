program Email_new;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  adress in 'adress.pas' {Form2},
  em in 'em.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
