#!/bin/sh

# Définir les variables
DOCKER_USERNAME=YOUR_USERNAME
IMAGE_NAME=cicd

# Lire le mot de passe à partir d'une variable d'environnement
if [ -z "$DOCKER_PASSWORD" ]
then
    echo "Veuillez définir le secret docker_password."
    # echo "<votre_mot_de_passe>" | docker secret create docker_password
    exit 1
fi

# Se connecter à Docker Hub
echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

# Construire l'image
docker build -t $IMAGE_NAME .

# Taguer l'image
docker tag $IMAGE_NAME:latest $DOCKER_USERNAME/$IMAGE_NAME:latest

# Pousser l'image sur Docker Hub
docker push $DOCKER_USERNAME/$IMAGE_NAME:latest

# Se déconnecter de Docker Hub
docker logout
