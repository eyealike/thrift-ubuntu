#!/bin/bash -ex

psPlatformVersion="3.4.0"
distribution="snapshots"
upstreamVersion="0.6.1"
debianVersion="0ubuntu1"

./bootstrap.sh

dch \
	--distribution "${distribution}" \
	--newversion "${upstreamVersion}-${debianVersion}-ps${psPlatformVersion}~${BUILD_NUMBER}" \
	"Continuous integration build #${BUILD_NUMBER}"

debuild -e ANT_FLAGS -i -us -uc -b
