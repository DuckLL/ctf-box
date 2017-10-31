#!/bin/bash

source ./venv/bin/activate
pip uninstall -y Flask-SocketIO
pip install Flask-SocketIO==2.9.1
deactivate
