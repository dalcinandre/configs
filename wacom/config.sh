#!/usr/bin/env bash
#

[[ ! $1 ]] && {
    echo -e '\e[1;031mParametro $1 do monitor não informado\e[0m'
    exit 1
}

[[ ! $2 ]] && {
    echo -e '\e[1;031mParametro $2 da rotação da tela não informado\e[0m'
    exit 1
}

command -v xsetwacom > /dev/null && {
    for i in $(xsetwacom list | awk -F'\t' '{print $2}' | awk '{print $2}' | xargs);
    do
        xsetwacom set ${i} MapToOutput $1
        xsetwacom set ${i} Rotate $2
    done
} || echo -e '\e[1;033mAtenção não encontrado o programa xsetwacom no sistema!\e[0m'
