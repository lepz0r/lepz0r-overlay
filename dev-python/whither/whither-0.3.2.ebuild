# Copyright 2019 lepz0r
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{4,5,6,7} )
inherit python-r1
inherit distutils-r1

DESCRIPTION="Universal Linux Application SDK - Create once. Run everywhere."
HOMEPAGE="https://github.com/Antergos/whither"
SRC_URI="https://github.com/Antergos/whither/releases/download/0.3.2/whither-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
dev-qt/qtwebengine
dev-python/PyQt5
dev-python/setuptools[${PYTHON_USEDEP}] "
DEPEND="${RDEPEND}"



#src_compile() {
#       distutils-r1_python_compile
#}

src_install(){
distutils-r1_src_install 
}
