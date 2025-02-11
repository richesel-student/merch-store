"""
WSGI config for merch_project project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'merch_project.settings')

application = get_wsgi_application()

# def application(environ, start_response):
#     status = '200 OK'
#     output = b'WSGI application is working'
#     response_headers = [('Content-Type', 'text/plain'),
#                         ('Content-Length', str(len(output)))]
#     start_response(status, response_headers)
#     return [output]