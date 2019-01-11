# Copyright 2019 Lepz0r
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="TUI (ncurses-like) display manager" 
HOMEPAGE="https://github.com/cylgom/ly"
SRC_URI="https://github.com/cylgom/ly/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-libs/pam
x11-base/xorg-server
x11-apps/xinit
x11-apps/xauth
sys-devel/gcc
dev-libs/inih"

src_prepare() {
git clone https://github.com/cylgom/termbox-next sub/termbox-next
ln -s /usr/include/ini.c sub/inih/ini.c
ln -s /usr/include/ini.h sub/inih/ini.h
eapply_user
}
