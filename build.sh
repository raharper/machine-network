#!/bin/sh

TOP_D=$PWD
BUILD_D=${TOP_D}/build
PASST_VERSION="2023_02_22.4ddbcb9"

stacker --debug --storage-type=overlay \
	"--oci-dir=$BUILD_D/oci" "--roots-dir=$BUILD_D/roots" "--stacker-dir=$BUILD_D/stacker" \
	build "--shell-fail" \
	"--layer-type=squashfs" \
	"--layer-type=tar" \
    "--substitute=PASST_VERSION=$PASST_VERSION" \
	"--stacker-file=${TOP_D}/stacker.yaml"
