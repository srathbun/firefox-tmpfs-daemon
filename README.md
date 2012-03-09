# firefox-tmpfs-daemon

`firefox-tmpfs-daemon` in an init script for Debian based linux systems. Available from [github](http://github.com/srathbun/firefox-tmpfs-daemon). It synchronizes all ~/.mozilla directories to tmpfs at boot and stop time.

Inspired by [AUR](https://aur.archlinux.org/packages.php?ID=48746).

**Installation**

1. Download the latest version with git
2. Copy ffox-tmpfs to /etc/init.d
3. chmod 775 /etc/init.d/ffox-tmpfs
4. Copy firefox-tmpfs.conf to /etc
5. update-rc.d ffox-tmpfs defaults
6. Add a tmpfs to your fstab file ( see example )
7. Edit firefox-tmpfs.conf to point to your tmpfs, if not /tmp
8. Add cron entry to back up profile periodically ( see example )

**Example tmpfs entry**
`ramdrive      /tmp      tmpfs          size=1G             0 0`

Adjust size to be amount of ram you wish to use. Tmpfs *does not* survive powerloss! Make sure that programs do not store data there if you want it kept. Otherwise, create a new folder to use as the tmpfs, such as `/media/ramdrive`.

**Example cron entry**
`30 * * * * service ffox-tmpfs save`

Run every thirty minutes and save profile.

The default options listed in the installation are followed by the `install.sh` script, except for getting the repository. Use at your own risk!
