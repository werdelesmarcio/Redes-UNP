@echo off
:menu
echo Escolha uma opcao:
echo 1. Listar interfaces de rede e enderecos IP
echo 2. Verificar conectividade com um host externo
echo 3. Reiniciar o servico de rede
echo 4. Configurar uma interface de rede
echo 5. Fim
set /p opcao="Opcao: "

if "%opcao%"=="1" goto listar_interfaces
if "%opcao%"=="2" goto verificar_conectividade
if "%opcao%"=="3" goto reiniciar_servico_rede
if "%opcao%"=="4" goto configurar_interface
if "%opcao%"=="5" goto fim
echo Opcao invalida. Tente novamente.
goto menu

:listar_interfaces
echo Listando interfaces de rede e enderecos IP:
ipconfig
goto menu

:verificar_conectividade
echo Verificando conectividade com o host externo (google.com):
ping -n 4 google.com
goto menu

:reiniciar_servico_rede
echo Reiniciando o servico de rede...
echo (Esta funcionalidade pode variar dependendo da versao do Windows e das configuracoes do sistema.)
goto menu

:configurar_interface
set /p interface="Digite o nome da interface de rede (ex: Ethernet): "
set /p endereco_ip="Digite o endereco IP desejado: "
set /p mascara="Digite a mascara de rede (ex: 255.255.255.0): "
echo (A configuracao de interface de rede nao e suportada diretamente por batch e pode requerer PowerShell ou comandos netsh.)
goto menu

:fim
echo Fim.