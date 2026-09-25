# CHANGELOG

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

_n/a_

## [0.2.0] - 2026-09-25

### Added

* `scp-vm`:
    * Supports secure copying of files to or from vmm(4) virtual machines
        (VMs) via scp(1) by referencing a VM name or numerical ID (as shown in
        vmctl(8)) in either the 'source' or 'target' path arguments 
    * Supports optional username specified as `[user@]virtualmachine`
* `libsshvm`:
    * An sh(1) source file containing functions utilized by both `ssh-vm` and
        `scp-vm`, including:
        * Existing `_fatal()`, `_vm_subnet_for_id()`, `_vm_ip_for_id()`, and
            `_ping_vm_for_id()` functions split out from `ssh-vm`
        * New `_vm_id_for_name()` and `_is_vm_running()` functions

### Updated

* `ssh-vm`:
    * Split `_fatal()`, `_vm_subnet_for_id()`, `_vm_ip_for_id()`, and
        `_ping_vm_for_id()` functions out into new `libsshvm` source file
    * Minor refactor to utilize new `_vm_id_for_name()` and `_is_vm_running()`
        functions from `libsshvm` source file
* `Makefile`:
    * Updated `install` & `uninstall` targets to support new `lib/libsshvm`
        and `bin/scp-vm` files
    * Updated `install` target to patch the installed copies of `ssh-vm` and
        `scp-vm`, rewriting the local `libsshvm` source file path to the
        installed absolute path

## [0.1.0] - 2026-07-09

### Added

* `ssh-vm`:
    * Supports connecting to vmm(4) virtual machines (VMs) over ssh(1) by
        either name or numerical ID (as shown in vmctl(8))
    * Supports optional username specified as `[user@]virtualmachine`

[unreleased]: https://github.com/morgant/ssh-vm-openbsd/compare/0.2...main
[0.2.0]: https://github.com/morgant/ssh-vm-openbsd/compare/0.1...0.2
[0.1.0]: https://github.com/morgant/ssh-vm-openbsd/releases/tag/0.1
