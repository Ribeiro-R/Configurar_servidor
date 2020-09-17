# Instalação Anaconda

Scripts para automatizar instalação do Anaconda.

## Instalação

Clone o repositório

~~~bash
git@github.com:Ribeiro-R/Scripts.git
~~~

Em seguida, vá para a pasta e torne os scripts executáveis.

~~~bash
cd Anaconda
$ chmod +x anaconda-install.sh create-tf-env.sh
~~~

Agora é só executar.

~~~bash
./anaconda-install.sh
~~~

## Criar Enviroment e testar

Criar um environment e verificar se a GPU foi encontrada para ser utilizada pelo tensorflow.

~~~bash
./create-tf-env.sh
~~~
