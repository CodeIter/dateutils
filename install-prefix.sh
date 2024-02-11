#!/usr/bin/env -S bash -euo pipefail

set -euo pipefail
shopt -s autocd
shopt -s globstar
shopt -s extglob
shopt -s nullglob

set -x

mkdir -vp "${PREFIX:-/usr/local}"

autoreconf -i \
&& ./configure \
    --prefix "${PREFIX:-/usr/local}"  \
    --exec-prefix "${PREFIX:-/usr/local}" \
&& make -j $(nproc) \
&& make install \
&& ls -FA --color=auto --group-directories-first \
    "${PREFIX:-/usr/local}"/**/date*

