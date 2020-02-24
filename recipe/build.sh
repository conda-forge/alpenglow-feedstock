#!/bin/bash

pushd sip
mkdir -p sipgen_install
mkdir -p siph_install
mkdir -p sipdest_install
export LINK=${CC}
${PYTHON} configure.py --sip-module alpenglow.sip --sysroot=${PREFIX} --bindir sipgen_install --incdir siph_install --destdir sipdest_install
make
make install

${PYTHON} configure.py --sip-module alpenglow.sip --sysroot=${PREFIX} --no-tools
make
make install

popd
pushd alpenglow

${PYTHON} -m pip install . --no-deps -vv

popd