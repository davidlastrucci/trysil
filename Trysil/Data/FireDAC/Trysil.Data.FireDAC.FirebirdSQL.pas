﻿(*

  Trysil
  Copyright © David Lastrucci
  All rights reserved

  Trysil - Operation ORM (World War II)
  http://codenames.info/operation/orm/

*)
unit Trysil.Data.FireDAC.FirebirdSQL;

interface

uses
  System.Classes,
  System.SysUtils,
  Data.DB,
  FireDAC.UI.Intf,
  FireDAC.Comp.UI,
  FireDAC.Phys,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB,
  FireDAC.Stan.Param,
  FireDAC.Comp.Client,

  Trysil.Data.FireDAC.ConnectionPool,
  Trysil.Data.FireDAC,
  Trysil.Data.SqlSyntax,
  Trysil.Data.SqlSyntax.FirebirdSQL;

type

{ TTFirebirdSQLDriver }

  TTFirebirdSQLDriver = class(TTFireDACDriver)
  strict private
    FDriverLink: TFDPhysFBDriverLink;
  strict protected
    function DriverLink: TFDPhysDriverLink; override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

{ TTFirebirdSQLConnection }

  TTFirebirdSQLConnection = class(TTFireDACConnection)
  strict private
    class var FDriver: TTFirebirdSQLDriver;
    class constructor ClassCreate;
    class destructor ClassDestroy;
  strict protected
    function CreateSyntaxClasses: TTSyntaxClasses; override;
    function GetDatabaseVersion: String; override;
  public
    class procedure RegisterConnection(
      const AName: String;
      const AServer: String;
      const ADatabaseName: String); overload;

    class procedure RegisterConnection(
      const AName: String;
      const AServer: String;
      const AUsername: String;
      const APassword: String;
      const ADatabaseName: String); overload;

    class procedure RegisterConnection(
      const AName: String;
      const AParameters: TStrings); overload;

    class property Driver: TTFirebirdSQLDriver read FDriver;
  end;

implementation

{ TTFirebirdSQLDriver }

constructor TTFirebirdSQLDriver.Create;
begin
  inherited Create;
  FDriverLink := TFDPhysFBDriverLink.Create(nil);
end;

destructor TTFirebirdSQLDriver.Destroy;
begin
  FDriverLink.Free;
  inherited Destroy;
end;

function TTFirebirdSQLDriver.DriverLink: TFDPhysDriverLink;
begin
  result := FDriverLink;
end;

{ TTFirebirdSQLConnection }

class constructor TTFirebirdSQLConnection.ClassCreate;
begin
  FDriver := TTFirebirdSQLDriver.Create;
end;

class destructor TTFirebirdSQLConnection.ClassDestroy;
begin
  FDriver.Free;
end;

function TTFirebirdSQLConnection.CreateSyntaxClasses: TTSyntaxClasses;
begin
  result := TTFirebirdSQLSyntaxClasses.Create;
end;

function TTFirebirdSQLConnection.GetDatabaseVersion: String;
begin
  result := Format('FirebirdSQL %s', [inherited GetDatabaseVersion]);
end;

class procedure TTFirebirdSQLConnection.RegisterConnection(
  const AName: String;
  const AServer: String;
  const ADatabaseName: String);
begin
  RegisterConnection(
    AName, AServer, String.Empty, String.Empty, ADatabaseName);
end;

class procedure TTFirebirdSQLConnection.RegisterConnection(
  const AName: String;
  const AServer: String;
  const AUsername: String;
  const APassword: String;
  const ADatabaseName: String);
var
  LParameters: TStrings;
begin
  LParameters := TStringList.Create;
  try
    LParameters.Add(Format('Server=%s', [AServer]));
    LParameters.Add(Format('Database=%s', [ADatabaseName]));
    if AUsername.IsEmpty then
        LParameters.Add('OSAuthent=Yes')
    else
    begin
        LParameters.Add(Format('User_Name=%s', [AUserName]));
        LParameters.Add(Format('Password=%s', [APassword]));
    end;
    RegisterConnection(AName, LParameters);
  finally
    LParameters.Free;
  end;
end;

class procedure TTFirebirdSQLConnection.RegisterConnection(
  const AName: String; const AParameters: TStrings);
begin
  TTFireDACConnectionPool.Instance.RegisterConnection(
    AName, 'FB', AParameters);
end;

end.
