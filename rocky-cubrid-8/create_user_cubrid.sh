#!/bin/bash

while true; do
        if [ `cat /etc/passwd | grep "^cubrid:" | wc -l` != 0 ]; then
                break;
        fi

        if [ `whoami` != "root" ]; then
                break;
        fi

        useradd cubrid

	# When volume is reused
	#  -  useradd: warning: the home directory already exists.
	#   - Not copying any file from skel directory into it.
	cp -rT /etc/skel /home/cubrid
	chown -R cubrid:cubrid /home/cubrid

        echo "cubrid:password" | chpasswd
        usermod -aG wheel cubrid

        echo "root:password" | chpasswd

        break;
done
