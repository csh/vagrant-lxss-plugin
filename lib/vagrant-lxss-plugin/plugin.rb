require 'vagrant'

module VagrantLxss
  class Plugin < Vagrant.plugin(2)
    name "vagrant-lxss-plugin"
    description "vagrant-lxss-plugin allows you to ssh into your virtual machines using Bash on Ubuntu on Windows 10"

    command "bash" do
      require File.expand_path("../command", __FILE__)
      Command
    end
  end
end
