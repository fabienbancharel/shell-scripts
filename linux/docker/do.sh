#!/bin/bash
# Helper script for docker


build() {
echo "Type image name (ex: registry:port/myImage) without tag, followed by [ENTER]:"
read imageName

echo "Type tag name (ex: 1.0.0), followed by [ENTER]:"
read tag


docker build -t $imageName:${tag} .
[ $? != 0 ] && echo "Docker image build failed !" && exit 100

echo "After validation of the image ('TRI' for Trigram): "
echo "git add"
echo "git commit -m '[TRI] version ${tag}'"
echo "git tag ${tag}"
echo "git push origin ${tag}"
}

buildtagpush() {
echo "Type image name (ex: registry:port/myImage) (without tag), followed by [ENTER]:"
read imageName

echo "Type tag for the image (ex: 1.0.0), followed by [ENTER]:"
read tag

echo "Tag as latest ? (y / n), (if you use 'latest' as tag name : n) followed by [ENTER]:"
read tagAsLatest


docker build -t ${imageName}:${tag} .

if  [ "$tagAsLatest" == "y" ]; then
  docker tag ${imageName}:${tag} ${imageName}:latest
  docker push ${imageName}:latest
  docker tag ${imageName}:latest ${imageName}:${tag}
  docker push ${imageName}:${tag}
else 
  docker push ${imageName}:${tag}
fi

echo "After validation of the image ('TRI' for Trigram): "
echo "git add"
echo "git commit -m '[TRI] version ${tag}'"
echo "git tag ${tag}"
echo "git push origin ${tag}"
}

stop() {
echo "Type container name to stop (ex: connectetmoi-api), followed by [ENTER]:"
read name

for container_id in $(docker ps  --filter="name=$name" -q);do docker stop $container_id;done
}

remove() {
echo "Type container name to remove (ex: connectetmoi-api), followed by [ENTER]:"
read name

for container_id in $(docker ps  --filter="name=$name" -q -a);do docker rm $container_id;done
}

stopall() {
docker ps|sed "1 d"|awk '{print $1}'|xargs docker stop
}

cleanall() {
# Remove exited or dead containers
docker ps --filter status=dead \
    --filter status=exited -aq \
    | xargs -r docker rm -v

# Remove unused docker images
docker rmi $(docker images | grep "<none>"\
    | awk -F' ' '{print $3}')

# Remove orphaned docker volumes
docker volume rm \
    $(docker volume ls -qf dangling=true)
}

help() {
  echo "-----------------------------------------------------------------------"
  echo "                      Available commands                              -"
  echo "-----------------------------------------------------------------------"
  echo "   > build - To build the Docker image"
  echo "   > buildtagpush - To build, then tag and push to Docker Registry"
  echo "   > stop - To stop a container by name"
  echo "   > remove - To remove a container by name"
  echo "   > stopall - To stop all containers"
  echo "   > cleanall - To remove unused containers, images, volumes"
  echo "   > help - Display this help"
  echo -e -n ""
  echo "-----------------------------------------------------------------------"
}



# $* allo to call functions from the CLI
$*