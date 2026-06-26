#!/bin/bash
source config.sh
source utils.sh

for f in account/*.sh droplet/*.sh lib/*.sh menu/*.sh; do
    source $f
done

main_menu
