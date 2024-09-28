#!/bin/bash

URL_PROG='get_url.py'
PARAM_PROG='get_data.py'
URL_OUT='url_test.txt'

if [ ! $(which python3) ]; then
    echo "Python3 is not installed. Please install it."
    exit 1
fi

# Get URLs and store them in a file
python3 $URL_PROG > $URL_OUT

# Get parameters of 10 items from retrieved URLs
head -n 10 $URL_OUT | python3 $PARAM_PROG
