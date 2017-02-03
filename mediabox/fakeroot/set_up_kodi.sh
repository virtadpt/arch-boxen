#!/usr/bin/bash

# set_up_kodi.sh - Adds the Kodi user to a mediabox so it'll autostart.

# by: The Doctor (drwho at virtadpt dot net>)
#	PGP fingerprint: 7960 1CDC 85C9 0B63 8D9F  DD89 3BD8 FF2B 807B 17C1

# Core code.
# Checking for root.
if [[ $EUID -ne 0 ]]; then
    echo "You need to run this script as root.  Try again."
    exit 1
fi

echo "Copying config files into place."
cp X11/* /etc/X11
cp lightdm/* /etc/lightdm
cp pam.d/* /etc/pam.d

echo "Adding Kodi service account."
useradd -c "Kodi Service Account" -G \
    dbus,network,video,audio,optical,storage,users -m kodiuser

echo "Adding Kodi service groups."
groupadd -r autologin
groupadd -r nopasswdlogin

echo "Adding Kodi service account to service groups."
gpasswd -a kodiuser autologin
gpasswd -a kodiuser nopasswdlogin

echo "Enabling lightdm."
systemctl enable lightdm

# Clean up.
exit 0

# End of core code.

