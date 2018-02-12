#
# Copyright 2018 YOUR NAME
#
# All Rights Reserved.
#

name "nrpe"
maintainer "CHANGE ME"
homepage "https://CHANGE-ME.com"

# Defaults to C:/nrpe on Windows
# and /opt/nrpe on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Creates required build directories
dependency "preparation"

# nrpe dependencies/components
dependency "nrpe"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
