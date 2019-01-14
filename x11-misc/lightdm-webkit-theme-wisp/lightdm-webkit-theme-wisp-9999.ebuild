# Copyright 2019 lepz0r
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="An airy theme for the lightdm webkit greeter"
HOMEPAGE="https://github.com/codehearts/lightdm-webkit-theme-wisp"
EGIT_REPO_URI="https://github.com/codehearts/lightdm-webkit-theme-wisp.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
x11-misc/lightdm-webkit-greeter"
BDEPEND=""

src_install() {
addwrite /usr/share/lightdm-webkit/themes/
mkdir /usr/share/lightdm-webkit/themes/${PN}
cp -r ./* /usr/share/lightdm-webkit/themes/${PN}
}
