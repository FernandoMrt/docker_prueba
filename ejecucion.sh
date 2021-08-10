#!/bin/bash

pagina=$1
ip=$(echo $pagina | cut -d'/' -f3 | cut -d':' -f1)
ip_puerto=$(echo $pagina | cut -d'/' -f3)

echo "********************************************************************************"
echo -e "\e[1;34mEjecutando herramientas de reconocimiento"
echo -e "\e[1;33mLanzando nmap $ip"
nmap $ip -oN /salidas/salidanmap.txt
echo "********************************************************************************"
echo -e "\e[1;33mLanzando nikto -h $pagina"
nikto -h $pagina
echo "********************************************************************************"
echo -e "\e[1;33mLanzando gobuster -u $pagina -w /diccionario/common.txt"
gobuster dir -u $pagina -w /opt/diccionarios/big.txt
echo "********************************************************************************"
echo -e "\e[1;33mLanzando sslyze --regular $ip_puerto"
sslyze --regular $ip_puerto
echo "********************************************************************************"
echo -e "\e[1;33mLanzando httrack $pagina --mirror -p1C0I0t%u -o ./"
mkdir "$ip" && cd "$ip"
httrack "$pagina" --mirror -p1C0I0t%u -o ./
ls -Ral
