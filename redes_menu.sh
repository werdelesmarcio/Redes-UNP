#!/bin/bash

# Listar interfaces de rede e endereços IP
echo "Listando interfaces de rede e endereços IP:"
ip addr show

# Verificar conectividade com um host externo
echo "Verificando conectividade com o host externo (google.com):"
ping -c 4 google.com

# Reiniciar o serviço de rede
echo "Reiniciando o serviço de rede..."
sudo systemctl restart networking.service

# Configurar uma interface de rede
# Substitua 'eth0' pelo nome da sua interface e '192.168.1.100' pelo endereço IP desejado
echo "Configurando a interface de rede 'eth0'..."
sudo ifconfig eth0 192.168.1.100 netmask 255.255.255.0

#!/bin/bash

# Função para listar interfaces de rede e endereços IP
listar_interfaces() {
    echo "Listando interfaces de rede e endereços IP:"
    ip addr show
}

# Função para verificar conectividade com um host externo
verificar_conectividade() {
    echo "Verificando conectividade com o host externo (google.com):"
    ping -c 4 google.com
}

# Função para reiniciar o serviço de rede
reiniciar_servico_rede() {
    echo "Reiniciando o serviço de rede..."
    sudo systemctl restart networking.service
}

# Função para configurar uma interface de rede
configurar_interface() {
    read -p "Digite o nome da interface de rede (ex: eth0): " interface
    read -p "Digite o endereço IP desejado: " endereco_ip
    read -p "Digite a máscara de rede (ex: 255.255.255.0): " mascara
    sudo ifconfig $interface $endereco_ip netmask $mascara
    echo "Interface $interface configurada com IP $endereco_ip e máscara $mascara."
}

# Loop principal do menu
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
        3) reiniciar_servico_rede ;;
        4) configurar_interface ;;
        5) echo "Fim." ; break ;;
        *) echo "Opção inválida. Tente novamente." ;;
    esac
done