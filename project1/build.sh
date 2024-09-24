#!/bin/bash

if [ ! $(which python3) ]; then
    echo "Python3 is not installed. Please install it."
    exit 1
fi

python3 -m pip install -r requirements.txt