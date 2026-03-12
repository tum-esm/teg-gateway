docker container stop thingsboard_edge_gateway
docker container prune -f
docker run -d \
 --restart unless-stopped \
 --privileged \
 -v /:/host \
 --net=host --pid=host --ipc=host \
 --name thingsboard_edge_gateway \
 --env TEG_GATEWAY_DIR=/home/pi/teg-gateway \
 --env TEG_DATA_PATH=/home/pi/teg-data \
 --env TEG_GATEWAY_GIT_PATH=/home/pi/teg-gateway/.git \
 --env TEG_CONTROLLER_LOGS_PATH=/home/pi/teg-data/controller-logs \
 --env THINGSBOARD_PROVISION_DEVICE_KEY=... \
 --env THINGSBOARD_PROVISION_DEVICE_SECRET=... \
 --env THINGSBOARD_DEVICE_NAME=$(hostname) \
 teg-gateway-runner:latest --tb-host thingsboard.esm.ei.tum.de --tb-port 8843
