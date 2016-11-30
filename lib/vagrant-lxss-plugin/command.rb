require 'optparse'

module VagrantLxss
  class Command < Vagrant.plugin(2, :command)
    def self.synopsis
      "connects to a machine using Bash on Ubuntu on Windows"
    end

    def execute
      raise Vagrant::Errors::CapabilityNotFound unless is_win_x?

      @logger.info('Hello from lxss!')

      options = {
        :help => false
      }

      opts = OptionParser.new do |o|
        o.banner = "Usage: vagrant bash [name|id]"
        o.separator ""

        o.on("-h", "--help", "Display command help") do |h|
          options[:help] = h
        end
      end

      argv = parse_options(opts)
      return -1 if !argv

      if options[:help]
        @logger.info('Connect to a machine using the Bash shell provided by \'Ubuntu on Windows\'')
        return 0
      end

      @logger.info("LXSS | Remaining arguments: #{argv}")

      with_target_vms(argv) do |machine|
        ssh_info = machine.ssh_info
        raise Vagrant::Errors::SSHNotReady if ssh_info.nil?

        ssh_options = ["#{ssh_info[:username] || 'vagrant'}@#{ssh_info[:host]}"]
        ssh_options += ["-p #{ssh_info[:port]}"] if ssh_info[:port] != 22
        ssh_options += ["-A"] if ssh_info[:forward_agent]

        # if ssh_info[:private_key_path].any?
        #   ssh_info[:private_key_path].each { |path|
        #     if File.exists? path
        #       ssh_options += ["-i \"#{convert_path(path)}\""]
        #       break
        #     end
        #   }
        # end

        command = "C:\\Windows\\system32\\bash.exe -c 'ssh #{ssh_options.join(' ')}'"
        @logger.debug("Full command: #{command}")
        system(command)
        return 0
      end
    end

    def is_bash_installed?
      true
    end

    def is_win_x?
      false unless Gem.win_platform?
      result = `cmd /C ver`
      return result =~ /\[Version 10.*\]/i
    end

    def convert_path (path)
      path = path.gsub '\\', '/'
      path = path.gsub (/^([A-Z])\:\//i) { '/mnt/' << $1.downcase << '/' }
      path = path.gsub (/\/(\w+) (\w+)/) { '/' << $1 << '\ ' << $2 }
      return path
    end
  end
end
