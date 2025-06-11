# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2


EAPI=8

inherit cmake
inherit git-r3

DESCRIPTION="Flexbile QtQuick based desktop shell toolkit."
HOMEPAGE="https://quickshell.outfoxxed.me"
EGIT_REPO_URI=https://git.outfoxxed.me/quickshell/quickshell.git

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="X wayland sessionlock telemetry jemalloc sockets layershell screencopy pipewire mpris pam hyprland i3 svg"
REQUIRED_USE="sessionlock? ( wayland ) layershell? ( wayland ) screencopy? ( wayland )"

DEPEND="
	>=dev-qt/qtbase-6
	>=dev-qt/qtdeclarative-6
	>=dev-qt/qtsvg-6
	dev-cpp/cli11
	pam? ( sys-libs/pam )
	telemetry? ( dev-util/breakpad )
	jemalloc? ( dev-libs/jemalloc )
	wayland? ( >=dev-qt/qtwayland-6 )
	screencopy? ( x11-libs/libdrm )
	pipewire? ( media-video/pipewire )
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-qt/qtshadertools-6
	dev-util/spirv-tools
	dev-ruby/pkg-config
"

src_configure() {
		if ! use X; then
			mycmakeargs+=(-DX11=OFF)
		fi

		if ! use wayland; then
			mycmakeargs+=(-DWAYLAND=OFF)
		fi

		if ! use telemetry; then
			mycmakeargs+=(-DCRASH_REPORTER=OFF)
		fi

		if ! use jemalloc; then
			mycmakeargs+=(-DUSE_JEMALLOC=OFF)
		fi

		if ! use sockets; then
			mycmakeargs+=(-DSOCKETS=OFF)
		fi

		if ! use sessionlock; then
			mycmakeargs+=(-DWAYLAND_SESSION_LOCK=OFF)
		fi

		if ! use layershell; then
			mycmakeargs+=(-DWAYLAND_WLR_LAYERSHELL=OFF)
		fi

		if ! use screencopy; then
			mycmakeargs+=(-DSCREENCOPY=OFF)
		fi

		if ! use pipewire; then
			mycmakeargs+=(-DSERVICE_PIPEWIRE=OFF)
		fi

		if ! use mpris; then
			mycmakeargs+=(-DSERVICE_MPRIS=OFF)
		fi

		if ! use pam; then
			mycmakeargs+=(-DSERVICE_PAM=OFF)
		fi

		if ! use hyprland; then
			mycmakeargs+=(-DHYPRLAND=OFF -DHYPRLAND_GLOBAL_SHORTCUTS=OFF)
		fi

		if ! use hyprland; then
			mycmakeargs+=(-DI3=OFF)
		fi

		cmake_src_configure
}
