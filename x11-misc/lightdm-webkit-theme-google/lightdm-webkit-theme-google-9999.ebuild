# Copyright 2019 lepz0r
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A Google/ChromeOS style LightDM Webkit greeter theme "
HOMEPAGE="https://github.com/omgmog/lightdm-webkit-google"
EGIT_REPO_URI="https://github.com/omgmog/lightdm-webkit-google.git"

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
mkdir /usr/share/lightdm-webkit/themes/lightdm-webkit-google
cp -r ./* /usr/share/lightdm-webkit/themes/lightdm-webkit-google
ln -s lightdm-webkit-google /usr/share/lightdm-webkit/themes/${PN}
}
