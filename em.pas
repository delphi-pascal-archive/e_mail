unit em;

interface

uses
  inifiles, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient,
  IdSMTP, ComCtrls, StdCtrls, Buttons, ExtCtrls, IdBaseComponent, IdMessage;

type
  TForm3 = class(TForm)
    MailMessage: TIdMessage;
    SMTP: TIdSMTP;
    AttachmentDialog: TOpenDialog;
    ledHost: TLabeledEdit;
    ledFrom: TLabeledEdit;
    ledTo: TLabeledEdit;
    ledCC: TLabeledEdit;
    ledSubject: TLabeledEdit;
    ledAttachment: TLabeledEdit;
    Memo2: TMemo;
    Label1: TLabel;
    btnSendMail: TBitBtn;
    Memo1: TMemo;
    Button1: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    procedure btnSendMailClick(Sender: TObject);
    procedure SMTPStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure Button1Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.btnSendMailClick(Sender: TObject);
begin
 Memo1.Clear;
 // ��������� SMTP
 SMTP.Host:=ledHost.Text;
 SMTP.Port:=25;
 // ��������� ���������
 Smtp.AuthenticationType:=atLogin; // atNone
 Smtp.Username:=LabeledEdit1.Text;
 Smtp.Password:=LabeledEdit2.Text;
 //
 MailMessage.From.Name:=ledFrom.Text;
 MailMessage.Subject:=ledSubject.Text; // ����
 MailMessage.From.Address:=ledFrom.Text; // ����� �����������
 MailMessage.Recipients.EMailAddresses:=ledTo.Text+','+ledCC.Text; // ���������� + �����
 MailMessage.Body.Text:=Memo2.Text; // ����� ���������
 if FileExists(ledAttachment.Text)
 then TIdAttachment.Create(MailMessage.MessageParts,ledAttachment.Text);
 // �������� �����
 try
  try
   SMTP.Connect(1000);
   SMTP.Send(MailMessage);
   ShowMessage('������ ����������!');
  except on E:Exception do
   begin
    Memo1.Lines.Insert(0,'������ ��������: ERROR - '+E.Message);
    ShowMessage('������ �� ����������!');
   end;
  end;
 finally
  if SMTP.Connected
  then SMTP.Disconnect;
 end;
end;

procedure TForm3.SMTPStatus(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
 Memo1.Lines.Insert(0,'������ ��������: '+AStatusText);
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
 if AttachmentDialog.Execute
 then ledAttachment.Text:=AttachmentDialog.FileName;
end;

end.
