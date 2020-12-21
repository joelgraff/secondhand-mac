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
echo source

$(sudo -A cp $source /opt/secondhand-mac)
