from django.conf import settings
from django.contrib.auth.models import User
from django.core.management.base import BaseCommand

class Command(BaseCommand):
    help = 'Create superuser by cmd'

    def add_arguments(self, parser):
        parser.add_argument(
            '-u', '--user', type=str, nargs='?',
            const="demo", help='username', )
        parser.add_argument(
            '-p', '--password', type=str, nargs='?',
            const="demo123", help='password', )
        parser.add_argument(
            '-e', '--email', type=str, nargs='?',
            const="demo@demo.com", help='email', )
        parser.add_argument(
            '-t', '--token', type=str, nargs='?',
            const="", help='token', )

    def handle(self, *args, **kwargs):
        user = kwargs['user']
        password = kwargs['password']
        email = kwargs['email']

        if not User.objects.filter(username=user).exists():
            admin_user = User.objects.create_superuser(user, email, password)
