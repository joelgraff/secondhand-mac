#!/bin/bash

#fix broken
sudo apt-get install -f

#cleanup
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get -y autoremove