# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.0.1"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "git",        "1.2.5"
github "homebrew",   "1.4.1"
# needed by homebrew manifest
github "repository", "2.2.0"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "vcsrepo",    "0.1.2", :repo => "puppetlabs/puppetlabs-vcsrepo"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "firefox",    "1.1.3"
github "chrome",     "1.1.1"
github "osx",        "1.6.0"
# for opening the BlessedWords.kbd KeePass database
github "keepassx",   "1.0.0"
github "iterm2",     "1.0.3"
github "virtualbox", "1.0.5"
github "vagrant",    "2.0.10"
github "adium",      "1.1.1"
github "thunderbird","1.0.1", :repo =>  "magicmonty/puppet-thunderbird"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
