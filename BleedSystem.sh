#!/bin/bash

# Inicia o programa Python
"/home/avionics/Refri/BleedSystemRaspberry/Back-End/dist/todos_modulos" &

# Inicia o programa Processing
"/home/avionics/Refri/BleedSystemRaspberry/Front-End/linux-aarch64/Front-End" &

# Monitora as alterações nos diretórios e sincroniza automaticamente
while inotifywait -e modify,move,create,delete /home/avionics/Refri/BleedSystemRaspberry/ScrenShots/Registros; do
    rsync -avz /home/avionics/Refri/BleedSystemRaspberry/ScrenShots/Registros /home/avionics/Desktop/RegistrosBleedS/
done

read -p "Pressione Enter para continuar..." 