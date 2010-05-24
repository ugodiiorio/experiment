#!/bin/bash
cd /home/notroot/git/KTE/code/setup_TW


sectors_all=("sect_1" "sect_2")
sectors_traditional=("sect_3" "sect_4")
companies=("conte" "dialogo" "directline" "genertel" "genialloyd" "linear" "quixa" "zurich_connect" "axa" "fonsai" "generali" "zurich")
traditional_companies=("axa" "fonsai" "generali" "zurich")


#function which receive a set A and a set B and perform A-B
function set_sub() {
local a=( `echo "$1"` )
local b=( `echo "$2"` )

for i in ${b[@]} ; do
	a=( ${a[@]#$i} )
	done
echo "${a[@]}" 
}

#we manage only four sectors

sectors_input=() 
while getopts s: flag 
do 
	 if ! [[ $OPTARG =~ sect_[1-4] ]]
		then
			echo " not supported sector ("$OPTARG")" 
			echo "use one or more of the following -s sect_1 -s sect_2 -s sect_3 -s sect_4"
			exit 1
		fi
	sectors_input=( "${sectors_input[@]}" "$OPTARG" ) 
done


#Intersection is calculated by making two differences: Intersection(A,B)= A - (A - B) 
if [ "$sectors_input" ]   
then 
	diff=`set_sub "\`echo ${sectors_all[@]}\`" "\`echo ${sectors_input[@]}\`"`
	result=`set_sub "\`echo ${sectors_all[@]}\`" "\`echo ${diff[@]}\`"`
	sectors_all=( ${result[@]} )

	diff=`set_sub "\`echo ${sectors_traditional[@]}\`" "\`echo ${sectors_input[@]}\`"`
	result=`set_sub "\`echo ${sectors_traditional[@]}\`" "\`echo ${diff[@]}\`"`
	sectors_traditional=( ${result[@]} )
fi

shift $(($OPTIND -1))

if [ $# -ne 0 ]   
	then 
		companies=( $* )

		#the traditional_companies are intersected with the companies inserted by the user
		#Intersection is calculated by making two following differences Intersection(A,B)= A - (A - B) 
		diff=`set_sub "\`echo ${traditional_companies[@]}\`" "$*"`
		result=`set_sub "\`echo ${traditional_companies[@]}\`" "\`echo ${diff[@]}\`"`

		traditional_companies=( ${result[@]} )
fi

if [ ${#sectors_all[*]} -ne 0 ]   
then  
	echo "@@@@@@@@@@@ Starting to load (${sectors_all[*]}) for the following companies: (${companies[*]}) @@@@@@@@@@@"
	for sector in ${sectors_all[@]}; do
		for company in ${companies[@]}; do
		./etl_2.sh "$sector" "$company"
		done
	done
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Finished  (${sectors_all[*]})... @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
fi

if [ ${#sectors_traditional[*]} -ne 0 ]   
then
	echo "@@@@@@@@@@@ Starting to load (${sectors_traditional[*]}) for the following companies: (${traditional_companies[*]}) @@@@@@@@@@@"
	for sector in ${sectors_traditional[@]}; do
		for company in ${traditional_companies[@]}; do
		./etl_2.sh "$sector" "$company"
		done
	done
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Finished  (${sectors_traditional[*]})! @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
fi
