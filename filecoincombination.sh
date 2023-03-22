#!/bin/bash
declare -A singlets
declare -i total_flips=1000
for ((i=1; i<=$total_flips; i++))
do
    flip=$(( RANDOM % 2 ))
    if [ $flip -eq 0 ]
    then
	 singlets['heads']=$(( ${singlets['heads']} + 1 ))
    else
	 singlets['tails']=$(( ${singlets['tails']} + 1 ))
    fi
done
echo "singlet combinatin percentages:"
for key in "${!singlets[@]}"
do
	percentage=$(bc <<< "scale=2; ${singlets[$key]} / $total_flips * 100")
	echo "$key: $percentage%"
done		