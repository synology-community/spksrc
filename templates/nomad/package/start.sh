#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

/var/packages/nomad/target/bin/nomad agent -config "/var/packages/nomad/shares/nomad/etc/nomad.d/nomad.hcl" -config "/var/packages/nomad/shares/nomad/etc/nomad.d/"
