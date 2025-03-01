# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools flag-o-matic
append-cxxflags -std=gnu++17

if [[ "${PV}" == *9999 ]]; then
	inherit git-r3
EGIT_REPO_URI="https://github.com/EasyRPG/liblcf.git"
else
SRC_URI="https://easyrpg.org/downloads/player/${PV}/liblcf-${PV}.tar.xz"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~riscv ~x86"
fi

DESCRIPTION="Library to handle RPG Maker 2000/2003 and EasyRPG projects "
HOMEPAGE="https://easyrpg.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/expat
        dev-libs/icu"
RDEPEND="${DEPEND}"
BDEPEND=""
