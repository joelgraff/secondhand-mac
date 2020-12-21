#!/bin/bash

if [[ -f /usr/share/applications/Zoom.desktop ]]; then
    zoom_installed=True
fi

if [[ -f shm_utils_file='/usr/share/applications/shm_utils.desktop' ]]; then
    shm_utils_installed=True
fi

echo $zoom_installed' '$shm_utils_installed