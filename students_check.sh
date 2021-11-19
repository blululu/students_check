#!/bin/bash
dir=$1

model=/tmp/model.txt
now=/tmp/now.txt
temp=/tmp/temp.txt

# the ordinary files only contain name,like jane;
ls $1>$now
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
	echo "some files named wrongly or duplicated files exists"
fi



