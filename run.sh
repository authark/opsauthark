# Run Script

if [ "$1" = "local" ]; then
    echo "Running ansible on localhost"
    ansible-playbook -i ops/inventories/local/hosts ops/site.yml -vvv
fi

if [ "$1" = "remote" ]; then
    read -p "Enter Domain: " DOMAIN
    echo "Running ansible on remote host"
        ansible-playbook -i ops/inventories/remote/hosts --extra-vars \
        "server_domain=$DOMAIN"  ops/site.yml -v
fi