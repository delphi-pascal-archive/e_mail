unit adress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Button1: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
var
 i: integer;
 s: string;
begin
 for i:=0 to Form1.ListBox1.Items.Count-1 do
  begin
   if Form1.ListBox1.Selected[i]
   then
    begin
     s:=Form1.ListBox1.Items.Strings[i];
     //
     Edit1.Text:=Copy(s,1,pos('|',s)-1);
     Delete(s,1,pos('|',s));
     Edit2.Text:=Copy(s,1,pos('|',s)-1);
     Delete(s,1,pos('|',s));
     Edit3.Text:=Copy(s,1,pos('|',s)-1);
     Delete(s,1,pos('|',s));
     Edit4.Text:=Copy(s,1,pos('|',s)-1);
     Delete(s,1,pos('|',s));
     if s='POP3'
     then RadioButton1.Checked:=true
     else
      if s='IMAP'
      then RadioButton2.Checked:=true
       else RadioButton1.Checked:=true;
     if Edit1.Text=''
     then Edit1.Text:=Form1.ListBox1.Items.Strings[i];
     //
     Break;
    end;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
 i: integer;
 s: string;
begin
 for i:=0 to Form1.ListBox1.Items.Count-1 do
  begin
   if Form1.ListBox1.Selected[i]
   then
    begin
     if (Edit1.Text<>'') and (Edit2.Text<>'')
      and (Edit3.Text<>'') and (Edit4.Text<>'')
     then
      begin
       s:=Edit1.Text+'|'+Edit2.Text+'|'+Edit3.Text+'|'+Edit4.Text;
       if RadioButton1.Checked
       then s:=s+'|'+'POP3'
       else s:=s+'|'+'IMAP';
       Form1.ListBox1.Items.Strings[i]:=s;
       Form1.ListBox1.Items.SaveToFile(ExtractFilePath(ParamStr(0))+'emails.txt');
      end
     else ShowMessage('Одно из полей не заполнено!'); 
     Break;
    end;
  end;
 Close; 
end;

end.
