#!/bin/bash

if [ ! $(which python3) ]; then
    echo "Python3 is not installed. Please install it."
    exit 1
fi

python3 get_url.py > url_test.txt