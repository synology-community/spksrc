#!/bin/sh

/var/packages/consul/target/bin/consul agent -config-file "/var/packages/consul/shares/consul/etc/consul.d/consul.hcl" -config-dir "/var/packages/consul/shares/consul/etc/consul.d/"