#! /bin/bash

systemctl disable codelume-minio.service
systemctl stop codelume-minio.service
rm -rf /etc/systemd/system/codelume-minio.service
rm -rf /etc/default/codelume-minio/codelume-minio.env
echo "codelume-minio service unistall successfully."

rm -rf /etc/nginx/conf.d/minio.conf
systemctl restart nginx.service
echo "nginx service restart successfully."
