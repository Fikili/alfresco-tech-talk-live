#!/bin/bash
echo 'Preparation started';
FILENAME="acl_report.txt";
ALFRESCO_HOME="/opt/alfresco-527/current";
cd $ALFRESCO_HOME;
LOG="$ALFRESCO_HOME/alfresco.log";
cat $LOG | grep "ACL Report" > $FILENAME;
cat $FILENAME | grep " | 1" > 1_level.txt;
cat $FILENAME | grep " | 2" > 2_level.txt;
cat $FILENAME | grep " | 3" > 3_level.txt;
cat $FILENAME | grep " | 4" > 4_level.txt;
cat $FILENAME | grep " | 5" > 5_level.txt;
cat $FILENAME | grep " | 6" > 6_level.txt;
cat $FILENAME | grep " | 7" > 7_level.txt;
cat $FILENAME | grep " | 8" > 8_level.txt;
cat $FILENAME | grep " | 9" > 9_level.txt;

cat 1_level.txt | cut -d '|' -f 4 | sed 's/^ //' | sed 's/ $//' | sort | uniq > 1_noderef.txt;
cat 2_level.txt | cut -d '|' -f 4 | sed 's/^ //' | sed 's/ $//' | sort | uniq > 2_noderef.txt;
cat 3_level.txt | cut -d '|' -f 4 | sed 's/^ //' | sed 's/ $//' | sort | uniq > 3_noderef.txt;
cat 4_level.txt | cut -d '|' -f 4 | sed 's/^ //' | sed 's/ $//' | sort | uniq > 4_noderef.txt;
cat 5_level.txt | cut -d '|' -f 4 | sed 's/^ //' | sed 's/ $//' | sort | uniq > 5_noderef.txt;
cat 6_level.txt | cut -d '|' -f 4 | sed 's/^ //' | sed 's/ $//' | sort | uniq > 6_noderef.txt;
cat 7_level.txt | cut -d '|' -f 4 | sed 's/^ //' | sed 's/ $//' | sort | uniq > 7_noderef.txt;
cat 8_level.txt | cut -d '|' -f 4 | sed 's/^ //' | sed 's/ $//' | sort | uniq > 8_noderef.txt;
cat 9_level.txt | cut -d '|' -f 4 | sed 's/^ //' | sed 's/ $//' | sort | uniq > 9_noderef.txt;

rm [1-9]_level.txt;

# List and remove empty files
find $ALFRESCO_HOME/[1-9]_noderef.txt -size 0 -print -delete;

echo 'Preparation completed';
