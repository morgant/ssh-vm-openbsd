# ssh-vm for OpenBSD VMM
by Morgan Aldridge <morgant@makkintosshu.com>

## OVERVIEW

`ssh-vm` is a wrapper for the OpenSSH remote login client ([ssh(1)](https://man.openbsd.org/ssh))
which streamlines connecting to guest VMs running under OpenBSD's [VMM
(virtual machine monitor)](https://man.openbsd.org/vmm) via 
[tap(4)](https://man.openbsd.org/tap)/[vio(4)](https://man.openbsd.org/vio)
local interfaces. See the [LOCAL INTERFACES](https://man.openbsd.org/vmctl#LOCAL_INTERFACES)
section of [vmctl(8)](https://man.openbsd.org/vmctl) for further details as to
how vmd(8) allocates and assigns IP addresses in the 100.64.0.0/10 range.

## FEATURES

* Identify VM to connect to by either name or numerical ID (as shown in
vmctl(8))
* Optionally, specify a user to connect as using the `[user@]virtualmachine`
    syntax

**IMPORTANT:** _It does not yet support passing additional options and/or
parameters to ssh(1)!_

## INSTALLATION & REMOVAL

### Prerequisites

* [OpenBSD/amd64](https://www.openbsd.org/amd64.html)
* [Virtualization](https://www.openbsd.org/faq/faq16.html) configured with
    [local network interface(s)](https://www.openbsd.org/faq/faq16.html#VMMnet)

Optional, if installing from this git repository:

* [git(1)](https://openbsd.app/path/devel/git)

### Install

Clone this git repository and install with `make`:

```
git clone git@github.com:morgant/ssh-vm-openbsd.git
cd ssh-vm-openbsd
doas make install
```

### Uninstall

From the same local clone of the git repository:

```
doas make uninstall
```

## USAGE EXAMPLES

Given virtual machines (VMs) configured and listed in vmctl(1) as follows:

```
$ vmctl status
   ID   PID VCPUS  MAXMEM  CURMEM     TTY        OWNER    STATE NAME
    1 10000     1    1.0G    991M   ttyp7    username   running openbsd_dev
    2     -     1    1.0G       -       -    username   stopped openbsd_stable_dev
```

To connect to a VM named `openbsd_dev` with your own username:

```
$ ssh-vm openbsd_dev
```

To connect to the same VM by numerical ID (as shown in vmctl(1)):

```
$ ssh-vm 1
```

To connect to a VM as the `root` user (**NOTE:** _remote login for `root` is
disabled by default in OpenBSD, so this would be expected to fail_):

```
$ ssh-vm root@openbsd_dev
```

## CHANGE LOG

See [CHANGELOG.md](CHANGELOG.md) for detailed version history.

## ALTERNATE SOLUTIONS

As mentioned to me by other OpenBSD users, some alternate solutions for this
include:

* Configure aliases in `~/.ssh/config`
* Add entries in `/etc/hosts`

These are all worth considering before installing yet-another-utility! That
said, those examples still require keeping additional configurations in sync
with your `/etc/vm.conf` and also determining the correct IP address(es) in
the first place.

## LICENSE

Released under the [MIT license](LICENSE).
