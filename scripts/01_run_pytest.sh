#!/bin/bash

SCRIPT_DIR=$(pwd)
PYTHON_APP_DIR="$SCRIPT_DIR/../python-api"

cd $PYTHON_APP_DIR

python3 -m pytest