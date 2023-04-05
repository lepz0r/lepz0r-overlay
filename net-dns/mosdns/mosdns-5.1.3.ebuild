EAPI=8

inherit go-module

DESCRIPTION="A DNS server"
HOMEPAGE="https://github.com/IrineSistiana/mosdns"
RESTRICT="primaryuri"
LICENSE="GPL-3"
SLOT="0"
RESTRICT="network-sandbox"

DEPEND=""
BDEPEND=""

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/IrineSistiana/mosdns.git"
else
	SRC_URI="https://github.com/IrineSistiana/mosdns/archive/refs/tags/v${PV}.tar.gz"
	KEYWORDS="amd64"
fi

src_compile() {
	go build
}

src_install() {
	dobin mosdns
}
