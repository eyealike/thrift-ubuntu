#!/bin/bash -ex

psPlatformVersion="ps3.4.0"
distribution="lucid"
upstreamVersion="0.6.1"
debianVersion="0ubuntu1"

./bootstrap.sh

dch \
	--distribution "${distribution}" \
	--force-distribution \
	--newversion "${upstreamVersion}-${debianVersion}-${psPlatformVersion}~${BUILD_NUMBER}" \
	"Continuous integration build #${BUILD_NUMBER}"

debuild -i -us -uc -b
