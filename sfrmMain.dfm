object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'URL Metrics - Demo'
  ClientHeight = 756
  ClientWidth = 1105
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object memResponse: TMemo
    Left = 377
    Top = 0
    Width = 728
    Height = 756
    Align = alClient
    BorderStyle = bsNone
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    ExplicitLeft = 305
    ExplicitTop = -8
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 756
    Align = alLeft
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    ExplicitHeight = 647
    object Bevel1: TBevel
      Left = 15
      Top = 195
      Width = 346
      Height = 2
    end
    object btnGet: TButton
      Left = 286
      Top = 156
      Width = 75
      Height = 25
      Caption = '&Get Metrics'
      TabOrder = 0
      OnClick = btnGetClick
    end
    object edAccessID: TLabeledEdit
      Left = 15
      Top = 28
      Width = 346
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = 'Access ID'
      TabOrder = 1
    end
    object edSecretKey: TLabeledEdit
      Left = 15
      Top = 72
      Width = 346
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = 'Secret Key'
      TabOrder = 2
    end
    object edURL: TLabeledEdit
      Left = 15
      Top = 117
      Width = 346
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = 'URL'
      TabOrder = 3
      Text = 'moz.com'
    end
    object edTitle: TLabeledEdit
      Left = 15
      Top = 224
      Width = 346
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = 'Page Title'
      TabOrder = 4
    end
    object edLastCrawled: TLabeledEdit
      Left = 15
      Top = 272
      Width = 346
      Height = 21
      EditLabel.Width = 62
      EditLabel.Height = 13
      EditLabel.Caption = 'Last Crawled'
      TabOrder = 5
    end
    object edLinkedPages: TLabeledEdit
      Left = 15
      Top = 320
      Width = 346
      Height = 21
      EditLabel.Width = 62
      EditLabel.Height = 13
      EditLabel.Caption = 'Linked Pages'
      TabOrder = 6
    end
    object edSpamScore: TLabeledEdit
      Left = 15
      Top = 368
      Width = 346
      Height = 21
      EditLabel.Width = 56
      EditLabel.Height = 13
      EditLabel.Caption = 'Spam Score'
      TabOrder = 7
    end
  end
  object RESTClient: TRESTClient
    Authenticator = HTTPBasicAuthenticator
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://lsapi.seomoz.com/v2/url_metrics'
    ContentType = 'application/json'
    Params = <>
    Left = 895
    Top = 40
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Value = '{'#13#10'    "targets": ["moz.com"]'#13#10'}'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse
    Left = 895
    Top = 104
  end
  object RESTResponse: TRESTResponse
    ContentType = 'application/json'
    Left = 895
    Top = 168
  end
  object HTTPBasicAuthenticator: THTTPBasicAuthenticator
    Username = 'mozscape-efb3b66232'
    Password = 'c9b48e40a09c4bbfb5e9c801395fff5'
    Left = 992
    Top = 40
  end
end
