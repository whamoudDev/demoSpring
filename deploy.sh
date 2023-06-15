#!/bin/bash

# Mettre à jour le code source
git pull

# Construire le projet avec Maven
bash mvnw package -P prod,sysadmin --settings /home/debian/.m2/settings.xml
# Si cela ne fonctionne pas  sudo bash mvnw --settings /home/debian/.m2/settings.xml package -Pprod -Psysadmin

# Construire l'image Docker
docker build --no-cache -t demospring .

# Arreter le conteneur existant
docker stop demospring

# Supprimer le conteneur existant
docker rm demospring

# Lancer un nouveau conteneur
docker run -d --net backend --ip 172.18.0.4 --name=demospring -p 8080:8080 -v uploaded_files:/upload demospring
