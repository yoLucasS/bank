object FormCadPix: TFormCadPix
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FormCadPix'
  ClientHeight = 232
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 274
    Height = 232
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
    object edtChavePix: TLabeledEdit
      Left = 33
      Top = 72
      Width = 208
      Height = 23
      EditLabel.Width = 115
      EditLabel.Height = 15
      EditLabel.Caption = 'Digite sua nova chave'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBackground
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = ''
    end
    object pnlNewChave: TPanel
      Left = 152
      Top = 149
      Width = 89
      Height = 25
      Cursor = crHandPoint
      BevelOuter = bvNone
      Caption = 'Salvar'
      Color = 16744448
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = pnlNewChaveClick
    end
  end
end
