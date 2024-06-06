HOMEPAGE = "https://github.com/openbmc/openpower-vpd-parser"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
SRC_URI += "git://github.com/baemyung/openpower-vpd-parser;branch=upstream-LanesInUse-VPD-Examples;protocol=https"
SRCREV = "95ae919cb16a68431b07435b31a1b3d48aedce3f"
DEPENDS += "\
    nlohmann-json \
    cli11 \
"
