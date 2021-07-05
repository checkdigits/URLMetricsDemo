unit sfrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Client, REST.Authenticator.Basic, Vcl.StdCtrls,
  Vcl.ExtCtrls, json;

type
  TfrmMain = class(TForm)
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    HTTPBasicAuthenticator: THTTPBasicAuthenticator;
    memResponse: TMemo;
    Panel1: TPanel;
    btnGet: TButton;
    edAccessID: TLabeledEdit;
    edSecretKey: TLabeledEdit;
    edURL: TLabeledEdit;
    Bevel1: TBevel;
    edTitle: TLabeledEdit;
    edLastCrawled: TLabeledEdit;
    edLinkedPages: TLabeledEdit;
    edSpamScore: TLabeledEdit;
    procedure btnGetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnGetClick(Sender: TObject);
var
  lparam : Trestrequestparameter;
  imgProcessed: bool;
  jsonObj : TJSONObject;
  jsonResults: TJSONArray;
begin
  memResponse.Lines.Clear;
  RESTRequest.Method:=rmpost;
  imgProcessed := false;
  try
    RESTRequest.Params[0].Value := '{ '  + '"targets": ["' + edURL.Text + '"]' + ' }';
    HTTPBasicAuthenticator.Username := edAccessID.Text;
    HTTPBasicAuthenticator.Password := edSecretKey.Text;
    RESTRequest.Execute;

    if not RESTResponse.Status.Success then
      showmessage(RESTResponse.StatusText + ' ' +
        inttostr(RESTResponse.StatusCode))
    else
    begin
      memResponse.Lines.Add(RESTResponse.JSONText);
      jsonObj := RESTResponse.JSONValue as TJSONObject;
      jsonResults :=  jsonObj.Values['results'] as TJSONArray;
      jsonObj := jsonResults.Items[0] as TJSONObject;

      edTitle.Text :=  jsonObj.Values['title'].Value;
      edLastCrawled.Text := jsonObj.Values['last_crawled'].Value;
      edLinkedPages.Text := jsonObj.Values['pages_to_page'].Value;
      edSpamScore.Text := jsonObj.Values['spam_score'].Value;

    end;

  finally
  end;
end;

end.
