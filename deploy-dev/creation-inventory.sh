# Récupération des adresses IP des VMs depuis les sorties Terraform
cd ./terraform
VmDev_public_ip=$(terraform output VmDev_public_ip  | sed 's/"//g')
VmDev_internal_ip=$(terraform output VmDev_internal_ip  | sed 's/"//g')
user=$(terraform output instance-user | sed 's/"//g')

# Génération de l'inventaire avec les adresses IP
echo "[vm-dev]"
echo $VmDev_public_ip  ansible_user=$user