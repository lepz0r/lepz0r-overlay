# Copyright 2019 lepz0r
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A customizable theme for web-greeter in a nostalgic but modern neon look "
HOMEPAGE="https://github.com/hertg/lightdm-neon"
SRC_URI="https://github.com/hertg/lightdm-neon/releases/download/v0.2.4/build.tar.gz"
S=${WORKDIR}/public

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="|| ( x11-misc/web-greeter x11-misc/nody-greeter x11-misc/nody-greeter-bin )"
BDEPDEND="net-libs/nodejs"

src_install() {
insinto /usr/share/web-greeter/themes/neon
doins -r assets
doins bundle.css
doins bundle.js
doins favicon.png
doins index.html
doins index.theme
}
