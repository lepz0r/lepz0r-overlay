# Installation

### eselect-repository

Run: \
`# eselect repository add lepz0r-overlay git https://github.com/lepz0r/lepz0r-overlay && emerge --sync lepz0r-overlay`

### Manual

edit `/etc/portage/repos.conf/lepz0r-overlay.conf`

```
[lepz0r-overlay]
priority = 50
location = /var/db/repos/lepz0r-overlay
sync-type = git
sync-uri = https://github.com/lepz0r/lepz0r-overlay.git
auto-sync = Yes
```
And run: \
`emerge --sync lepz0r-overlay`

# Changes from original Gentoo's ebuild:
Patches are only applied if it's useflags are enabled

### Patches from AUR
`media-video/mpv` : `mpv-pipewire` (0.34.x only, merged in 0.35) \
`app-misc/ranger` : `ranger-sixel` \
`gui-libs/wlroots` : `wlroots-nvidia`
