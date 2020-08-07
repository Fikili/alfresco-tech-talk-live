#!/bin/bash
echo "Start ACL fixes";
INPUT="3_noderef.txt";
GENERAL_DELAY=0;
sh ./generateTicket.sh;
TICKET=$(cat ticket.txt);
i=0;
while IFS= read -r line
do
  echo "$line";
  $(wget -q "http://localhost:8080/alfresco/s/acl/acl-change-script?noderef=$line&alf_ticket=$TICKET");
  ((i++));
  if (( $i % 5 == 0 ))
    then
      echo "Stop for $GENERAL_DELAY sec";
      sleep $GENERAL_DELAY;
  fi

  if (( $i % 200 == 0 ))
    then
      sh ./generateTicket.sh;
      TICKET=$(cat ticket.txt);
      echo "A new ticket - "$TICKET;
  fi
done < "$INPUT"
echo "Stop ACL fixes";
