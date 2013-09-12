# Mason's stuff
class people::masonm {
  include spotify
  include zsh

  $home = "/Users/${::boxen_user}"
  $coding = "${home}/src"

  file {
    $coding: ensure => directory;
    "${coding}/asci": ensure => directory;
    "${home}/asci": target => "${coding}/asci";
  }

  $dotfiles = "${coding}/dotfiles"
  vcsrepo { $dotfiles:
    ensure   => present,
    source   => 'https://bitbucket.org/MasonM/dotfiles',
    provider => hg,
  }
  ->
  exec { "${dotfiles}/copy.sh": }

  # OS X specific stuff
  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

  package { 'Time Out':
    ensure   => installed,
    source   => 'http://www.dejal.com/download/?prod=timeout&vers=1.7.1&lang=en&op=getnow&ref=timeout',
    provider => 'compressed_app',
    flavor   => 'zip',
  }

  include osx::finder::unhide_library

  package { 'Evoluent Mouse':
    ensure   => installed,
    source   => 'http://www.evoluent.com/download/EvoluentVerticalMouseDeviceController1.0.8f1_10_6.dmg',
    provider => 'pkgdmg',
  }
}
