#!/bin/sh

if [ "$DJANGO_SETUP_PROJECT" = "true" ]
then
    python manage.py migrate
    python manage.py collectstatic --no-input --clear
    python manage.py create_user -u $DJANGO_USERNAME -e $DJANGO_EMAIL -p $DJANGO_PASSWORD
fi

exec "$@"
