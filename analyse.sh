#!/bin/bash

num_elements=0;
while read -a elements; 
do
    for element in "${elements[@]}";
    do
	ar_elements[$num_elements]="$element"
	num_elements=$(($num_elements + 1))
#echo $num_elements
#echo ${ar_elements[2]}	
    done
done < "$2"

num_threads=0;
while read -a threads; 
do
    for thread in "${threads[@]}";
    do
	ar_threads[$num_threads]="$thread"

	num_threads=$(($num_threads + 1))
    done

done < "$3"
#echo $num_threads
count=1;
n_element=0;
n_thread=0;
rm analyse.txt
#echo "" > analyse.txt
while read -r line;
do
    a=( $line )
    echo "${ar_elements[$n_element]} ${ar_threads[$n_thread]} ${a[3]}" >> analyse.txt
    if [[ $(( $count % 100 )) == 0 ]];
    then
	n_element=$(($n_element + 1))
	if [ $n_element -eq $num_elements ];
	then 
	    n_element=0;
	fi
    fi
    if [[ $(( $count % $(($num_elements * 100)) )) == 0 ]];
    then
	n_thread=$(($n_thread + 1))
	if [ $n_thread -eq $num_threads ];
	then 
	    n_thread=0;
	fi
    fi
    #echo $nelem
    count=$(($count + 1))
done < "$1"
