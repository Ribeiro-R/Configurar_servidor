# Instalação Cuda Toolkit 11.0

Script para automatizar instalação do cuda 11 no Ubuntu 18.04 ou 20.04.

## Instalação

Clone o repositório

~~~bash
git@github.com:Ribeiro-R/Scripts.git
~~~

Em seguida, vá para a pasta e torne os script executável.

~~~bash
cd Cuda-Toolkit-11
$ chmod +x cuda11-install.sh
~~~

Agora é só executar:

~~~bash
sudo ./cuda11-install.sh
~~~

Após a instalação devemos recarregar o arquivo .bashrc

~~~bash
source ~/.bashrc
~~~

Para verificar a versão do cuda e confirmar se a instalação ocorreu com sucesso basta digitar:

~~~bash
nvcc --version
~~~
