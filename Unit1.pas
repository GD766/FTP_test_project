unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, IdCustomTCPServer, IdTCPServer, IdCmdTCPServer, IdFTPServer;

type
  TForm1 = class(TForm)
    DownloadButton: TButton;
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
    UploadButton: TButton;
    procedure DownloadButtonClick(Sender: TObject);
    procedure UploadButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.DownloadButtonClick(Sender: TObject);
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
          ShowMessage('������ �����������: '+E.Message);
      end;
      if idFTP.Connected then
      try
        idFTP.Get(FTPPathEdit.Text, LocalPathEdit.Text, True);
      except
        on E : Exception do
          ShowMessage('������ ���������� �����: '+E.Message);
      end;
    end
  else
    try
      idFTP.Connect();
    except
      on E : Exception do
        ShowMessage('������ �����������: '+E.Message);
    end;
  if idFTP.Connected then
    try

      idFTP.Get(FTPPathEdit.Text, LocalPathEdit.Text, True);
    except
      on E : Exception do
        ShowMessage('������ ���������� �����: '+E.Message);
    end;
end;

procedure TForm1.UploadButtonClick(Sender: TObject);
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
          ShowMessage('������ �����������: '+E.Message);
      end;
      if idFTP.Connected then
      try
        idFTP.Put(FTPPathEdit.Text, LocalPathEdit.Text, True);
      except
        on E : Exception do
          ShowMessage('������ �������� �����: '+E.Message);
      end;
    end
  else
    try
      idFTP.Connect();
    except
      on E : Exception do
        ShowMessage('������ �����������: '+E.Message);
    end;
  if idFTP.Connected then
    try
      idFTP.Get(FTPPathEdit.Text, LocalPathEdit.Text, True);
    except
      on E : Exception do
        ShowMessage('������ �������� �����: '+E.Message);
    end;

  (*idFTP.Disconnect;
    idFTP.Host:=HostEdit.Text;   //FTP-������
    idFTP.Port:=21;                  //���� ��� �������
    idFTP.Username:=UsernameEdit.Text;
    idFTP.Password:=PasswordEdit.Text;
    idFTP.Connect;
    idFTP.Put(LocalPathEdit.Text, FTPPathEdit.Text, True);
    //idFTP.Put('����_�������_�����_���������_��_������');
    idFTP.Disconnect; *)

  end;
end.
