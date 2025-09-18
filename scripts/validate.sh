#!/bin/bash
# @autor: Samuel Le
# @Comment:
# @description: Script que valida si tenemos instalados: git, node, npm, curl
# Crear un script utilizando el comando command -v que verifique si he utilizado o no los paquetes git, node , npm , curl . Si alguno de dichos paquetes no esta en el sistema , mostraremos mensaje de error


if  command -v git > /dev/null 2>& ; then
echo "no está git en los paquetes"
else
$GIT_VERSION=$(git --version)
echo "Git está instalado;  versión: $GIT_VERSION"
fi

if  command -v node > /dev/null 2>& ; then
echo "no está node en los paquetes;"
else
$NODE_VERSION=$(node --version)
echo "Node está instalado;  versión: $NODE_VERSION"
fi


if  command -v npm > /dev/null 2>& ; then
echo "no está npm en los paquetes"
else
$NPM_VERSION=$(npm --version)
echo "Npm está instalado;  versión: $NPM_VERSION"
fi

if  command -v curl  > /dev/null 2>& ; then
echo "no está curl en los paquetes"
else
$CURL_VERSION=$(curl --version)
echo "CURL está instalado;  versión: $CURL_VERSION"
fi

