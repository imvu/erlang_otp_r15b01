#!/bin/sh -e
# /usr/lib/emacsen-common/packages/remove/erlang-otp-r15b01

FLAVOR=$1
PACKAGE=erlang-otp-r15b01

if [ ${FLAVOR} != emacs ]; then
    if test -x /usr/sbin/install-info-altdir; then
        echo remove/${PACKAGE}: removing Info links for ${FLAVOR}
        install-info-altdir --quiet --remove --dirname=${FLAVOR} /usr/share/info/erlang-otp-r15b01.info.gz
    fi

    echo remove/${PACKAGE}: purging byte-compiled files for ${FLAVOR}
    rm -rf /usr/share/${FLAVOR}/site-lisp/${PACKAGE}
fi
