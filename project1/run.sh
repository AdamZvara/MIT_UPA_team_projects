#!/bin/bash

if [ ! $(which python3) ]; then
    echo "Python3 is not installed. Please install it."
    exit 1
fi

# Get URLs
python3 get_url.py > url_test.txt

# Get parameters of 10 items
head -n 10 url_test.txt | python3 get_params.py