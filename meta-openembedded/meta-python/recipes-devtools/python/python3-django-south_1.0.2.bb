SUMMARY = "Migrations for Django"
DESCRIPTION = "South is an intelligent database migrations library for the Django web framework. It is database-independent and DVCS-friendly, as well as a whole host of other features."
HOMEPAGE = "http://south.aeracode.org/"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=17;endline=18;md5=2155d8ae21e7c23101d5febac696b27e"

SRC_URI[sha256sum] = "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b381b4fbfef7392f4"

PYPI_PACKAGE = "South"
UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"

inherit pypi setuptools3

BBCLASSEXTEND = "native nativesdk"

RDEPENDS:${PN} += "\
    python3-django \
    "
