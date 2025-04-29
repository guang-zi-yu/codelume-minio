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

cp ./service/codelume-minio.service /etc/systemd/system/codelume-minio.service
systemctl enable codelume-minio.service
systemctl start codelume-minio.service
echo "codelume-minio service started successfully."