# Copyright 2024 Lepz0r, Based on Sneethe's ebuild (https://github.com/IrineSistiana/mosdns)
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Image previews for lf file manager"
HOMEPAGE="https://github.com/NikitaIvanovV/ctpv"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/NikitaIvanovV/ctpv"
	inherit git-r3
else
	SRC_URI="https://github.com/NikitaIvanovV/ctpv/archive/refs/tags/v${PV}.tar.gz"
	KEYWORDS="~amd64 ~ppc ~x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="media-gfx/imagemagick
         app-misc/lf
         dev-libs/openssl"

src_install() {
    emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install
}

pkg_postinst() {
    elog "Check homepage for optional programs to allow greater file preview support."
}
