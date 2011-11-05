#!/bin/bash -ex

psPlatformVersion="3.4.0"
distribution="lucid"
upstreamVersion="0.6.1"
debianVersion="0ubuntu${psPlatformVersion}"

dch \
	--distribution "${distribution}" \
	--force-distribution \
	--newversion "${upstreamVersion}-${debianVersion}~${BUILD_NUMBER}" \
	"Continuous integration build #${BUILD_NUMBER}"

debuild -i -us -uc -b
