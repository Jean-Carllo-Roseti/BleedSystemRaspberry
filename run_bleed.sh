#!/bin/bash

cd /home/avionics/Refri/BleedSystemRaspberry

# Ativa o ambiente virtual
source /home/avionics/Refri/BleedSystemRaspberry/venv/bin/activate

# Executa o script
python /home/avionics/Refri/BleedSystemRaspberry/Back-End/todos_modulos.py &

# Executa o aplicativo Processing (Front-End)
/home/avionics/Refri/BleedSystemRaspberry/Front-End/linux-aarch64/Front-End &

# Monitora as alterações nos diretórios e sincroniza automaticamente
while inotifywait -e modify,move,create,delete /home/avionics/Refri/BleedSystemRaspberry/ScrenShots/Registros/; do
    sleep 1
    rsync -avz /home/avionics/Refri/BleedSystemRaspberry/ScrenShots/Registros/ /home/avionics/Desktop/RegistrosBleed
done

read -p "Pressione Enter para continuar..." 