#!/bin/bash

echo "You must only run this on the 'results' folder output by AutoRecon"

echo "ENSURE YOU ARE OUTSIDE OF THE RESULTS FOLDER AND THAT THIS SCRIPT IS RUN ON THE FOLDER ITSELF"
read ensure



mkdir results/scans/basic results/scans/basic/cmd_logs results/scans/more_detail results/scans/html results/scans/images

mv "results/scans/_full*" "results/scans/basic/".
mv "results/scans/_quick*" "results/scans/basic/".
mv "results/scans/_top_20*" "results/scans/basic/".
mv "results/scans/_"* "results/scans/basic/cmd_logs/".
mv "results/scans/tcp"*.txt "results/scans/more_detail/".
mv "results/scans/"*.png "results/scans/images/".
mv "results/scans/"*.html "results/scans/html/".

for i in `'results/scans/basic/cmd_logs/'*`; do echo $i | cut -c 17- | tee filenames.txt; for name in `cat filenames.txt`; do mv $i 'results/scans/basic/cmd_logs/'$name; done; done
rm filenames.txt

for i in `'results/scans/basic/'*.txt`; do echo $i | cut -c 8- | tee filenames.txt; for name in `cat filenames.txt`; do mv $i 'results/scans/basic/'$name; done; done
rm filenames.txt
