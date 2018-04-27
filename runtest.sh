#!/bin/bash

#filename1="$1"
#filename2="$2"
while read -a elements; 
do
    while read -a threads;
    do   
	for thread in "${threads[@]}";
        do
            for element in "${elements[@]}";
	    do
		for ((i=0;i<100;i++))
		do
	            ./cs251.ex1 "$element" "$thread" >> report.txt
		done
	    done
        done
    done < "$2"
done < "$1"
