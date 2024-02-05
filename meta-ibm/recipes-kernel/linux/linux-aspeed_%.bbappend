FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI:append:ibm-ac-server = " file://witherspoon.cfg"
SRC_URI:append:ibm-enterprise = " file://ibm-enterprise.cfg"
SRC_URI:append:p10bmc = " file://0001-rainier-pass1-dts-support.patch"
