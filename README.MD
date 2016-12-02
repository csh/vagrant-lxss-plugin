vagrant-lxss-plugin
===================

[![Gem Version ](https://img.shields.io/gem/v/vagrant-lxss-plugin.svg?style=flat-square)](https://rubygems.org/gems/vagrant-lxss-plugin)
[![Gem Downloads](https://img.shields.io/gem/dt/vagrant-lxss-plugin.svg?style=flat-square)](https://rubygems.org/gems/vagrant-lxss-plugin)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://raw.githubusercontent.com/csh/vagrant-lxss-plugin/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/csh/vagrant-lxss-plugin.svg?style=flat-square)](https://github.com/csh/vagrant-lxss-plugin/issues)

Simple plugin that allows you to SSH into Vagrant machines using Bash on Ubuntu on Windows.

_This serves as a way of getting me back into Ruby, so there may be some silly bugs._

### Installation

Obviously to make use of this plugin you must have Bash on Ubuntu on Windows installed,
I won't cover that here so here's [a nice article][install_bash] on how to do it.

Install the plugin from RubyGems using the following command:

```
vagrant plugin install vagrant-lxss-plugin
```

Alternatively if you feel like the `master` branch is more up-to-date than the
released version then you may run the following commands to install the latest
version:

```
git clone https://github.com/csh/vagrant-lxss-plugin.git
cd vagrant-lxss-plugin
rake build
vagrant plugin install pkg/vagrant-lxss-plugin-x.x.x.gem
```

### Usage

Once the plugin is installed you simply use `bash` instead of `ssh` when connecting to a VM.


##### From the VM Directory

```
vagrant bash
```


##### From elsewhere

```
vagrant bash <machine-id>
```
[install_bash]: http://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/
