#Docker

##Installation de Docker :

###Installer Docker (Compatible avec Yakkety 16.10, Xenial 16.04, Trusty 14.04) :

>    sudo apt-get -y install apt-transport-https ca-certificates curl
>    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
>    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
>    sudo apt-get update
>    sudo apt-get -y install docker-ce

###Fonctionnement :

Il est possible de récupérer des paquets distants (ex : docker run docker/whalesay)
Lors de l'installation d'un container en local, il faut créer un fichier 'Dockerfile'
C'est ce fichier qui sera utilisé lors du 'docker build ...'

###Installer notre container :
>	sudo docker build -t {container_name} .

###Lancer notre container (sans fichiers partagés):
>	sudo docker run -it -p {port}:80 {container_name} /bin/bash

###Lancer notre container (avec fichiers partagés):
>	sudo docker run -it -p {port}:80 -v {host_dir}:{container_dir} {container_name} /bin/bash

###Quitter notre container (sans exit) :
>	CTRL+P - CTRL+Q

###Reprendre notre container (après un exit) :
>    	sudo docker ps -l
>    	sudo docker start {container_id}
>    	sudo docker attach {container_id}

###Commandes utiles :

* Supprimer un container : 
>    	sudo docker rm {container_id}
* Supprimer TOUS les containers en status exited : 
>    	sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm
* Supprimer une image : 
>    	sudo docker image rm {repository}:{tag}
* Forcer la fermeture d'un container (kill) : 
>    	sudo docker kill {container_id}
* Lister toutes les images : 
>    	sudo docker images
* Lister les containers : 
>    	sudo docker ps -l
* Lister tous les containers : 
>    	sudo docker ps -a
* Sauvegarder une image dans un fichier : 
>    	sudo docker save {repository}:{tag} > {name}.tar
* Charger une image à l'aide d'un fichier : 
>    	sudo docker load < {name}.tar

###Acceder au container via un nom de domaine :

Utiliser le reverse proxy de Apache (voir dossier conf)


##Installation du container PHP 5.3

# Récupérer l'image : 

>    	sudo docker run -it -p 8081:80 -v /home/$USER/projets:/var/www/projets francoismathieu/php53:version1 /bin/bash
Cette commande va :
* lancer le container à partir de l'image ''francoismathieu/php53:version1" (visible sur https://hub.docker.com/r/francoismathieu/php53/)
* connecter le port 8081 du parent au port 80 du container
* faire un lien dossier parent "/home/$USER/projets" dans le dossier "/var/www/projets" du container





