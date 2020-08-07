#!/bin/bash
echo "Start ACL fixes";
input="4_noderef.txt";
GENERAL_DELAY=50;
sh ./generateTicket.sh;
ticket=$(cat ticket.txt);
i=0;
while IFS= read -r line
do
  echo "$line";
  $(wget -q "http://localhost:8080/alfresco/s/acl/acl-change-script?noderef=$line&alf_ticket=$ticket");
  ((i++));
  if (( $i % 5 == 0 ))
    then
      echo "Stop for $GENERAL_DELAY sec";
      sleep $GENERAL_DELAY;
  fi

  if (( $i % 200 == 0 ))
    then
      sh ./generateTicket.sh;
      $ticket=$(cat ticket.txt)
      echo "A new ticket - "$ticket;
  fi
done < "$input"
echo "Stop ACL fixes";
