#!/bin/bash
/usr/local/bin/docker-compose -f /root/v1/csm/docker-compose.yml exec -T csm python manage.py sync_backy2_backup --all 
