#!/bin/sh
set -e

case $1 in
     worker)
	      cd worker #this is necessary for dotnet to set correct ContentRootPath
          dotnet Docker.Worker.dll
          ;;
     *)
	      cd api #this is necessary for dotnet to set correct ContentRootPath
          dotnet dockerweb.dll
          ;;
esac
