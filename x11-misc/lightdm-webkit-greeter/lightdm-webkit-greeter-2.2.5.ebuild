# Copyright 2019 Lepz0r
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit ninja-utils

DESCRIPTION="A modern, visually appealing greeter for LightDM"
HOMEPAGE="https://antergos.github.io/web-greeter/"
SRC_URI="https://github.com/Antergos/web-greeter/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/web-greeter-${PV}"

DEPEND="${RDEPEND}"
RDEPEND="net-libs/webkit-gtk
x11-misc/lightdm
dev-qt/qtwebengine[widgets]
dev-libs/dbus-glib
x11-libs/gtk+:3"

src_compile() {
cd build
meson --prefix=/usr --libdir=lib ..
}

src_install() {
cd build
addwrite /usr/share
addwrite /usr/lib
addwrite /usr/bin
addwrite /etc/lightdm
eninja install
}
