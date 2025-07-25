docker stop custom-kms
docker rm custom-kms
docker run -d --name custom-kms \
    -t \
    -p 8080:8080 \
    -p 1688:1688 \
    -e IP=0.0.0.0 \
    -e PORT=1688 \
    -e SQLITE=true \
    -e HWID=RANDOM \
    -e LOGLEVEL=INFO \
    -e LOGFILE=/var/log/pykms_logserver.log \
    -e LOGSIZE=2 \
    -v /etc/localtime:/etc/localtime:ro \
    -v /var/log:/var/log:rw \
    --restart unless-stopped custom-kms
