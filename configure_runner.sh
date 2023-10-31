#!/bin/bash

# Spécifiez l'identifiant du conteneur
container_id="gitlab-runner"

# Ligne à ajouter/modifier dans le fichier config.toml
network_mode_line='network_mode = "gitlab-network"'

# Ligne à ajouter/modifier pour les volumes
volumes_line='volumes = ["/var/run/docker.sock:/var/run/docker.sock", "/cache"]'

# Modifie le fichier config.toml directement sans entrer dans un shell interactif
docker exec "$container_id" /bin/bash -c "
cd /etc/gitlab-runner
# Recherche la ligne network_mode dans le fichier
if grep -q 'network_mode' config.toml; then
    # Si la ligne existe, mettez à jour la valeur
    sed -i 's|network_mode = .*|$network_mode_line|' config.toml
else
    # Sinon, ajoutez la ligne à la fin du fichier
    echo '$network_mode_line' >> config.toml
fi
# Recherche la ligne volumes dans le fichier
if grep -q 'volumes' config.toml; then
    # Si la ligne existe, mettez à jour la valeur
    sed -i 's|volumes = .*|$volumes_line|' config.toml
else
    # Sinon, ajoutez la ligne à la fin du fichier
    echo '$volumes_line' >> config.toml
fi
"
