#! /bin/bash

MINIO_DOWNLOAD_URL="https://dl.min.io/server/minio/release/linux-amd64/minio"

if [ ! -f ./bin/minio ]; then
    wget -O ./bin/minio $MINIO_DOWNLOAD_URL

    if [ $? -ne 0 ]; then
        echo "get minio failed, please check your network or update download url."
        exit 1
    fi
else
    echo "MinIO is already downloaded."
fi

chmod +x ./bin/minio
echo "Executable permission successfully added to ./bin/minio"
mkdir /etc/default/codelume-minio/
cp ./service/codelume-minio.service /etc/systemd/system/codelume-minio.service
cp ./codelume-minio.env /etc/default/codelume-minio/codelume-minio.env
cp /etc/letsencrypt/live/codelume.cn/fullchain.pem ./certs/public.crt
cp /etc/letsencrypt/live/codelume.cn/privkey.pem ./certs/private.key
chmod 600 /etc/default/codelume-minio/codelume-minio.env
systemctl enable codelume-minio.service
systemctl start codelume-minio.service
echo "codelume-minio service started successfully."
