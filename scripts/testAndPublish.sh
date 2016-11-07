#!/bin/bash
dotnet restore
dotnet test ./webapp.unittests
dotnet publish ./webapp -o /root/publish
