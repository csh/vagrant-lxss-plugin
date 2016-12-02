module VagrantLxss
  class RequiredProcessNotFound < Vagrant::Errors::VagrantError
    error_message <<-EOF
Could not find Bash installed on your system.
Please follow the guide here to enable it:
  http://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/

If you are not using Windows 10 then you won't be able to make use of this
plugin out of the box. You may work around this by placing a valid bash
executable in the following directory:
  C:\\Windows\\system32\\

The executable path is hardcoded to prevent potential blunders where some
powerusers may have other bash executables in their %PATH%. You will not
receive any support if you use a third party executable.
    EOF
  end
end
