#!/bin/sh

/var/packages/vault/target/bin/vault server -config "/var/packages/vault/shares/vault/etc/vault.d/vault.hcl"
