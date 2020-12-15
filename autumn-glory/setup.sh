#!/bin/bash

#install zenity
sudo apt install zenity

scripts=(scripts/*)
IFS=" " read -r -a script_list <<< ${scripts[*]}
script_count=${#script_list[*]}
counter=100

(
for script in ${script_list[*]}
    do
        echo '# '$script
        bash ./$script > script.log
        counter=$((counter+=100))
        let pct=counter/script_count
        echo $pct
    done
)| zenity --title 'Setting up Secondhand Mac' --progress --auto-kill --auto-close