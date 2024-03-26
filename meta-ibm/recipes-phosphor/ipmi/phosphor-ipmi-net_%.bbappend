

ALT_RMCPP_IFACE:p10bmc = "eth1"
SYSTEMD_SERVICE:${PN}:append:p10bmc = " \
    ${PN}@${ALT_RMCPP_IFACE}.service \
    ${PN}@${ALT_RMCPP_IFACE}.socket \
    "
ALT_RMCPP_IFACE:system1 = "eth1"
SYSTEMD_SERVICE:${PN}:append:system1 = " \
    ${PN}@${ALT_RMCPP_IFACE}.service \
    ${PN}@${ALT_RMCPP_IFACE}.socket \
    "

ALT_RMCPP_IFACE:sbp1 = "eth1"
SYSTEMD_SERVICE:${PN}:append:sbp1 = " \
    ${PN}@${ALT_RMCPP_IFACE}.service \
    ${PN}@${ALT_RMCPP_IFACE}.socket \
    "
