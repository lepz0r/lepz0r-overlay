# Copyright 2019 lepz0r
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Paddy-Greeter is a greeter(read: a login screen) for use with lightdm and lightdm-webkit-greeter"
HOMEPAGE="https://github.com/kalmanolah/paddy-greeter"
EGIT_REPO_URI="https://github.com/kalmanolah/paddy-greeter.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
x11-misc/lightdm-webkit-greeter"
BDEPEND=""

src_install() {
addwrite /usr/share/lightdm-webkit/themes/
mkdir /usr/share/lightdm-webkit/themes/paddy-greeter
cp -r ./* /usr/share/lightdm-webkit/themes/paddy-greeter
ln -s paddy-greeter /usr/share/lightdm-webkit/themes/${PN}
}
