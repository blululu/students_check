#!/bin/bash
dir=$1
homework=$2

model=/tmp/model.txt
now=/tmp/now.txt

# the ordinary files only contain id and name,like 1041180623-邓星宇;
ls $1>$now
cp ./model.txt $model
sed 's/*-//' $model
sed 's/;//' $model


ls>now.txt
diff model.txt now.txt
