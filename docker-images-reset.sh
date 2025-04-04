docker stop $(docker ps -aq) 2>/dev/null
docker rm -f $(docker ps -aq) 2>/dev/null
docker rmi -f $(docker images -aq) 2>/dev/null
docker volume ls -q | xargs -r docker volume rm
docker network ls | grep -v "bridge\|host\|none" | awk 'NR>1 {print $1}' | xargs -r docker network rm


docker builder prune --all --force
docker system prune --all --volumes --force
