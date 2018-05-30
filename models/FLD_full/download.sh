#!/bin/bash

# generate link from https://sites.google.com/site/gdocs2direct/
# https://drive.google.com/uc?export=download&id=0B7EVK8r0v71pa1BTRnJSaEI3a2c - for FLD_upper.zip
# https://drive.google.com/uc?export=download&id=0B7EVK8r0v71pMmpXbDY5R3hkUFU - for FLD_lower.zip
# https://drive.google.com/uc?export=download&id=0B7EVK8r0v71pTlpsZENTRHg2ZW8 - for FLD_full.zip
# Get files from Google Drive

# $1 = file ID
# $2 = file name

URL="https://docs.google.com/uc?export=download&id=$1"

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate $URL -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=$1" -O $2 && rm -rf /tmp/cookies.txt
