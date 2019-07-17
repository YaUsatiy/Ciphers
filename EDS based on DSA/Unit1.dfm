object Form1: TForm1
  Left = 385
  Top = 148
  Width = 1030
  Height = 550
  Caption = #1069#1062#1055' '#1085#1072' '#1086#1089#1085#1086#1074#1077' DSA'
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 120
    Top = 8
    Width = 769
    Height = 201
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1082#1083#1102#1095#1077#1081
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 64
      Width = 42
      Height = 13
      Caption = #1063#1080#1089#1083#1086' P'
    end
    object lbl2: TLabel
      Left = 8
      Top = 24
      Width = 41
      Height = 13
      Caption = #1063#1080#1089#1083#1086' q'
    end
    object lbl3: TLabel
      Left = 8
      Top = 104
      Width = 42
      Height = 13
      Caption = #1063#1080#1089#1083#1086' X'
    end
    object lbl4: TLabel
      Left = 8
      Top = 144
      Width = 42
      Height = 13
      Caption = #1063#1080#1089#1083#1086' K'
    end
    object lbl5: TLabel
      Left = 248
      Top = 64
      Width = 41
      Height = 13
      Caption = #1063#1080#1089#1083#1086' g'
    end
    object lbl6: TLabel
      Left = 248
      Top = 136
      Width = 40
      Height = 13
      Caption = #1063#1080#1089#1083#1086' y'
    end
    object lbl7: TLabel
      Left = 304
      Top = 56
      Width = 129
      Height = 32
      Alignment = taCenter
      AutoSize = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl8: TLabel
      Left = 304
      Top = 128
      Width = 129
      Height = 32
      Alignment = taCenter
      AutoSize = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl23: TLabel
      Left = 8
      Top = 176
      Width = 41
      Height = 13
      Caption = #1063#1080#1089#1083#1086' h'
    end
    object edt_p: TEdit
      Left = 56
      Top = 56
      Width = 129
      Height = 21
      MaxLength = 8
      TabOrder = 0
      OnKeyPress = edt_pKeyPress
    end
    object edt_q: TEdit
      Left = 56
      Top = 16
      Width = 129
      Height = 21
      MaxLength = 8
      TabOrder = 1
      OnKeyPress = edt_pKeyPress
    end
    object edt_x: TEdit
      Left = 56
      Top = 96
      Width = 129
      Height = 21
      MaxLength = 8
      TabOrder = 2
      OnKeyPress = edt_pKeyPress
    end
    object edt_k: TEdit
      Left = 56
      Top = 136
      Width = 129
      Height = 21
      MaxLength = 8
      TabOrder = 3
      OnKeyPress = edt_pKeyPress
    end
    object bt_generate: TButton
      Left = 576
      Top = 32
      Width = 153
      Height = 57
      Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1082#1083#1102#1095#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = bt_generateClick
    end
    object bt_Exit: TButton
      Left = 576
      Top = 112
      Width = 153
      Height = 57
      Caption = #1042#1099#1081#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = bt_ExitClick
    end
    object edt_h: TEdit
      Left = 56
      Top = 168
      Width = 129
      Height = 21
      MaxLength = 8
      TabOrder = 6
      OnKeyPress = edt_pKeyPress
    end
  end
  object grp2: TGroupBox
    Left = 40
    Top = 272
    Width = 425
    Height = 225
    Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1086#1076#1087#1080#1089#1080
    TabOrder = 1
    object lbl9: TLabel
      Left = 40
      Top = 48
      Width = 81
      Height = 13
      Caption = #1061#1077#1096' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
    end
    object lbl10: TLabel
      Left = 144
      Top = 40
      Width = 129
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl11: TLabel
      Left = 24
      Top = 96
      Width = 105
      Height = 13
      Caption = #1055#1072#1088#1072' '#1079#1085#1072#1095#1077#1085#1080#1081' '#1069#1062#1055':'
    end
    object lbl12: TLabel
      Left = 144
      Top = 88
      Width = 129
      Height = 32
      Alignment = taCenter
      AutoSize = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object bt1: TButton
      Left = 240
      Top = 136
      Width = 137
      Height = 57
      Caption = #1042#1099#1081#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = bt_ExitClick
    end
    object bt_Main: TButton
      Left = 80
      Top = 136
      Width = 137
      Height = 57
      Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100' '#1069#1062#1055
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = bt_MainClick
    end
  end
  object progressbar1: TProgressBar
    Left = 232
    Top = 224
    Width = 505
    Height = 33
    TabOrder = 2
  end
  object grp3: TGroupBox
    Left = 520
    Top = 272
    Width = 457
    Height = 225
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1069#1062#1055
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object lbl13: TLabel
      Left = 176
      Top = 112
      Width = 129
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl14: TLabel
      Left = 136
      Top = 120
      Width = 22
      Height = 13
      Caption = 'V  = '
    end
    object lbl15: TLabel
      Left = 8
      Top = 32
      Width = 81
      Height = 13
      Caption = #1061#1077#1096' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
    end
    object lbl16: TLabel
      Left = 96
      Top = 24
      Width = 129
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl17: TLabel
      Left = 312
      Top = 24
      Width = 129
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl18: TLabel
      Left = 312
      Top = 72
      Width = 129
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl19: TLabel
      Left = 272
      Top = 32
      Width = 23
      Height = 13
      Caption = 'U1 ='
    end
    object lbl20: TLabel
      Left = 272
      Top = 80
      Width = 23
      Height = 13
      Caption = 'U2 ='
    end
    object lbl21: TLabel
      Left = 96
      Top = 72
      Width = 129
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl22: TLabel
      Left = 40
      Top = 80
      Width = 20
      Height = 13
      Caption = 'W ='
    end
    object bt3: TButton
      Left = 16
      Top = 152
      Width = 137
      Height = 57
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1069#1062#1055
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = bt3Click
    end
    object bt2: TButton
      Left = 264
      Top = 152
      Width = 137
      Height = 57
      Caption = #1042#1099#1081#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = bt_ExitClick
    end
  end
  object dlgOpen1: TOpenDialog
    Left = 832
    Top = 208
  end
end
