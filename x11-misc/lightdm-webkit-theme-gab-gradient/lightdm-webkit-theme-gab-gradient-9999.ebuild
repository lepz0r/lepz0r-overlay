# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="LightDM-webkit Theme with modern style ! :D ~"
HOMEPAGE="https://github.com/GabrielTenma/lightdm-gab-gradient"
EGIT_REPO_URI="https://github.com/GabrielTenma/lightdm-gab-gradient.git"

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
mkdir /usr/share/lightdm-webkit/themes/lightdm-gab-gradient
cp -r ./* /usr/share/lightdm-webkit/themes/lightdm-gab-gradient/
ln -s lightdm-gab-gradient /usr/share/lightdm-webkit/themes/lightdm-webkit-theme-gab-gradient
ln -s lightdm-gab-gradient /usr/share/lightdm-webkit/themes/lightdm-weebkit-theme-gab-gradient
}
