apps=("'firefox.desktop'" 'thunderbird.desktop' 'org.gnome.Nautilus.desktop' 'rhythmbox.desktop' 'libreoffice-writer.desktop' 'snap-store_ubuntu-software.desktop' 'yelp.desktop' 'Zoom.desktop')

echo ${apps[*]}

echo dconf write /org/gnome/shell/favorite-apps '"['${apps[*]}']"'