#!/bin/bash

#listrepo=$(docker images |grep -v localhost:5000 | grep crunchy )
listrepo=($(docker images |grep -v localhost:5000 | grep crunchy | awk '{ print $1 }'))
listImage=($(docker images |grep -v localhost:5000 | grep crunchy | awk '{ print $3 }'))

for i in "${!listrepo[@]}"
do
    #echo $i 
    repo=${listrepo[$i]}
    img=${listImage[$i]}
    echo docker tag $img localhost:5000/$repo
    docker tag $img localhost:5000/$repo
    echo docker push localhost:5000/$repo
    docker push localhost:5000/$repo

done
