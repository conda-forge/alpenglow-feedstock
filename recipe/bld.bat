pushd sip
if errorlevel 1 exit 1

%PYTHON% configure.py --sysroot=%PREFIX% --bindir=%LIBRARY_BIN% --sip-module alpenglow.sip
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

popd
if errorlevel 1 exit 1

pushd alpenglow
if errorlevel 1 exit 1

%PYTHON% -m pip install . --no-deps -vv

popd
if errorlevel 1 exit 1
