object DmConn: TDmConn
  Height = 201
  Width = 392
  object Conn: TFDConnection
    Params.Strings = (
      'Database=SistemaBanco'
      'User_Name=postgres'
      'Password=3391'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 120
    Top = 56
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 
      'C:\Users\User\Documents\Embarcadero\Studio\Projects\newStudy\Win' +
      '32\Debug'
    Left = 200
    Top = 56
  end
end
