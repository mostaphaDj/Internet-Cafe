object Connexion_Module: TConnexion_Module
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 175
  Width = 309
  object IdTCPServer: TIdTCPServer
    Active = True
    Bindings = <>
    DefaultPort = 6000
    OnConnect = IdTCPServerConnect
    OnDisconnect = IdTCPServerDisconnect
    OnExecute = IdTCPServerExecute
    Left = 40
    Top = 16
  end
  object IdAntiFreeze: TIdAntiFreeze
    IdleTimeOut = 50
    OnlyWhenIdle = False
    Left = 40
    Top = 80
  end
  object IdUDPServer: TIdUDPServer
    Active = True
    Bindings = <>
    DefaultPort = 6002
    OnUDPRead = IdUDPServerUDPRead
    Left = 128
    Top = 16
  end
  object IdUDPClient: TIdUDPClient
    Active = True
    BroadcastEnabled = True
    Host = '127.0.0.1'
    Port = 6003
    Left = 232
    Top = 16
  end
end
