# Copyright 2019 lepz0r
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A beautiful and simple lockscreen for LightDM made with React"
HOMEPAGE="https://github.com/felipemarinho97/iskra-webkit-greeter"
EGIT_REPO_URI="https://github.com/felipemarinho97/iskra-webkit-greeter.git"

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
mkdir /usr/share/lightdm-webkit/themes/iskra-webkit-greeter
cp -r ./* /usr/share/lightdm-webkit/themes/iskra-webkit-greeter/
ln -s iskra-webkit-greeter /usr/share/lightdm-webkit/themes/${PN}
}
