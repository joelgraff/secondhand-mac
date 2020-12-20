#!/bin/bash
version=$1
flavor_file="/opt/secondhand-mac/flavor"

#if no version is defined, look for an existing version.
if [[ version=='' ]]; then
    echo 'Determining version...'
    if [[ -f $flavor_file ]]; then
        echo 'Found flavor...'
        while IFS= read -r line

        do
            if [[ $line ]]; then
                echo $line
                version="$line"
            fi

        done < $flavor_file

        echo 'version is '$version

    elif [[ ! -d /opt/secondhand-mac ]]; then

        sudo -A mkdir /opt/secondhand-mac

    fi
fi

tmp=$(mktemp -d)
git clone http://github.com/joelgraff/secondhand-mac $tmp

source=$tmp'/'$version'/desktop/*'
echo source

$(sudo -A cp $source /opt/secondhand-mac)
