# ansible-playbook -i ops/inventories/local/hosts  ops/site.yml

read -p "Ingrese DNS asignado: " DNS

if [ "$1" = "local" ]; then
    echo "Running ansible on localhost"
    ansible-playbook -i ops/inventories/local/hosts ops/site.yml -vvv
fi

if [ "$1" = "remote" ]; then
    echo "Running ansible on remote host"
        ansible-playbook -i ops/inventories/remote/hosts --extra-vars "server_domain=$DNS"  ops/site.yml -v
fi