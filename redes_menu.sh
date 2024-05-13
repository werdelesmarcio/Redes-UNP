#!/bin/bash

# Esta função é responsável por listar as interfaces de redes e endereços IP que estejam setados na máquina.
listar_interfaces() {
    echo "Listagem de interfaces de rede e endereços IP:"
    ip addr show
}

# Esta função serve para testar a conectividade com um host externo, no exemplo usando o google.com.
verificar_conectividade() {
    echo "Verificando conectividade com o host externo (Ex: google.com):"
    ping -c 4 google.com
}

# Função utilizada para reiniciar os serviços de rede.
reiniciar_servico() {
    echo "Reiniciando o serviço de rede..."
    sudo systemctl restart networking.service
}

# Função utiizada para configurar uma interface de rede, utilizando variáveis para preencher os campos da interface, IP e máscara de rede.
configurar_interface() {
    read -p "Digite o nome da interface de rede (ex: eth0): " interface
    read -p "Digite o endereço IP desejado: " endereco_ip
    read -p "Digite a máscara de rede (ex: 255.255.255.0): " mascara
    sudo ifconfig $interface $endereco_ip netmask $mascara
    echo "Interface $interface configurada com IP $endereco_ip e máscara $mascara."
}

# Loop para rodar o menu.
while true; do
    echo "Escolha uma opção:"
    echo "1. Listar interfaces de rede e endereços IP"
    echo "2. Verificar conectividade com um host externo"
    echo "3. Reiniciar o serviço de rede"
    echo "4. Configurar uma interface de rede"
    echo "5. Fim"
    read -p "Opção: " opcao

    case $opcao in
        1) listar_interfaces ;;
        2) verificar_conectividade ;;
        3) reiniciar_servico ;;
        4) configurar_interface ;;
        5) echo "Fim." ; break ;;
        *) echo "Opção inválida. Tente novamente." ;;
    esac
done