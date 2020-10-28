object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 241
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI Semibold'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object HostLabel: TLabel
    Left = 56
    Top = 101
    Width = 24
    Height = 13
    Caption = 'Host'
  end
  object UsernameLabel: TLabel
    Left = 56
    Top = 128
    Width = 51
    Height = 13
    Caption = 'Username'
  end
  object PasswordLabel: TLabel
    Left = 56
    Top = 155
    Width = 48
    Height = 13
    Caption = 'Password'
  end
  object LocalPathLable: TLabel
    Left = 56
    Top = 59
    Width = 51
    Height = 13
    Caption = 'Local Path'
  end
  object FTPPathLable: TLabel
    Left = 56
    Top = 32
    Width = 43
    Height = 13
    Caption = 'FTP Path'
  end
  object ConnectButton: TButton
    Left = 56
    Top = 200
    Width = 177
    Height = 25
    Caption = 'Connect/Download'
    TabOrder = 0
    OnClick = ConnectButtonClick
  end
  object HostEdit: TEdit
    Left = 112
    Top = 98
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'fibr9.jinr.ru'
  end
  object UsernameEdit: TEdit
    Left = 112
    Top = 125
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'booster'
  end
  object PasswordEdit: TEdit
    Left = 112
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'yamaha2020'
  end
  object LocalPathEdit: TEdit
    Left = 112
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'D:/FTP/'
  end
  object FTPPathEdit: TEdit
    Left = 112
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '/booster/test.txt'
  end
  object idFTP: TIdFTP
    IPVersion = Id_IPv4
    ConnectTimeout = 0
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 240
    Top = 200
  end
end
