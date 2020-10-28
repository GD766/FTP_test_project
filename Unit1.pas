unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP;

type
  TForm1 = class(TForm)
    ConnectButton: TButton;
    idFTP: TIdFTP;
    HostEdit: TEdit;
    UsernameEdit: TEdit;
    PasswordEdit: TEdit;
    HostLabel: TLabel;
    UsernameLabel: TLabel;
    PasswordLabel: TLabel;
    LocalPathEdit: TEdit;
    LocalPathLable: TLabel;
    FTPPathLable: TLabel;
    FTPPathEdit: TEdit;
    procedure ConnectButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ConnectButtonClick(Sender: TObject);
begin
  idFTP.Username:= UsernameEdit.Text;
  idFTP.Password:= PasswordEdit.Text;
  idFTP.Host:= HostEdit.Text;
  idFTP.Passive:= True;
  if idFTP.Connected then
    begin
      idFTP.Disconnect;
      try
        idFTP.Connect();
      except
        on E : Exception do
          ShowMessage('Ошибка подключения: '+E.Message);
      end;
      if idFTP.Connected then
      try
        idFTP.Get(FTPPathEdit.Text, LocalPathEdit.Text, True);
      except
        on E : Exception do
          ShowMessage('Ошибка скачивания файла: '+E.Message);
      end;
    end
  else
    try
      idFTP.Connect();
    except
      on E : Exception do
        ShowMessage('Ошибка подключения: '+E.Message);
    end;
  if idFTP.Connected then
    try

      idFTP.Get(FTPPathEdit.Text, LocalPathEdit.Text, True);
    except
      on E : Exception do
        ShowMessage('Ошибка скачивания файла: '+E.Message);
    end;
end;

end.
