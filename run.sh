#!/bin/sh

TOP_D=$PWD
BUILD_D=${TOP_D}/build
PASST_VERSION="2023_02_22.4ddbcb9"

stacker --debug --storage-type=overlay \
	"--oci-dir=$BUILD_D/oci" "--roots-dir=$BUILD_D/roots" "--stacker-dir=$BUILD_D/stacker" \
	chroot  \
    "--substitute=PASST_VERSION=$PASST_VERSION" \
	"--stacker-file=${TOP_D}/run-machine-network.yaml"
