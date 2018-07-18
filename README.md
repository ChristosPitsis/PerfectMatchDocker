# PerfectMatchDocker
Dockerize PerfectMatch and PerfectMatchHelper

# Docker Network
docker network create dockernet

# Docker build and run
cd JavaApp/
docker build -t "christos-pitsikalis:perfectmatch" .
docker run --network dockernet --name "cp-perfectmatch-java" -p 8080:8080 -t "christos-pitsikalis:perfectmatch"

cd NodeJSApp/
docker build -t "christos-pitsikalis:perfectmatchhelper" .
docker run --network dockernet --name "cp-perfectmatchhelper-nodejs" -p 8081:8081 -t "christos-pitsikalis:perfectmatchhelper"
