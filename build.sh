#!/bin/sh

TOP_D=$PWD
BUILD_D=${TOP_D}/build
PASST_VERSION="2023_02_22.4ddbcb9"
DOCKER_BASE="docker://"
UBUNTU_MIRROR="http://archive.ubuntu.com/ubuntu"

stacker --debug --storage-type=overlay \
	"--oci-dir=$BUILD_D/oci" "--roots-dir=$BUILD_D/roots" "--stacker-dir=$BUILD_D/stacker" \
	build "--shell-fail" \
	"--layer-type=squashfs" \
	"--layer-type=tar" \
    "--substitute=PASST_VERSION=$PASST_VERSION" \
    "--substitute=DOCKER_BASE=$DOCKER_BASE" \
    "--substitute=UBUNTU_MIRROR=$UBUNTU_MIRROR" \
	"--stacker-file=${TOP_D}/stacker.yaml"
