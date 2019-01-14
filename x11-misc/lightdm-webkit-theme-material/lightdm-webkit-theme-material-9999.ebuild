# Copyright 2019 lepz0r
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A material design LightDM Webkit greeter theme [PROJECT ABANDONED]"
HOMEPAGE="https://github.com/artur9010/lightdm-webkit-material"
EGIT_REPO_URI="https://github.com/artur9010/lightdm-webkit-material.git"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
x11-misc/lightdm-webkit-greeter"
BDEPEND=""

src_install() {
addwrite /usr/share/lightdm-webkit/themes/
mkdir /usr/share/lightdm-webkit/themes/lightdm-webkit-material
cp -r ./* /usr/share/lightdm-webkit/themes/lightdm-webkit-material
ln -s lightdm-webkit-material /usr/share/lightdm-webkit/themes/${PN}
}
