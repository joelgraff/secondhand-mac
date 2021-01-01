#!/bin/bash
version=$1
flavor_file="/opt/secondhand-mac/flavor"

#if no version is defined, look for an existing version.
if [[ version=='' ]]; then

    if [[ -f $flavor_file ]]; then

        while IFS= read -r line

        do
            if [[ $line ]]; then
                version="$line"
            fi

        done < $flavor_file


    elif [[ ! -d /opt/secondhand-mac ]]; then

        sudo -A mkdir /opt/secondhand-mac

    fi
fi

tmp=$(mktemp -d)
git clone http://github.com/joelgraff/secondhand-mac $tmp

source=$tmp'/'$version'/desktop/*'

$(sudo -A cp $source /opt/secondhand-mac)

#update rear
cd /opt/secondhand-mac/rear
sudo git pull

#copy config files over
sudo cp etc/rear/local.conf /opt/secondhand-mac/rear/etc/rear/local.conf
sudo cp usr/share/rear/conf/* /opt/secondhand-mac/rear/usr/share/rear/conf
sudo cp usr/share/rear/lib/* /opt/secondhand-mac/rear/usr/share/rear/lib
sudo cp usr/share/rear/check/default/* /opt/secondhand-mac/rear/usr/share/rear/check/default