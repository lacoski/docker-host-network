import logging

from django.http import HttpResponse
from django.shortcuts import render

LOGGER = logging.getLogger(__name__)

# Create your views here.

def index(request):
    LOGGER.info('This is demo logs!')
    return HttpResponse("Hello, world. This is demo Docker Host Network")
