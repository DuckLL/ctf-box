#!/bin/bash

source ./venv/bin/activate
pip uninstall -y Flask-SocketIO
pip install Flask-SoketIO==2.9.1
deactivate
