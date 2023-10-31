# Récupération des adresses IP des VMs depuis les sorties Terraform
cd ./terraform
VmTest_public_ip=$(terraform output VmTest_public_ip  | sed 's/"//g')
VmTest_internal_ip=$(terraform output VmTest_internal_ip  | sed 's/"//g')
user=$(terraform output instance-user | sed 's/"//g')

# Génération de l'inventaire avec les adresses IP
echo "[vm-test]"
echo $VmTest_public_ip  ansible_user=$user