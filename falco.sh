sudo docker run --rm -i -t \
    --privileged \
    -v /root/.falco:/root/.falco \
    -v /proc:/host/proc:ro \
    -v /boot:/host/boot:ro \
    -v /lib/modules:/host/lib/modules \
    -v /usr:/host/usr:ro \
    -v /etc:/host/etc:ro \
    falcosecurity/falco-driver-loader:latest

sudo docker run -d --rm -i -t     -e HOST_ROOT=/     --cap-add SYS_PTRACE --pid=host $(ls /dev/falco* | xargs -I {} echo --device {})   -v /var/run/docker.sock:/var/run/docker.sock \
falcosecurity/falco-no-driver:latest
