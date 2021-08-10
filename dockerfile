FROM ubuntu

EXPOSE 4444

#instalacion librerias y programas necesarios:
RUN apt-get update && \ 
	apt-get install perl ca-certificates sudo nmap python3 python3-pip wget zip httrack net-tools -y

#instalacion de sslyze
RUN apt-get update
RUN pip install --upgrade setuptools pip
RUN pip install --upgrade sslyze

#direcctorio de archivos de salida
RUN mkdir salidas

#instalacion de nmap
RUN apt-get update && apt-get install nmap -y 

#creacion archivo de saldida nmap

RUN touch /salidas/salidanmap.txt

#instalacion de nikto
RUN apt-get install nikto -y

#instalacion de gobuster
RUN apt-get install gobuster

#Diccionario
RUN mkdir /diccionario
WORKDIR /diccionario
RUN wget "https://raw.githubusercontent.com/digination/dirbuster-ng/master/wordlists/common.txt"
WORKDIR /

# Instalacion del SCRIPT
#COPY ejecucion.sh /
#ENTRYPOINT [ "/ejecucion.sh" ]









