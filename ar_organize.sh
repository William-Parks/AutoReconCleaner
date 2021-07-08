#!/bin/bash

echo "You must only run this on the 'results' folder output by AutoRecon"

echo "ENSURE YOU ARE OUTSIDE OF THE RESULTS FOLDER AND THAT THIS SCRIPT IS RUN ON THE FOLDER ITSELF"
read ensure



mkdir basic basic/cmd_logs more_detail html images gowitness

mv _full* basic/.
mv _quick* basic/.
mv _top_20* basic/.
mv _* basic/cmd_logs/.
mv tcp*.txt more_detail/.
mv *.png images/.
mv *.html html/.

for i in basic/cmd_logs/*; do cut -c 17- | tee filenames.txt; for name in `cat filenames.txt`; do mv $i 'basic/cmd_logs/'$name; done; done
rm filenames.txt

for i in basic/*.txt; do cut -c 8- | tee filenames.txt; for name in `cat filenames.txt`; do mv $i 'basic/'$name; done; done
rm filenames.txt
