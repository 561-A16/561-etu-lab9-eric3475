#!/bin/bash
set -ev

docker build -t webapp:test -f dockerfile/test .
docker run -it --rm -v $HOME/cache:/root/.nuget/packages webapp:test
docker run -it --rm -v $PWD/publish:/root/publish -v $PWD/packages:/root/.nuget/packages webapp:test
docker build -t webapp:test -f dockerfile/release .

docker tag webapp:release eric3475/webapp:latest
docker login -u= $DOCKER_USERNAME -p=$DOCKER_PASSWORD
docker push eric3475/webapp:latest



#Mon Numéro de port 6518
#159.203.33.172
#compte : umatricule
#pass: utilisateur2016
