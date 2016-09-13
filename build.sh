#!/bin/bash

echo_title() {
    echo "-----------------------------------------------"
    echo "> $1"
    echo "-----------------------------------------------"
}

if [ ! -d .virtualenv ]; then
    echo_title "Create virtualenv"
    virtualenv -p python3.5 -q .virtualenv
else
    echo "Virtualenv already exists"
fi
source .virtualenv/bin/activate

echo_title "Install requirements"
pip install -r requirements.txt

echo_title "Generate DDBB"
python src/manage.py migrate
