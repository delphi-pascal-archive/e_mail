object Form1: TForm1
  Left = 238
  Top = 129
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072'/'#1054#1090#1087#1088#1072#1074#1082#1072' '#1087#1086#1095#1090#1099' (POP3, IMAP)'
  ClientHeight = 719
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC7777CCCCCCC0000CCCC00000000CCCC7777CCCCCCCC
    C0000CCCCCCCCCCCCCC7777CCCCC0CCCCC0000CCCCCCCCCCCC7777CCCCC700CC
    C00CCCC0000000000CCCC77CCC77000C0000CCCC00000000CCCC7777C7770000
    00000CCCC000000CCCC777777777C000C00000CCCC0000CCCC77777C777CCC00
    CC00000CCCCCCCCCC77777CC77CCCCC0CCC000CCCCC00CCCCC777CCC7CCCCCCC
    CCCC0CCCCCCCCCCCCCC7CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC7CCC70CCC
    00CCCCCCCC0CC0CCCCCCCC77CC7700CC000CCCCCC000000CCCCCC777CC7700CC
    0000CCCC00000000CCCC7777CC7700CC0000C0CCC000000CCC7C7777CC7700CC
    0000C0CCC000000CCC7C7777CC7700CC0000CCCC00000000CCCC7777CC7700CC
    000CCCCCC000000CCCCCC777CC7700CC00CCCCCCCC0CC0CCCCCCCC77CC770CCC
    0CCCCCCCCCCCCCCCCCCCCCC7CCC7CCCCCCCC0CCCCCCCCCCCCCC7CCCCCCCCCCC0
    CCC000CCCCC00CCCCC777CCC7CCCCC00CC00000CCCCCCCCCC77777CC77CCC000
    C00000CCCC0000CCCC77777C777C000000000CCCC000000CCCC777777777000C
    0000CCCC00000000CCCC7777C77700CCC00CCCC0000000000CCCC77CCC770CCC
    CC0000CCCCCCCCCCCC7777CCCCC7CCCCC0000CCCCCCCCCCCCCC7777CCCCCCCCC
    0000CCCC00000000CCCC7777CCCCCCC0000CCCC0000000000CCCC7777CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 123
    Height = 16
    Caption = #1055#1086#1095#1090#1086#1074#1099#1077' '#1072#1076#1088#1077#1089#1072':'
  end
  object Label2: TLabel
    Left = 8
    Top = 176
    Width = 164
    Height = 16
    Caption = #1055#1086#1083#1091#1095#1077#1085#1085#1099#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1103':'
  end
  object Button2: TButton
    Left = 8
    Top = 8
    Width = 745
    Height = 25
    Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1087#1086#1095#1090#1091
    TabOrder = 0
    OnClick = Button2Click
  end
  object Memo2: TMemo
    Left = 8
    Top = 200
    Width = 745
    Height = 481
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object ListBox1: TListBox
    Left = 8
    Top = 70
    Width = 569
    Height = 91
    ItemHeight = 16
    Sorted = True
    TabOrder = 2
    OnDblClick = ListBox1DblClick
  end
  object Button3: TButton
    Left = 584
    Top = 72
    Width = 169
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1076#1088#1077#1089
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 584
    Top = 104
    Width = 169
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1072#1076#1088#1077#1089
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 584
    Top = 136
    Width = 169
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1072#1076#1088#1077#1089
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 688
    Width = 745
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077' E-mail...'
    TabOrder = 6
    OnClick = Button6Click
  end
  object IdIMAP41: TIdIMAP4
    MaxLineAction = maException
    ReadTimeout = 0
    Host = '127.0.0.1'
    Password = '1'
    RetrieveOnSelect = rsHeaders
    Username = '1@maxz'
    Left = 96
    Top = 2
  end
  object IdDecoderMIME1: TIdDecoderMIME
    FillChar = '='
    Left = 136
    Top = 2
  end
  object Timer2: TTimer
    Enabled = False
    Left = 200
    Top = 2
  end
  object IdPOP31: TIdPOP3
    MaxLineAction = maException
    ReadTimeout = 0
    Left = 56
    Top = 2
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 16
    Top = 2
  end
  object IdSMTPServer1: TIdSMTPServer
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 25
    Greeting.NumericCode = 220
    Greeting.Text.Strings = (
      'Welcome to the INDY SMTP Server')
    Greeting.TextCode = '220'
    MaxConnectionReply.NumericCode = 0
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 500
    ReplyUnknownCommand.Text.Strings = (
      'Syntax Error')
    ReplyUnknownCommand.TextCode = '500'
    AuthMode = False
    Messages.NoopReply = 'Ok'
    Messages.RSetReply = 'Ok'
    Messages.QuitReply = 'Signing Off'
    Messages.ErrorReply = 'Syntax Error - Command not understood: %s'
    Messages.XServer = 'Indy SMTP Server'
    Messages.ReceivedHeader = 'by DNSName [127.0.0.1] running Indy SMTP'
    Messages.SyntaxErrorReply = 'Syntax Error - Command not understood: %s'
    Messages.Greeting.EHLONotSupported = 'Command Not Recognised'
    Messages.Greeting.HelloReply = 'Hello %s'
    Messages.Greeting.NoHello = 'Polite people say HELO'
    Messages.Greeting.AuthFailed = 'Authentication Failed'
    Messages.Greeting.EHLOReply.Strings = (
      '250-vadim'
      '250-AUTH LOGIN'
      '250 HELP')
    Messages.RcpReplies.AddressOkReply = '%s Address Okay'
    Messages.RcpReplies.AddressErrorReply = '%s Address Error'
    Messages.RcpReplies.AddressWillForwardReply = 'User not local, Will forward'
    Messages.DataReplies.StartDataReply = 'Start mail input; end with <CRLF>.<CRLF>'
    Messages.DataReplies.EndDataReply = 'Ok'
    ReceiveMode = rmRaw
    AllowEHLO = False
    NoDecode = False
    NoEncode = False
    RawStreamType = stFileStream
    Left = 264
  end
end
