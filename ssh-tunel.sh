ssh -S /tmp/file-sock -O exit dynatrace-robot || sleep 1 && ssh -f -N -M -S /tmp/file-sock -L 1521:remedy-db-pprd-01.oss.t-mobile.pl:1521 dynatrace-robot
