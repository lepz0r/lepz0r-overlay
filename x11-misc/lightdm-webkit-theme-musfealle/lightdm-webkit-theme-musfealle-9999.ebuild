# Copyright 2019 lepz0r
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A LightDM Webkit Greeter Theme that doesn't force you to use a mouse. "
HOMEPAGE="https://github.com/pedropenna/musfealle"
EGIT_REPO_URI="https://github.com/pedropenna/musfealle.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
x11-misc/lightdm-webkit-greeter"
BDEPEND=""

src_install() {
addwrite /usr/share/lightdm-webkit/themes/
mkdir /usr/share/lightdm-webkit/themes/musfealle
cp -r ./* /usr/share/lightdm-webkit/themes/musfealle/
ln -s musfealle /usr/share/lightdm-webkit/themes/${PN}
}
