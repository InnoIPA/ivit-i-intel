#!/bin/bash

function download(){

	if [[ ! -z $(ls model 2>/dev/null )  ]];then
		echo "$(date +"%F %T") the model folder has already exist !"
	else
		gdown --id $1 -O $2
	fi
}

# ------------------------------------------------------------------------------

echo "$(date +"%F %T") Download model from google drive ..."
ROOT=$(dirname `realpath ${0}`)
echo $ROOT
cd $ROOT

TRG_FOLDER="/workspace/model"
if [[ ! -d ${TRG_FOLDER} ]];then
	mkdir ${TRG_FOLDER}
fi

if [[ ! (${TRG_FOLDER} == *"${ROOT}"*) ]];then
	echo "$(date +"%F %T") Move terminal to $(realpath ${TRG_FOLDER})"
	cd ${TRG_FOLDER}
fi

# ------------------------------------------------------------------------------

# Model: https://drive.google.com/file/d/1Ii8GBLEdUIC8I5e1P7YbQ6oc9dqizD0z/view?usp=share_link
NAME="yolo-v3-tf"
ZIP="${NAME}.zip"
if [[ -d ${NAME} ]];then
	echo "$(date +"%F %T") Model already exist"
	exit 1
fi

GID="1Ii8GBLEdUIC8I5e1P7YbQ6oc9dqizD0z"
download $GID ${ZIP}
unzip $ZIP -d ${NAME} && rm "${ZIP}"
