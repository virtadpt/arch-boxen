#!/usr/bin/bash

# set_up_kodi.sh - Adds the Kodi user to a mediabox so it'll autostart.

# by: The Doctor (drwho at virtadpt dot net>)
#	PGP fingerprint: 7960 1CDC 85C9 0B63 8D9F  DD89 3BD8 FF2B 807B 17C1

# Core code.
echo "Adding Kodi service account."
sudo useradd -c "Kodi Service Account" -G \
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

