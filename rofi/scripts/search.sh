#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Search the web..."
else
    firefox "https://www.google.com/search?q=$1"
fi
