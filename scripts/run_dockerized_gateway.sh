docker container stop teg-gateway-runner
docker container prune -f
docker run -d \
 --restart unless-stopped \
 --privileged \
 -v /:/host \
 --net=host --pid=host --ipc=host \
 --name teg-gateway-runner \
 --env-file ../.env \
 teg-gateway-runner:latest


