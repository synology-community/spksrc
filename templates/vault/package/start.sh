#!/bin/sh

/var/packages/vault/target/bin/vault server -dev -dev-root-token-id root -config "/var/packages/vault/shares/vault/etc/vault.d"
