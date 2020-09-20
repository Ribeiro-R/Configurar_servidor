# Instalação Kubernetes Ubuntu

Scripts para automatizar instalação do Kubernetes localmente.

Kubernetes (K8s) é um sistema de código aberto para automatizar a implantação, escalonamento e gerenciamento de aplicativos em contêineres. <https://kubernetes.io>

## Instalar kubectl e Minikube

A ferramenta de linha de comando do Kubernetes, kubectl, permite que você execute comandos em clusters do Kubernetes, enquanto o Minikube é uma ferramenta que executa um cluster Kubernetes de nó único em uma máquina virtual no seu computador pessoal. Verifique antes se a virtualização é compatível com Linux em sua máquina, pois é necessário um Hypervisor como o VirtualBox.

Clone o repositório

~~~bash
git@github.com:Ribeiro-R/Scripts.git
~~~

Em seguida, vá para a pasta e torne os script executável.

~~~bash
cd Kubernetes
$ chmod +x kubernets-install.sh
~~~

Agora é só executar:

~~~bash
sudo ./kubernets-install.sh
~~~

## Confirmar Instalação

Para confirmar a instalação bem-sucedida de um Hypervisor e do Minikube, você pode executar o seguinte comando para iniciar um cluster Kubernetes local:

~~~bash
minikube start --driver=<driver_name>
~~~

No exemplo acima utilizaremos o VirtualBox:

~~~bash
minikube start --driver=virtualbox
~~~

Para tornar o virtualbox o driver padrão:

~~~bash
minikube config set driver virtualbox
~~~

Assim que o minikube terminar, execute o comando abaixo para verificar o status do cluster:

~~~bash
minikube status
~~~

Se o cluster estiver em execução, a saída do status do minikube deve ser semelhante a:

~~~bash
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
~~~

Depois de confirmar se o Minikube está funcionando com o Hypervisor escolhido, você pode continuar usando o Minikube ou pode parar o cluster. Para interromper seu cluster, execute:

~~~bash
minikube stop
~~~

## Remover cluster local

Se você instalou o Minikube anteriormente e executou:

~~~bash
minikube start
~~~

e minikube start retornou um erro:

~~~bash
machine does not exist
~~~

então você precisa remover o cluster criado:

~~~bash
minikube delete
~~~
