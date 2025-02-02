#!/bin/sh -ex

# Use venv python to extract Apycula version
PYTHON=${PWD}/apycula-prefix/bin/python

mkdir -p pypi-gowin/yowasp_nextpnr_gowin/bin/
cp nextpnr-build/nextpnr-gowin.wasm \
   pypi-gowin/yowasp_nextpnr_gowin/
mkdir -p pypi-gowin/yowasp_nextpnr_gowin/share/gowin
cp nextpnr-build/gowin/chipdb/*.bin \
   pypi-gowin/yowasp_nextpnr_gowin/share/gowin

cd pypi-gowin
rm -rf build && ${PYTHON} setup.py bdist_wheel
sha256sum dist/*.whl
