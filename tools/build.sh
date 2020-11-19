#!/bin/bash -ex
export VERSION="${VERSION:-$(./setup.py --version)}"

docker build --tag "errbot:${VERSION}" .
