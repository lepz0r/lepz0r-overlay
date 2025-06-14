# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Roland SC-55 series emulation (J.C. Moyer's fork)"
HOMEPAGE="https://github.com/jcmoyer/Nuked-SC55"
SRC_URI="https://github.com/jcmoyer/Nuked-SC55/archive/refs/tags/${PV}.tar.gz"
S=${WORKDIR}/Nuked-SC55-${PV}

LICENSE="XMAME"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="media-libs/rtmidi
media-libs/libsdl2
"
RDEPEND="${DEPEND}
!!media-sound/nuked-sc55"
BDEPEND=""

src_configure() {
        local mycmakeargs=(-DCMAKE_BUILD_TYPE=Release -DUSE_SYSTEM_RTMIDI=1)
		cmake_src_configure
}

src_install() {
	cmake_src_install
	dolib.so ${BUILD_DIR}/libnuked-sc55-backend.so
	dolib.so ${BUILD_DIR}/libnuked-sc55-common.so
}

pkg_postinst() {
	einfo "To use compatible ROM set, copy ROM set into /usr/share/nuked-sc55"
}
