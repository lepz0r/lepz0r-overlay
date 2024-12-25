# Copyright 2024 Lepz0r
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit git-r3

DESCRIPTION="A modern, visually appealing greeter for LightDM."
HOMEPAGE="https://web-greeter-page.vercel.app/"
EGIT_REPO_URI="https://github.com/JezerM/web-greeter.git"
EGIT_COMMIT=${PV}
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
x11-misc/lightdm
dev-libs/gobject-introspection
dev-python/pyqt5
dev-python/pyqtwebengine
dev-python/ruamel-yaml
dev-python/pyinotify
dev-python/python-xlib
dev-qt/qtwebengine
x11-libs/libxcb
x11-libs/libX11
x11-apps/xsetroot
"

BDEPEND="dev-lang/typescript"

src_prepare() {
	eapply "${FILESDIR}"/fix-bin-webgreeter.patch
	eapply_user
}

src_compile() {
	emake -j1
}

src_install() {
	emake DESTDIR="${D}" install
}
