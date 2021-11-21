#!/bin/bash
dir=$1

model=/tmp/model.txt
now=/tmp/now.txt
temp=/tmp/temp.txt

usage(){
	echo "First edit the model.txt to fit your need!"
	echo "./students_check.sh <target-dir>"
}

# help 
case "$1" in
-h|--h|--help) usage ;;
esac

# are we streaming ? if so, then wait for inputing.
if [ $# -eq 0 ];then
	echo >&2 "awaiting your directory to iput"
	echo >&2 "usage:$0 <taget-dir>"
	read dir 
fi

# directory for input
if [ ! -d $dir ];then
	echo "Please input a directory"
	exit 1
fi

# the ordinary files only contain name,like jane;
ls $dir>$now
cp -f ./model.txt $model
Name=`cat $model`
n=0 # record the number of lacking homework's students

# Show the students' name of lacking homework
echo "-----Lacking--Students-----"
for i in $Name;do
	cat $now|grep $i>$temp

	if [ ! -s $temp ];then
		echo "$i"
		n=$(($n+1))
	fi
done
echo "total:$n"

echo "---Dumplicated--files------"
# Check for dumplicated files
for i in $Name;do
	cat $now|grep $i>$temp
	
	if [ $(cat $temp | wc -l) -ge 2 ];then
		echo "$i's file duplicates"
	fi
done

Num_theory=`cat $model|wc -l`
Num_exact=`ls -l $1|wc -l`
Num_exact=$(($Num_exact-1)) # ls -l shows one more line than needed

if [ $(($Num_exact+$n)) -ne $Num_theory ];then
	echo "---------tips---------"
	echo "some files named wrongly or duplicated files exists"
fi

rm $model $now $temp
# extra(for developer): 
# provided that:
# a : the number of dumplicated files(extra files)
# b : the number of named wrongly files
# c : the number of theroy
# d : the number of exact files
# e : the number of lacking files
# b = d - a + e - c
# You can append this bash script to give the exact number of
# named wrongly files and the exact number of extra files by
# the formula above


