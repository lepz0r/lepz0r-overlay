Installation
---
To add this repository copy this to ```/etc/portage/repos.conf/lepz0r-overlay.conf```

```
[lepz0r-overlay]
priority = 50
location = /var/db/repos/lepz0r-overlay
sync-type = git
sync-uri = https://github.com/lepz0r/lepz0r-overlay.git
auto-sync = Yes
```

Changes from original Gentoo's ebuild:
---
Patches are only applied if it's useflags are enabled

media-video/mpv: added pipewire patch from https://aur.archlinux.org/packages/mpv-pipewire \
app-misc/ranger: added sixel patch from https://aur.archlinux.org/packages/ranger-sixel
