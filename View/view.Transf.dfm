object FormTransferencia: TFormTransferencia
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FormTransferencia'
  ClientHeight = 273
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 364
    Height = 273
    Align = alClient
    BevelOuter = bvNone
    Color = 16744576
    FullRepaint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 38
      Width = 93
      Height = 15
      Caption = 'Digite a chave pix'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object pnlBuscarChave: TPanel
      AlignWithMargins = True
      Left = 204
      Top = 153
      Width = 65
      Height = 25
      Cursor = crHandPoint
      BevelOuter = bvNone
      Caption = 'Ok'
      Color = 16744448
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = pnlBuscarChaveClick
    end
    object edtChavePix: TMaskEdit
      AlignWithMargins = True
      Left = 92
      Top = 59
      Width = 177
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = ''
    end
    object pnlPix: TPanel
      Left = 36
      Top = 4
      Width = 297
      Height = 266
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object Label2: TLabel
        Left = 40
        Top = 34
        Width = 216
        Height = 15
        Caption = 'Digite o valor da transa'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBtnText
        Font.Height = -17
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
      end
      object iconClose: TImage
        Left = 274
        Top = 7
        Width = 17
        Height = 17
        Cursor = crHandPoint
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          003008060000005702F987000000097048597300000B1300000B1301009A9C18
          0000055F4944415478DAD59A5F501B451CC7F77281829476B46385F1BF42EA74
          98A1B42197D4878E3EF8ACE24CACD8EA8B38636AA425ADBEEB58A752813A3076
          EA8345A9EDF8A0E38BE3134F4AFE026D9D169828235A6154EC0C24FC315CCEEF
          26B93484FB7F97803B2477D963F7BE9FFDFD76F7B77BC7100B52A8B5B50E87A7
          0586E118417802E78FE1B30BBFB7D3EBC84BE0308FCF2FC89BC03188BC612E12
          99337B6FC684E85D38B443D01154E2345287404804209FE3F41260E6CB021074
          B91EC04D0310FE1A0ADF65B4018A4092A8F302CFB2DD0783C15B2501881E3850
          91B2DBDFB0A5D3EF919C6B589D00B204900FEFBE7DFBB4231E5FB50C20EC74EE
          418B5F81F0E652089700190788176E35651A6084E3DAD0EA9F95AAD5E5298445
          7CBF0288AF0D03A0A3BE8AC30588B79755FC1D081EDFC700F1896E0074D6D771
          51B6609941FC80F8583340CE6DA8CFB39BAD3D07C0A30FBEE00E87BF5105F8D1
          ED6E60793E06F13B365B771144824DA75B9DB1D8842CC04F7BF756266B6AC26A
          A3CDEEB636B23C3D4D1647472DD1B693E348754303991B1A52662064CCCEF31C
          20529200E8B4EF40FC69A54AEADADBC9437E3F49AFAC90A9AE2EB2108D9A16DF
          D8DD4D6C959564767090FCD6DFAF067112AED4BD0100AE733FFC7E1219356AE2
          C5641662A7CB9515BF6D5B3E4F1522EB4A0E5861761D005ABF17ADFF965C39EA
          368F9C3AB5213F0371FC3859D0E94E52E2C534D3D343E62E5F56B2C247B04257
          1E800666E8E5334AB14DEDFEFD640F2AB6555599865012CF2F2D9149583971FD
          BA12008D9D1EA601A008E047EBF7A9DDB876DF3EE2E8ED256C75B534840677AA
          6D69C93684541DCBCB64F2C4094D8303208EC10AFD19004C5A11AD21B1190835
          F15310AFD58A00080380631065D6AFB1EC2D4647646A0442B18C4EF13900016E
          5FCFC07D5E82FB0C692EA9A5358B20AC162F26269D7E9181FBF4A1E9FDBA4B6B
          8410D6D694AD656004CB2741E8A516F81E1678C6580DCA230A154893E4C8453B
          2CC42F8E8D19BD3575A3EFA8057E66B28B70C34909422A655A9EBA4D2C66E6B6
          D402716A817958E01E73356987B04C3CC958E06F6A815558A0D2746D647D5C23
          2BDE82F8A90060F5FF0F60990BA9882F0584E8427158E0F17288B71C22D789CD
          0DA31E0F693C7346523C1D2A51B77C0068B2338BC3A8E1894CA9E5F313592A45
          1C7D7DF213592040162211830498C800701800974A213E1F4A343797064210BC
          CC08C7DD87D87A564F30A72A5EC235AC86C80773F407AC10C6496BA9C4970442
          108258D078C405CD9BE86CE74C89A75125751B954E69150422519F2B1A1D285C
          52FEAAB4A05712CF53F19D9D64717C5C53E3EDC0F2D4616279BA61499983E881
          153AE50A15EF48E4C5630D9B117FF5AA26F15A207E1F18207F5CBCA8047016AB
          B140C61262A6966D95FAA347C9833EDF9DD632B118A149CA9DE8E6D6CC39056F
          CEEE5A3BC4C753C51B5B6FC30A1F28DD5484D0B300D70AA12A3E0B1080F8B3E2
          CF7500F4290CD6C72164B628D551E7F592C4CD9B2471ED9A29F17908B8D3F6A6
          A6CCA6968AF851369D76CB6E2DD2B4953777D1719D1879260BB325272FB8D273
          387CB595B6D7D336DBF39E50E8DBE24BF20F3838AE03C4E7375D3BFEA0A3037E
          FFA9D4F52DFF8809F3930F43A66C43AAC63F08339E450B0C02A2B6CCE217E036
          47A4DC4617004D08F81A0171456D74B250FC28CFB2DE83C1605CED5F3547A0C3
          870ED9AB56567C98ECDE2D9535C407DD35C9E4FB4D376EFCABA58CEE570DE85E
          2A6FB39D846F7628CDDA3A852771384FC5EB7D01C4D4CB1E80388C9BBE8CA34B
          CF7A22279A8E2E2194FD02BEFE25DCE51F233A0C0314A61F3C9EDD15A9D45310
          E3C687BE6EF328C4DD5BF8BA0DCEFFC2E934CE27F009A62A2A869F1C19F9D3EC
          BDFF0374A34112067812880000000049454E44AE426082}
        Proportional = True
        OnClick = iconCloseClick
      end
      object Label3: TLabel
        Left = 15
        Top = 112
        Width = 136
        Height = 15
        Caption = 'Valor dispon'#237'vel:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBtnText
        Font.Height = -12
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 171
        Top = 112
        Width = 8
        Height = 15
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 100
        Top = 72
        Width = 13
        Height = 15
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBackground
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object pnlUpdate: TPanel
        AlignWithMargins = True
        Left = 78
        Top = 190
        Width = 145
        Height = 25
        Cursor = crHandPoint
        BevelOuter = bvNone
        Caption = 'Realizar transa'#231#227'o'
        Color = 16744448
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = pnlUpdateClick
      end
      object edtValor: TEdit
        Left = 118
        Top = 68
        Width = 99
        Height = 23
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = edtValorChange
      end
    end
  end
end
