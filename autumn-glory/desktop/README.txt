-----------------------------------
Secondhand Mac (Autumn Glory) Notes
-----------------------------------

This MacBok runs a full, current installation of Ubuntu LTS (Long Term Support).
It is a custom installation of Ubuntu Linux tweaked to the specific needs of an
older MAcBook.  While a default Ubuntu Linux installatin runs without issue,
things like laptop battery conservation, iSight camera support and other
performance tweaks will be lost.

As a result, a cusomtized version of Repair-and-Rescue (ReaR) is provided to
ensure that, should the hard rive fail or the instllation be damaged, it is
possible to restore the MacBook to it's initial tweaked Ubuntu Linux
installation using the Rescue USB that came with it.

-------
Support
-------

https://github.com/joelgraff/secondhand-mac

Support for Secondhand Mac may be found on the GitHub repository.  Links to
relevant videos, documentation and other files (i.e. rescue disk images) may be
found there.

This MacBook uses the 'Autumn Glory' flavor of Secondhand Mac.

--------------------
Using the Rescue USB
--------------------

To use the rescue USB to recover a damaged installation (or do a clean install
on a new disk drive), insert the Rescue USB into a usb slot on the MacBook.
Then, hold down and ALT/Option key after powering on the MacBook.  This will
bring up the boot menu.  You should see a gold / whie icon labeled "EFI Boot".
Select this option to boot the Rescue USB.

It may take a very long time for the Rescue USB to boot.  Eventually a login
prompt will appear.  Enter your user name (default 'user') and press Enter.
You will be instructed to type 'rear recover' to begin the recovery /
installation process.  The process will run without intervention, though with
30-second pauses that can be manually advanced or just ignored.

Once complete, type 'reboot' and press Enter.  Remove the USB stick.  Ubuntu
should load normally.

----------------------------------
Creating / Updating the Rescue USB
----------------------------------

If the Rescue USB is lost or you wish to update the rescue USB to preserve
changes that have been made to the MacBook since purchase, use the 'Make
Reascue USB' option.

Insert a USB stick (at least 4 GB in szie) into the MacBook and then run the
Update Rescue Disk option from the Secondhand Mac utilities menu. Note that it
should be the *only* usb drive connected to the MacBook.  The USB data will be
destoryed.

-----------
Other Notes
-----------

Secondhand Mac Utilites checks for updates every time it is run.  If updates
occur, you will be instructed to quit and restart the Utilities menu.
