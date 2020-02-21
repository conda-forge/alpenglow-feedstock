#!/bin/bash

pushd sip
export LINK=${CC}
${PYTHON} configure.py --sip-module alpenglow.sip --sysroot=${PREFIX}

make
make install

popd
pushd alpenglow

${PYTHON} -m pip install . --no-deps -vv

popd