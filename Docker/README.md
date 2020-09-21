# Instalação Docker Engine e Docker Compose no Ubuntu

Script para automatizar instalação do docker e docker-compose no Ubuntu

## Instalação

Clone o repositório

~~~bash
git@github.com:Ribeiro-R/Scripts.git
~~~

Em seguida, vá para a pasta e torne os script executável.

~~~bash
cd Docker
$ chmod +x docker-install.sh
~~~

Agora é só executar:

~~~bash
./docker-install.sh
~~~

## Remover Docker e o Docker Compose

Para remover Docker Engine, CLI e Containerd packages:

~~~bash
sudo apt-get purge  -yy docker-ce docker-ce-cli containerd.io
~~~

Deletar todas as images, containers e volumes:

~~~bash
sudo rm -rf /var/lib/docker
~~~

Para remover Docker Compose:

~~~bash
sudo rm -rf /usr/local/bin/docker-compose
~~~
