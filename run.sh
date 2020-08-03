#!/bin/bash

set -x

PROJECT_KEY="${PROJECT_KEY:-abhithakre_DotNetAPi}"
PROJECT_NAME="${PROJECT_NAME:-DotNetAPi}"
PROJECT_VERSION="${PROJECT_VERSION:-1.0}"
SONAR_HOST="${HOST:-https://sonarcloud.io/}"
SONAR_LOGIN_KEY="${LOGIN_KEY:-admin}"

mono /opt/sonar-scanner-msbuild/SonarScanner.MSBuild.exe begin /d:sonar.host.url=$SONAR_HOST /d:sonar.login=$SONAR_LOGIN_KEY /k:$PROJECT_KEY /n:"$PROJECT_NAME" /v:$PROJECT_VERSION
dotnet restore
dotnet build
dotnet test
mono /opt/sonar-scanner-msbuild/SonarScanner.MSBuild.exe end /d:sonar.login=$SONAR_LOGIN_KEY
