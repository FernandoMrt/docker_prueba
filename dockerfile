# SO Ubuntu
FROM ubuntu

EXPOSE 4444

# Instalacion de bibliotecas y programas necesarios
RUN apt-get update && \ 
	apt-get install perl ca-certificates sudo nmap python3 python3-pip wget zip nikto net-tools gobuster git -y

# Instalacion de SSLYZE
RUN pip install --upgrade setuptools pip
RUN pip install --upgrade sslyze

# Directorio de archivos de salida
RUN mkdir resultados

# Diccionario de directorios
RUN mkdir /diccionario
RUN wget "https://raw.githubusercontent.com/digination/dirbuster-ng/master/wordlists/common.txt" -O common.txt

# Instalacion del Web-Crawler Photon
RUN git clone https://github.com/s0md3v/Photon.git
RUN pip3 install -r ./Photon/requirements.txt

# Instalacion del SCRIPT
COPY ejecucion.sh /
ENTRYPOINT [ "/ejecucion.sh" ]
