#!/bin/bash

Target=$1
Timestamp=$(date +%Y%m%d_%H%M%S)
Output_Dir="sub_${TARGET}${TIMESTAMP}.txt"

echo "Target provided ${Target}"

echo "Performing subdomain enumeration......."




subfinder -d $Target > $Output_Dir
subfinder -d $Target -v >> $Output_Dir
echo "subfinder scan completed..."

amass enum -passive -d $Target >> $Output_Dir
amass enum -d $Target >> $Output_Dir
echo "amass scan completed...."

assetfinder --subs-only $Target >> $Output_Dir
echo "assetfinder scan completed...."

cat $Output_Dir | sort -u 
