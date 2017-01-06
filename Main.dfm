object fxMain: TfxMain
  Left = 0
  Top = 0
  Caption = 'fxMain'
  ClientHeight = 380
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnCreate: TRzButton
    Left = 8
    Top = 131
    Caption = 'CreateDB'
    TabOrder = 0
    OnClick = btnCreateClick
  end
  object btnActiveDB: TRzButton
    Left = 8
    Top = 162
    Caption = 'Create Table'
    TabOrder = 1
    OnClick = btnActiveDBClick
  end
  object DBNavigator1: TDBNavigator
    Left = 244
    Top = 126
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBMemo1: TDBMemo
    Left = 0
    Top = 227
    Width = 627
    Height = 153
    Align = alBottom
    DataField = 'Desc'
    DataSource = DataSource1
    TabOrder = 3
    ExplicitLeft = 2
    ExplicitTop = 231
    ExplicitWidth = 617
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 627
    Height = 120
    Align = alTop
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 89
    Top = 135
    Width = 121
    Height = 21
    DataField = 'ID'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit2: TDBEdit
    Left = 89
    Top = 166
    Width = 121
    Height = 21
    DataField = 'NAME'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit3: TDBEdit
    Left = 89
    Top = 193
    Width = 121
    Height = 21
    DataField = 'AGE'
    DataSource = DataSource1
    TabOrder = 7
  end
  object edDBPath: TEdit
    Left = 8
    Top = 390
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'edDBPath'
  end
  object btnTableOpen: TButton
    Left = 8
    Top = 193
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 9
    OnClick = btnTableOpenClick
  end
  object DBListBox1: TDBListBox
    Left = 506
    Top = 120
    Width = 121
    Height = 107
    Align = alRight
    DataField = 'CLASS'
    DataSource = DataSource1
    ItemHeight = 13
    Items.Strings = (
      'A'
      'B'
      'C'
      'D'
      'E')
    TabOrder = 10
    ExplicitLeft = 544
    ExplicitTop = 152
    ExplicitHeight = 97
  end
  object cbEnable: TDBCheckBox
    Left = 272
    Top = 200
    Width = 97
    Height = 17
    Caption = 'cbEnable'
    DataField = 'Enable'
    DataSource = DataSource1
    TabOrder = 11
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      
        'Database=\\Mac\Home\Documents\Embarcadero\Studio\Projects\Fireda' +
        'cSqlite\Win32\Debug\demo.sdb'
      'Password=1111'
      'Encrypt=aes-128'
      'User_Name=admin')
    LoginDialog = FDGUIxLoginDialog1
    AfterConnect = FDConnection1AfterConnect
    Left = 264
    Top = 312
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    DriverID = 'SQLite'
    VendorHome = '.\Sqlite3'
    VendorLib = '.\Sqlite3\sqlite3.dll'
    OnDriverCreated = FDPhysSQLiteDriverLink1DriverCreated
    OnDriverDestroying = FDPhysSQLiteDriverLink1DriverDestroying
    Left = 80
    Top = 320
  end
  object FDTable1: TFDTable
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'FDPERSION'
    TableName = 'FDPERSION'
    Left = 352
    Top = 312
    object FDTable1ID: TStringField
      FieldName = 'ID'
    end
    object FDTable1NAME: TStringField
      FieldName = 'NAME'
    end
    object FDTable1AGE: TIntegerField
      FieldName = 'AGE'
    end
    object FDTable1Desc: TMemoField
      FieldName = 'Desc'
      BlobType = ftMemo
    end
    object FDTable1CLASS: TStringField
      FieldName = 'CLASS'
      Size = 1
    end
    object FDTable1Enable: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'Enable'
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    OnDataChange = DataSource1DataChange
    Left = 200
    Top = 296
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 400
    Top = 520
  end
end
