DESCRIPTION = "a graphical user interface that allows the user to \
change the default keyboard of the system"
LICENSE = "GPL-2.0-or-later"
LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
SRC_URI = "https://fedorahosted.org/releases/s/y/${BPN}/${BP}.tar.bz2"
SRC_URI[sha256sum] = "218c883e4e2bfcc82bfe07e785707b5c2ece28df772f2155fd044b9bb1614284"

inherit python3-dir gettext
DEPENDS += "intltool-native gettext-native"

EXTRA_OEMAKE = " \
    PYTHON='${STAGING_BINDIR_NATIVE}'/python-native/python \
    PYTHON_SITELIB=${PYTHON_SITEPACKAGES_DIR} \
"
do_install() {
    oe_runmake 'DESTDIR=${D}' install
}

do_install:append:class-native() {
    rm -rf ${D}/usr
}

FILES:${PN} += " \
   ${libdir}/python${PYTHON_BASEVERSION}/* \
   ${datadir}/* \
"
BBCLASSEXTEND = "native"
