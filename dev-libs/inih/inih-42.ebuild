# Copyright 2019 Lepz0r
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple .INI file parser in C, good for embedded systems "
HOMEPAGE="https://github.com/benhoyt/inih"
SRC_URI="https://github.com/benhoyt/inih/archive/r${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}-r${PV}

src_install() {
doheader ini.c
doheader ini.h
}
