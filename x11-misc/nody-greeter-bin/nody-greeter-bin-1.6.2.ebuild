# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="LightDM greeter that allows to create wonderful themes with web technologies. Made in Node.js"
HOMEPAGE="https://github.com/JezerM/nody-greeter"
SRC_URI="https://github.com/JezerM/nody-greeter/releases/download/1.6.2/nody-greeter-${PV}-debian.deb"
S=${WORKDIR}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /opt
	doins -r opt/nody-greeter
	fperms 755 /opt/nody-greeter/nody-greeter
	dosym /opt/nody-greeter/nody-greeter usr/bin/nody-greeter
	insinto /etc/lightdm
	doins etc/lightdm/Xgreeter
	doins etc/lightdm/web-greeter.yml
	insinto /usr/share/applications
	doins usr/share/applications/nody-greeter.desktop
	insinto /usr/share/icons/hicolor/scalable/apps/
	doins usr/share/icons/hicolor/scalable/apps/com.github.jezerm.nody-greeter.svg
	insinto /usr/share/xgreeters/
	doins usr/share/xgreeters/nody-greeter.desktop
	insinto /usr/share
	doins -r usr/share/web-greeter
}
