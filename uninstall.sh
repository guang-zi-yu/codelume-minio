#! /bin/bash

systemctl disable codelume-minio.service
systemctl stop codelume-minio.service
rm -rf /etc/systemd/system/codelume-minio.service
echo "codelume-minio service unistall successfully."