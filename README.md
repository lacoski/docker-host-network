# VD về Docker Host Network

Mô hình:
- Hỗ trợ Settings
- Hỗ trợ mount log
- Hỗ trợ mount static
- Multi tier với Nginx + Docker

```
python manage.py makemigrations
python manage.py migrate
```

```
sudo su
rm -rf /opt/web
mkdir -p /opt/web
mkdir -p /opt/web/log
mkdir -p /opt/web/static
mkdir -p /opt/web/settings
chown -R thanhnb:thanhnb /opt/web
```

```
docker-compose up -d
```
