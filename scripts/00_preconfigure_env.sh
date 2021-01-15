#!/bin/bash

#install prerequiesites

sudo apt install -y python3 python3-pip curl wget

cd ../python-api
pip3 install -r requirements.txt