### qq on docker

docker中运行深度QQ.
deepin-qq-im on docker.




docker run --name qq -e DISPLAY=IP:0 qq

docker run --name qq -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY qq
