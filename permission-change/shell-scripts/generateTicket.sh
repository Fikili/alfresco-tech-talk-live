#!/bin/bash
OUTPUTFILE="ticket.txt";
wget -q -O $OUTPUTFILE "http://localhost:8080/alfresco/s/api/login?u=admin&pw=admin";
TICKET=$(cat $OUTPUTFILE | grep ticket | sed 's/<ticket>//' | sed 's/<\/ticket>//');
echo $TICKET > $OUTPUTFILE;