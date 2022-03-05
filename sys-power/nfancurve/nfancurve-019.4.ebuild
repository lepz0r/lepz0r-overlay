EAPI=8

DESCRIPTION="A small and lightweight POSIX script for using a custom fan curve in Linux for those with an Nvidia GPU. "
HOMEPAGE="https://github.com/nan0s7/nfancurve"
SRC_URI="https://github.com/nan0s7/nfancurve/archive/refs/tags/v019.4.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="x11-drivers/nvidia-drivers[tools]
sys-process/procps"
BDEPEND=""

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
