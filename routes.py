"""
Routes and views for the bottle application.
"""

from bottle import route, view, static_file
from datetime import datetime
import os
import sys
from bottle import static_file


@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year
    )

@route('/contact')
@view('contact')
def contact():
    """Renders the contact page."""
    return dict(
        title='Contact',
        message='Your contact page.',
        year=datetime.now().year
    )

@route('/about')
@view('about')
def about():
    """Renders the about page."""
    return dict(
        title='About',
        message='Your application description page.',
        year=datetime.now().year
    )

@route('/static/<filepath:path>')
def server_static(filepath):
    """Handler for static files, used with the development server.
    When running under a production server such as IIS or Apache,
    the server should be configured to serve the static files."""
    PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__))
    STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static').replace('\\', '/')
    return static_file(filepath, root=STATIC_ROOT)