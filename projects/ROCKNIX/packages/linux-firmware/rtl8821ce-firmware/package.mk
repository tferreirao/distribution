################################################################################
# Realtek RTL8821CE Wi-Fi + Bluetooth firmware
################################################################################

PKG_NAME="rtl8821ce-firmware"
PKG_VERSION="d39aa614dd38bd50c269590e62da6547fe623037"
PKG_LICENSE="Redistributable"
PKG_SITE="https://github.com/armbian/firmware"
PKG_URL="https://github.com/armbian/firmware/archive/${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="firmware-${PKG_VERSION}"
PKG_SHA256="36366480122308a3a193b2b2d18c6a18042254c7fe3a6b66c7e46241159aff7e"
PKG_ARCH="any"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
    # Wi-Fi firmware
    install -d ${INSTALL}/usr/lib/kernel-overlays/base/lib/firmware/rtlwifi
    for f in ${PKG_BUILD}/rtlwifi/rtl8821c* ${PKG_BUILD}/rtlwifi/rtl8821ce* ; do
        [ -f "$f" ] && install -m 0644 "$f" ${INSTALL}/usr/lib/kernel-overlays/base/lib/firmware/rtlwifi/
    done

    # Bluetooth firmware
    install -d ${INSTALL}/usr/lib/kernel-overlays/base/lib/firmware/rtl_bt
    for f in ${PKG_BUILD}/rtl_bt/rtl8821c* ; do
        [ -f "$f" ] && install -m 0644 "$f" ${INSTALL}/usr/lib/kernel-overlays/base/lib/firmware/rtl_bt/
    done
}
