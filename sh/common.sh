#!/bin/sh
set -e
if [[ $# < 1 ]];then
	echo "Please enter the correct image name: >> common.sh (ubuntu|apline) [version:"12.1"]"
	exit 0
	if [[ $1 != $imagename ]];then
		echo "Please enter the correct image name: ["jobname"]"
		exit 0
	fi
fi

if [[ $# == 2 ]]; then
    export imageversion=${2}
else
	export imageversion=latest
fi

export stagename=${CI_JOB_STAGE}
export imagename=${CI_JOB_NAME}
######### Build image
build(){
	# Image url
	IMAGE="${DOCKER_SERVER}/base/$imagename:$imageversion"
	# Login docker
	echo $DOCKER_PASSWORD | docker login $DOCKER_SERVER -u $DOCKER_USERNAME --password-stdin >/dev/null 2>&1
	# image dockerfile dir
	cd base/$stagename/$imagename
	# image build
	docker build . -t "$IMAGE"

}


############规范检查
inspect(){
        if [[ ! -d base/$stagename ]];then
                echo "Please configure the correct "gitlab runner stage""
                exit 0
        fi
        if [[  $PUSH != "true" ]];then
                build
        else
                build
                docker push "$IMAGE"
        fi
}
