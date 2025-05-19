FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

HOST_FW_LICENSE = "Proprietary"

# If first time, install https://git-lfs.com/
# Under the covers this will utilize GHE large file storage for anything
# ending in .hostfw
# 1. Update the VERSION value with the desired "Package Name" from:
#    https://rchweb.rchland.ibm.com/afs/rchland/projects/esw/fw1110.html
# 2. Download the json file from:
#    https://rchweb.rchland.ibm.com/afs/rchland/projects/esw/fw1110/Builds/$VERSION/ebmc-pkg/staging-dir/hf-elems-lid-jsons/host-fw-elements_lids.json
# 3. Download the rainier and everest tarball from:
#    https://rchweb.rchland.ibm.com/afs/rchland/projects/esw/fw1110/Builds/$VERSION/images/lab/
# 4. For each tarball, extract the image-hostfw file, rename it to
#    image-hostfw-$VERSION.hostfw, and copy it to its corresponding subdir
#    (rainier/everest).
# 5. Delete the previous host-image-$VERSION.hostfw files by using 'git rm', commit the
#    new json file (if it changed), the image-hostfw-$VERSION.hostfw files, and this
#    file.

VERSION:p10bmc ?= "1110.2519.20250502b"

SRC_URI:append:p10bmc = " file://host-fw-elements_lids.json"
SRC_URI:append:p10bmc = " file://rainier/image-hostfw-${VERSION}.hostfw"
SRC_URI:append:p10bmc = " file://everest/image-hostfw-${VERSION}.hostfw"

FILES:${PN}:append:p10bmc = " ${datadir}/hostfw/elements.json"

DEPENDS:p10bmc = "squashfs-tools-native"

S = "${WORKDIR}/sources"
UNPACKDIR = "${S}"
B = "${WORKDIR}/build"

do_compile[cleandirs] = "${B}"

do_compile:prepend:p10bmc() {
    install -d ${B}/squashfs-root-combined

    unsquashfs -d ${B}/squashfs-root-everest ${UNPACKDIR}/everest/image-hostfw-${VERSION}.hostfw
    unsquashfs -d ${B}/squashfs-root-rainier ${UNPACKDIR}/rainier/image-hostfw-${VERSION}.hostfw

    install -m 0440 ${B}/squashfs-root-everest/* ${B}/squashfs-root-combined/
    install -m 0440 ${B}/squashfs-root-rainier/* ${B}/squashfs-root-combined/

    # Create the squashfs in the ${B} directory since it gets cleaned on every
    # run, otherwise the mksquashfs command will duplicate the content.
    mksquashfs ${B}/squashfs-root-combined ${B}/image-hostfw -all-root -no-xattrs -noI
    install -m 0440 ${B}/image-hostfw ${S}/image-hostfw
}

do_compile:append:p10bmc() {
    install -m 0440 ${UNPACKDIR}/image-hostfw ${B}/image/hostfw-a
    install -m 0440 ${UNPACKDIR}/image-hostfw ${B}/image/hostfw-b
    install -m 0440 ${UNPACKDIR}/image-hostfw ${B}/update/image-hostfw
}

do_install:append:p10bmc() {
    install -d ${D}/${datadir}/hostfw
    install -m 0644 ${UNPACKDIR}/host-fw-elements_lids.json ${D}/${datadir}/hostfw/elements.json
}
