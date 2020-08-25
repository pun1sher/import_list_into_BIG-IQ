 awk '{print "./builder2.sh " $1" " $2" "$3}' bigip_list.txt    | sh
