## Installation du container PHP 

### Récupérer l'image

#### PHP 5.3
> sudo docker run -it -p 8081:80 -v /home/$USER/projets:/var/www/projets mapsred/php53 /bin/bash

#### PHP 5.6
> sudo docker run -it -p 8081:80 -v /home/$USER/projets:/var/www/projets mapsred/php56 /bin/bash

#### PHP 7.1
> sudo docker run -it -p 8081:80 -v /home/$USER/projets:/var/www/projets mapsred/php71 /bin/bash

Cette commande va :
* lancer le container à partir de l'image ''francoismathieu/php53" (visible sur https://hub.docker.com/r/francoismathieu/php53/)
* connecter le port 8081 du parent au port 80 du container
* faire un lien dossier parent "/home/$USER/projets" dans le dossier "/var/www/projets" du container


