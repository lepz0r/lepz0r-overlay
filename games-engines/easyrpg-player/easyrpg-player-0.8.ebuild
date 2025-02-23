# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="RPG Maker 2000/2003 and EasyRPG games interpreter"
HOMEPAGE="https://easyrpg.org/"
SRC_URI="https://easyrpg.org/downloads/player/${PV}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+mpg123 +sndfile +vorbis +opus wildmidi +fluidsynth +fluidlite xmp native-midi +fmmidi"

DEPEND="dev-libs/liblcf
	mpg123? ( media-sound/mpg123 )
	sndfile? ( media-libs/libsndfile )
	vorbis? ( media-libs/libvorbis )
	opus? ( media-libs/opusfile )
	wildmidi? ( media-sound/wildmidi )
	fluidsynth? ( media-sound/fluidsynth )
	fluidlite? ( media-sound/fluidsynth )
	xmp? ( media-libs/libxmp )
	media-libs/libsdl2
	media-libs/sdl2-mixer
	x11-libs/pixman
	media-libs/libpng
	sys-libs/zlib
	media-libs/freetype
	media-libs/harfbuzz
	media-libs/speex"
RDEPEND="${DEPEND}"
BDEPEND=""


src_prepare() {
	eapply "${FILESDIR}"/fixstd_0.8.patch
	eapply "${FILESDIR}"/easyrpg-player-0.8-fmt-string_view-api.patch
	cmake_src_prepare
}

src_configure() {
        local mycmakeargs=(-DCMAKE_BUILD_TYPE=Release)
		if ! use opus; then
			mycmakeargs+=(-DPLAYER_WITH_OPUS=OFF)
		fi

		if ! use mpg123; then
			mycmakeargs+=(-DPLAYER_WITH_MPG123=OFF)
		fi

		if ! use vorbis; then
			mycmakeargs+=(-DPLAYER_WITH_OGGVORBIS=OFF)
		fi

		if ! use sndfile; then
			mycmakeargs+=(-DPLAYER_WITH_LIBSNDFILE=OFF)
		fi

		if ! use wildmidi; then
			mycmakeargs+=(-DPLAYER_WITH_WILDMIDI=OFF)
		fi

		if ! use fluidsynth; then
			mycmakeargs+=(-DPLAYER_WITH_FLUIDSYNTH=OFF)
		fi

		if ! use fluidlite; then
			mycmakeargs+=(-DPLAYER_WITH_FLUIDLITE=OFF)
		fi

		if ! use xmp; then
			mycmakeargs+=(-DPLAYER_WITH_XMP=OFF)
		fi

		if use native-midi; then
			mycmakeargs+=(-DPLAYER_WITH_NATIVE_MIDI=ON)
		fi

		if use fmmidi; then
			mycmakeargs+=(-DPLAYER_ENABLE_FMMIDI=ON)
		fi

		cmake_src_configure
}
