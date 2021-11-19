#!/bin/bash
dir=$1

model=/tmp/model.txt
now=/tmp/now.txt

# the ordinary files only contain name,like 邓星宇;
ls $1>$now
cp ./model.txt $model

Name=`cat $model`
n=0
for i in $Name;do
	cat $now|grep $i>/tmp/temp.txt
	if [ ! -s /tmp/temp.txt ];then
		echo "$i"
		n=$(($n+1))
	fi
done

Num_theory=`ls -l $model|wc -l`
Num_exact=`ls -l $1|wc -l`
if [ $(($Num_exact+$n)) -ne $Num_theory ];then
	echo "some files named after wrongly or  duplicated files exists"
fi


