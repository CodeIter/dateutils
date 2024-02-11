#!/usr/bin/env -S bash -euo pipefail

set -euo pipefail
shopt -s autocd
shopt -s globstar
shopt -s extglob
shopt -s nullglob

set -x

mkdir -vp ~/.cache/prefix-test

autoreconf -i \
&& ./configure \
    --prefix ~/.cache/prefix-test  \
    --exec-prefix ~/.cache/prefix-test \
&& make -j $(nproc) \
&& make install \
&& ls -FA --color=auto --group-directories-first \
    ~/.cache/prefix-test/**/date*

