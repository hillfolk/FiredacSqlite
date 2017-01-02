object fxMain: TfxMain
  Left = 0
  Top = 0
  Caption = 'fxMain'
  ClientHeight = 449
  ClientWidth = 510
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
  object RzDBGrid1: TRzDBGrid
    Left = 0
    Top = 0
    Width = 510
    Align = alTop
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AltRowShadingFixed = False
  end
  object RzMemo1: TRzMemo
    Left = 0
    Top = 229
    Width = 510
    Height = 220
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 285
  end
  object edDBPath: TRzEdit
    Left = 381
    Top = 131
    Width = 121
    Height = 21
    Text = ''
    TabOrder = 2
  end
  object btnCreate: TRzButton
    Left = 8
    Top = 131
    Caption = 'CreateDB'
    TabOrder = 3
    OnClick = btnCreateClick
  end
  object btnActiveDB: TRzButton
    Left = 8
    Top = 162
    Caption = 'ActiveDB'
    TabOrder = 4
    OnClick = btnActiveDBClick
  end
  object edID: TRzEdit
    Left = 120
    Top = 128
    Width = 121
    Height = 21
    HelpType = htKeyword
    Text = ''
    TabOrder = 5
  end
  object edAGE: TRzEdit
    Left = 120
    Top = 182
    Width = 121
    Height = 21
    Text = ''
    TabOrder = 6
  end
  object edName: TRzEdit
    Left = 120
    Top = 155
    Width = 121
    Height = 21
    Text = ''
    TabOrder = 7
  end
  object btnAddRecord: TRzButton
    Left = 280
    Top = 152
    Caption = #52628#44032
    TabOrder = 8
    OnClick = btnAddRecordClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=FDemo.sdb')
    LoginPrompt = False
    AfterConnect = FDConnection1AfterConnect
    Left = 264
    Top = 360
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
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = FDTable1
    OnDataChange = DataSource1DataChange
    Left = 200
    Top = 296
  end
end
