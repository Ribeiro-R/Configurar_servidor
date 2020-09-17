#!/bin/bash

echo -e "Criando environment \n"
# Criar environment
conda env create -f environment.yml
echo -e "Finalizado criação da environment \n"

echo -e "Ativar tf_env e testar \n"
# Ativando environment
source ~/anaconda3/etc/profile.d/conda.sh
conda activate tf_env
# Teste do environment para verificar se a GPU foi encontrada.
python3 test_tf_env.py
echo " "
echo -e "Teste finalizado \n"
echo " Environment desativado"
conda deactivate
