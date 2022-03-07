EAPI=8

DESCRIPTION="A small and lightweight POSIX script for using a custom fan curve in Linux for those with an Nvidia GPU. "
HOMEPAGE="https://github.com/nan0s7/nfancurve"
RESTRICT="primaryuri"
LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="x11-drivers/nvidia-drivers[tools]
sys-process/procps"
BDEPEND=""

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/nan0s7/nfancurve.git"
else
	SRC_URI="https://github.com/nan0s7/nfancurve/archive/refs/tags/v${PV}.tar.gz"
	KEYWORDS="amd64"
fi

src_install() {
mv temp.sh nfancurve
dobin nfancurve
mv nfancurve temp.sh
insinto /etc/
mv config nfancurve.conf
doins "${S}"/nfancurve.conf
mv nfancurve.conf config
systemd_douserunit "nfancurve.service"
}
