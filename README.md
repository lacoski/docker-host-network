# Triển khai Django với Docker Host Network

## Mô tả
Triển khai Django trong Container
- Hỗ trợ mount settings
- Hỗ trợ mount log
- Hỗ trợ mount static

## Network

Phương pháp 1:
- [Multi tier với Nginx + Docker với Docker Network](/docs/docker-compose-expose.yml)

Phương pháp 2:
- [Multi tier với Nginx + Docker với Docker Host Network](/docs/docker-compose-network-host.yml)

## Tạo mới thư mục mount source code, log, static
```
sudo su
rm -rf /opt/web
mkdir -p /opt/web
mkdir -p /opt/web/log
mkdir -p /opt/web/static
mkdir -p /opt/web/settings
chown -R thanhnb:thanhnb /opt/web
```

## Run source code (Thủ công)
```
python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser
```

## Run source code (Docker - Docker compose)
```
docker-compose up -d --build
```
