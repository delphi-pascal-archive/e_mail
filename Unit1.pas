unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdIMAP4, IdCoder, IdCoder3to4, IdCoderMIME,
  ExtCtrls, Menus, INIFiles, IdPOP3, IdMessage, IdTCPServer, IdSMTPServer,
  IdSMTP;

type
  TForm1 = class(TForm)
    IdIMAP41: TIdIMAP4;
    IdDecoderMIME1: TIdDecoderMIME;
    Timer2: TTimer;
    IdPOP31: TIdPOP3;
    IdMessage1: TIdMessage;
    Button2: TButton;
    Memo2: TMemo;
    ListBox1: TListBox;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    IdSMTPServer1: TIdSMTPServer;
    Button6: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Math, adress, em;

{$R *.dfm}

function KOI8_RToUTF16Char(const P: Char): WideChar;
begin
 case ord(P) of
  $80: result:= #$2500;  // BOX DRAWINGS LIGHT HORIZONTAL
  $81: result:= #$2502;  // BOX DRAWINGS LIGHT VERTICAL
  $82: result:= #$250c;  // BOX DRAWINGS LIGHT DOWN AND RIGHT
  $83: result:= #$2510;  // BOX DRAWINGS LIGHT DOWN AND LEFT
  $84: result:= #$2514;  // BOX DRAWINGS LIGHT UP AND RIGHT
  $85: result:= #$2518;  // BOX DRAWINGS LIGHT UP AND LEFT
  $86: result:= #$251c;  // BOX DRAWINGS LIGHT VERTICAL AND RIGHT
  $87: result:= #$2524;  // BOX DRAWINGS LIGHT VERTICAL AND LEFT
  $88: result:= #$252c;  // BOX DRAWINGS LIGHT DOWN AND HORIZONTAL
  $89: result:= #$2534;  // BOX DRAWINGS LIGHT UP AND HORIZONTAL
  $8a: result:= #$253c;  // BOX DRAWINGS LIGHT VERTICAL AND HORIZONTAL
  $8b: result:= #$2580;  // UPPER HALF BLOCK
  $8c: result:= #$2584;  // LOWER HALF BLOCK
  $8d: result:= #$2588;  // FULL BLOCK
  $8e: result:= #$258c;  // LEFT HALF BLOCK
  $8f: result:= #$2590;  // RIGHT HALF BLOCK
  $90: result:= #$2591;  // LIGHT SHADE
  $91: result:= #$2592;  // MEDIUM SHADE
  $92: result:= #$2593;  // DARK SHADE
  $93: result:= #$2320;  // TOP HALF INTEGRAL
  $94: result:= #$25a0;  // BLACK SQUARE
  $95: result:= #$2219;  // BULLET OPERATOR
  $96: result:= #$221a;  // SQUARE ROOT
  $97: result:= #$2248;  // ALMOST EQUAL TO
  $98: result:= #$2264;  // LESS-THAN OR EQUAL TO
  $99: result:= #$2265;  // GREATER-THAN OR EQUAL TO
  $9a: result:= #$00a0;  // NO-BREAK SPACE
  $9b: result:= #$2321;  // BOTTOM HALF INTEGRAL
  $9c: result:= #$00b0;  // DEGREE SIGN
  $9d: result:= #$00b2;  // SUPERSCRIPT TWO
  $9e: result:= #$00b7;  // MIDDLE DOT
  $9f: result:= #$00f7;  // DIVISION SIGN
  $a0: result:= #$2550;  // BOX DRAWINGS DOUBLE HORIZONTAL
  $a1: result:= #$2551;  // BOX DRAWINGS DOUBLE VERTICAL
  $a2: result:= #$2552;  // BOX DRAWINGS DOWN SINGLE AND RIGHT DOUBLE
  $a3: result:= #$0451;  // CYRILLIC SMALL LETTER IO
  $a4: result:= #$2553;  // BOX DRAWINGS DOWN DOUBLE AND RIGHT SINGLE
  $a5: result:= #$2554;  // BOX DRAWINGS DOUBLE DOWN AND RIGHT
  $a6: result:= #$2555;  // BOX DRAWINGS DOWN SINGLE AND LEFT DOUBLE
  $a7: result:= #$2556;  // BOX DRAWINGS DOWN DOUBLE AND LEFT SINGLE
  $a8: result:= #$2557;  // BOX DRAWINGS DOUBLE DOWN AND LEFT
  $a9: result:= #$2558;  // BOX DRAWINGS UP SINGLE AND RIGHT DOUBLE
  $aa: result:= #$2559;  // BOX DRAWINGS UP DOUBLE AND RIGHT SINGLE
  $ab: result:= #$255a;  // BOX DRAWINGS DOUBLE UP AND RIGHT
  $ac: result:= #$255b;  // BOX DRAWINGS UP SINGLE AND LEFT DOUBLE
  $ad: result:= #$255c;  // BOX DRAWINGS UP DOUBLE AND LEFT SINGLE
  $ae: result:= #$255d;  // BOX DRAWINGS DOUBLE UP AND LEFT
  $af: result:= #$255e;  // BOX DRAWINGS VERTICAL SINGLE AND RIGHT DOUBLE
  $b0: result:= #$255f;  // BOX DRAWINGS VERTICAL DOUBLE AND RIGHT SINGLE
  $b1: result:= #$2560;  // BOX DRAWINGS DOUBLE VERTICAL AND RIGHT
  $b2: result:= #$2561;  // BOX DRAWINGS VERTICAL SINGLE AND LEFT DOUBLE
  $b3: result:= #$0401;  // CYRILLIC CAPITAL LETTER IO
  $b4: result:= #$2562;  // BOX DRAWINGS VERTICAL DOUBLE AND LEFT SINGLE
  $b5: result:= #$2563;  // BOX DRAWINGS DOUBLE VERTICAL AND LEFT
  $b6: result:= #$2564;  // BOX DRAWINGS DOWN SINGLE AND HORIZONTAL DOUBLE
  $b7: result:= #$2565;  // BOX DRAWINGS DOWN DOUBLE AND HORIZONTAL SINGLE
  $b8: result:= #$2566;  // BOX DRAWINGS DOUBLE DOWN AND HORIZONTAL
  $b9: result:= #$2567;  // BOX DRAWINGS UP SINGLE AND HORIZONTAL DOUBLE
  $ba: result:= #$2568;  // BOX DRAWINGS UP DOUBLE AND HORIZONTAL SINGLE
  $bb: result:= #$2569;  // BOX DRAWINGS DOUBLE UP AND HORIZONTAL
  $bc: result:= #$256a;  // BOX DRAWINGS VERTICAL SINGLE AND HORIZONTAL DOUBLE
  $bd: result:= #$256b;  // BOX DRAWINGS VERTICAL DOUBLE AND HORIZONTAL SINGLE
  $be: result:= #$256c;  // BOX DRAWINGS DOUBLE VERTICAL AND HORIZONTAL
  $bf: result:= #$00a9;  // COPYRIGHT SIGN
  $c0: result:= #$044e;  // CYRILLIC SMALL LETTER YU
  $c1: result:= #$0430;  // CYRILLIC SMALL LETTER A
  $c2: result:= #$0431;  // CYRILLIC SMALL LETTER BE
  $c3: result:= #$0446;  // CYRILLIC SMALL LETTER TSE
  $c4: result:= #$0434;  // CYRILLIC SMALL LETTER DE
  $c5: result:= #$0435;  // CYRILLIC SMALL LETTER IE
  $c6: result:= #$0444;  // CYRILLIC SMALL LETTER EF
  $c7: result:= #$0433;  // CYRILLIC SMALL LETTER GHE
  $c8: result:= #$0445;  // CYRILLIC SMALL LETTER HA
  $c9: result:= #$0438;  // CYRILLIC SMALL LETTER I
  $ca: result:= #$0439;  // CYRILLIC SMALL LETTER SHORT I
  $cb: result:= #$043a;  // CYRILLIC SMALL LETTER KA
  $cc: result:= #$043b;  // CYRILLIC SMALL LETTER EL
  $cd: result:= #$043c;  // CYRILLIC SMALL LETTER EM
  $ce: result:= #$043d;  // CYRILLIC SMALL LETTER EN
  $cf: result:= #$043e;  // CYRILLIC SMALL LETTER O
  $d0: result:= #$043f;  // CYRILLIC SMALL LETTER PE
  $d1: result:= #$044f;  // CYRILLIC SMALL LETTER YA
  $d2: result:= #$0440;  // CYRILLIC SMALL LETTER ER
  $d3: result:= #$0441;  // CYRILLIC SMALL LETTER ES
  $d4: result:= #$0442;  // CYRILLIC SMALL LETTER TE
  $d5: result:= #$0443;  // CYRILLIC SMALL LETTER U
  $d6: result:= #$0436;  // CYRILLIC SMALL LETTER ZHE
  $d7: result:= #$0432;  // CYRILLIC SMALL LETTER VE
  $d8: result:= #$044c;  // CYRILLIC SMALL LETTER SOFT SIGN
  $d9: result:= #$044b;  // CYRILLIC SMALL LETTER YERU
  $da: result:= #$0437;  // CYRILLIC SMALL LETTER ZE
  $db: result:= #$0448;  // CYRILLIC SMALL LETTER SHA
  $dc: result:= #$044d;  // CYRILLIC SMALL LETTER E
  $dd: result:= #$0449;  // CYRILLIC SMALL LETTER SHCHA
  $de: result:= #$0447;  // CYRILLIC SMALL LETTER CHE
  $df: result:= #$044a;  // CYRILLIC SMALL LETTER HARD SIGN
  $e0: result:= #$042e;  // CYRILLIC CAPITAL LETTER YU
  $e1: result:= #$0410;  // CYRILLIC CAPITAL LETTER A
  $e2: result:= #$0411;  // CYRILLIC CAPITAL LETTER BE
  $e3: result:= #$0426;  // CYRILLIC CAPITAL LETTER TSE
  $e4: result:= #$0414;  // CYRILLIC CAPITAL LETTER DE
  $e5: result:= #$0415;  // CYRILLIC CAPITAL LETTER IE
  $e6: result:= #$0424;  // CYRILLIC CAPITAL LETTER EF
  $e7: result:= #$0413;  // CYRILLIC CAPITAL LETTER GHE
  $e8: result:= #$0425;  // CYRILLIC CAPITAL LETTER HA
  $e9: result:= #$0418;  // CYRILLIC CAPITAL LETTER I
  $ea: result:= #$0419;  // CYRILLIC CAPITAL LETTER SHORT I
  $eb: result:= #$041a;  // CYRILLIC CAPITAL LETTER KA
  $ec: result:= #$041b;  // CYRILLIC CAPITAL LETTER EL
  $ed: result:= #$041c;  // CYRILLIC CAPITAL LETTER EM
  $ee: result:= #$041d;  // CYRILLIC CAPITAL LETTER EN
  $ef: result:= #$041e;  // CYRILLIC CAPITAL LETTER O
  $f0: result:= #$041f;  // CYRILLIC CAPITAL LETTER PE
  $f1: result:= #$042f;  // CYRILLIC CAPITAL LETTER YA
  $f2: result:= #$0420;  // CYRILLIC CAPITAL LETTER ER
  $f3: result:= #$0421;  // CYRILLIC CAPITAL LETTER ES
  $f4: result:= #$0422;  // CYRILLIC CAPITAL LETTER TE
  $f5: result:= #$0423;  // CYRILLIC CAPITAL LETTER U
  $f6: result:= #$0416;  // CYRILLIC CAPITAL LETTER ZHE
  $f7: result:= #$0412;  // CYRILLIC CAPITAL LETTER VE
  $f8: result:= #$042c;  // CYRILLIC CAPITAL LETTER SOFT SIGN
  $f9: result:= #$042b;  // CYRILLIC CAPITAL LETTER YERU
  $fa: result:= #$0417;  // CYRILLIC CAPITAL LETTER ZE
  $fb: result:= #$0428;  // CYRILLIC CAPITAL LETTER SHA
  $fc: result:= #$042d;  // CYRILLIC CAPITAL LETTER E
  $fd: result:= #$0429;  // CYRILLIC CAPITAL LETTER SHCHA
  $fe: result:= #$0427;  // CYRILLIC CAPITAL LETTER CHE
  $ff: result:= #$042a;  // CYRILLIC CAPITAL LETTER HARD SIGN
  else result:=WideChar(ord(P));
 end;
end;

// converts an KOI8-R string into an UTF-16 wideString
// no special conversions (e.g. on line breaks) are done
function KOI8_RToUTF16Str(const s: string): WideString;
var
 i,j: integer;
begin
 j:= length(s);
 setLength(Result,j);
 for i:=1 to j do
  Result[i]:=KOI8_RToUTF16Char(s[i]);
end;

function DecodeStr(Text: string): string;
var
 Temp, Dec: string;
 P,P2:Integer;
begin
 Temp:=Text;
 Result:='';

 while pos('=?windows-1251?',Temp)>0 do
  begin
   P:=pos('=?windows-1251?',Temp);
   // P2:=pos('?=',Copy(Temp,P,Length(Temp)))+P;
   P2:=pos('?=',Temp);
   Dec:=Copy(Temp,p+17,P2-(P+17));
   Dec:=Form1.IdDecoderMIME1.DecodeString(Dec);
   Result:=Result+Copy(Temp,1,P-1)+Dec;
   Temp:=Copy(Temp,P2+2,length(Temp));
  end;
 Result:=Result+Temp;
 Temp:=Result;

 Result:='';
 while pos('=?koi8-r?',Temp)>0 do
  begin
   P:=pos('=?koi8-r?',Temp);
   P2:=pos('?=',Temp);
   Dec:=Copy(Temp,p+11,P2-(P+11));
   try
    if Dec<>''
    then Dec:=KOI8_RToUTF16Str(Form1.IdDecoderMIME1.DecodeString(Dec));
   except

   end;
   Result:=Result+Copy(Temp,1,P-1)+Dec;
   Temp:=Copy(Temp,P2+2,length(Temp));
  end;
 Result:=Result+Temp;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Application.Title:='Проверка/Отправка почты (POP3, IMAP)';
 //
 ListBox1.Items.LoadFromFile(ExtractFilePath(ParamStr(0))+'emails.txt');
 try
  ListBox1.Selected[0]:=true;
 except

 end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 Form2.ShowModal;
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
 Form2.ShowModal;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
 i: integer;
begin
 if MessageDlg('Вы действительно удалить адрес?', mtConfirmation,
  [mbYes, mbNo],0)=mrNo
 then Exit
 else
  begin
   for i:=0 to Form1.ListBox1.Items.Count-1 do
    begin
     if Form1.ListBox1.Selected[i]
     then
      begin
       ListBox1.Items.Delete(i);
       ListBox1.Items.SaveToFile(ExtractFilePath(ParamStr(0))+'emails.txt');       
       Break;
      end;
    end;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 ListBox1.Items.Add('new@new.ru|new.mail.ru|user|password|POP3');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 i: integer;
 s,usr: string;
 imap: boolean;
begin
 Memo2.Clear;
 imap:=false;
 for i:=0 to Form1.ListBox1.Items.Count-1 do
  begin
   if Form1.ListBox1.Selected[i]
   then
    begin
     s:=Form1.ListBox1.Items.Strings[i];
     Break;
    end;
  end;
 //
 IdIMAP41.Port:=143;
 IdPOP31.Port:=110;
 //
 usr:=Copy(s,1,pos('|',s)-1);
 Delete(s,1,pos('|',s));
 IdIMAP41.Host:=Copy(s,1,pos('|',s)-1);
 IdPOP31.Host:=IdIMAP41.Host;
 //
 Delete(s,1,pos('|',s));
 IdIMAP41.Username:=Copy(s,1,pos('|',s)-1);
 IdPOP31.Username:=IdIMAP41.Username;
 //
 Delete(s,1,pos('|',s));
 IdIMAP41.Password:=Copy(s,1,pos('|',s)-1);
 IdPOP31.Password:=IdIMAP41.Password;
 //
 Delete(s,1,pos('|',s));
 if s='POP3'
 then imap:=false
 else
  if s='IMAP'
  then imap:=true;
 //////////////////////////////////////// проверка почты
 Memo2.Clear;
 Timer2.Enabled:=true;
 Timer2.Interval:=1000*60*5; // раз в 5 минут
 try
  if imap=true
  then
   begin
    IdIMAP41.Connect(30000);
    IdIMAP41.SelectMailBox('INBOX');
    IdIMAP41.RetrieveAllHeaders(IdIMAP41.MailBox.MessageList);
    //
    if IdIMAP41.MailBox.MessageList.Count=0
    then ShowMessage('В папке 0 сообщений!');
   end
  else
   begin
    IdPOP31.Connect(1000);
    if IdPOP31.CheckMessages=0
    then ShowMessage('В папке 0 сообщений!');
   end;
  if imap=true
  then
   begin //IMAP4
    Memo2.Lines.Add('------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
    Memo2.Lines.Add('Имя почтового ящика (IMAP): '+usr+' (всего сообщений: '+IntToStr(IdIMAP41.MailBox.MessageList.Count)+')');
    Memo2.Lines.Add('------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
    for i:=0 to IdIMAP41.MailBox.MessageList.Count-1 do
     begin
      Memo2.Lines.Add('    '+IntToStr(i+1)+':    От: '+DecodeStr(IdIMAP41.MailBox.MessageList.Messages[i].From.Text));
      Memo2.Lines.Add('           Адрес: '+DecodeStr(IdIMAP41.MailBox.MessageList.Messages[i].From.Address));
      Memo2.Lines.Add('           Имя: '+DecodeStr(IdIMAP41.MailBox.MessageList.Messages[i].From.Name));
      Memo2.Lines.Add('           Тема: '+DecodeStr(IdIMAP41.MailBox.MessageList.Messages[i].Subject));
      Memo2.Lines.Add('           Сервер: '+DecodeStr(IdIMAP41.MailBox.MessageList.Messages[i].MsgId));
      Memo2.Lines.Add('           Attachement Encoding: '+DecodeStr(IdIMAP41.MailBox.MessageList.Messages[i].AttachmentEncoding));
      Memo2.Lines.Add('           Charset: '+DecodeStr(IdIMAP41.MailBox.MessageList.Messages[i].CharSet));
      Memo2.Lines.Add('           Текст сообщения: '+DecodeStr(IdIMAP41.MailBox.MessageList.Messages[i].Body.Text));
      Memo2.Lines.Add(' ');
     end;
    IdIMAP41.Disconnect;
   end
 else
   begin //POP3
    Memo2.Lines.Add('------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
    Memo2.Lines.Add('Имя почтового ящика (POP): '+usr+' (всего сообщений: неизвестно)');
    Memo2.Lines.Add('------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
    for i:=1 to IdPOP31.CheckMessages do
     begin
      IdMessage1.Clear;
      IdPOP31.RetrieveHeader(i,IdMessage1);
      Memo2.Lines.Add('    '+IntToStr(i)+':    От: '+DecodeStr(IdMessage1.From.Text));
      Memo2.Lines.Add('           Адрес: '+DecodeStr(IdMessage1.From.Address));
      Memo2.Lines.Add('           Имя: '+DecodeStr(IdMessage1.From.Name));
      Memo2.Lines.Add('           Тема: '+DecodeStr(IdMessage1.Subject));
      Memo2.Lines.Add('           Сервер: '+DecodeStr(IdMessage1.MsgId));
      Memo2.Lines.Add('           Attachement Encoding: '+DecodeStr(IdMessage1.AttachmentEncoding));
      Memo2.Lines.Add('           Charset: '+DecodeStr(IdMessage1.CharSet));
      Memo2.Lines.Add('           Текст сообщения: '+DecodeStr(IdMessage1.Body.Text));
      Memo2.Lines.Add(' ');
     end;
    IdPOP31.Disconnect;
   end;
 except

 end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 Form3.ShowModal;
end;

end.
