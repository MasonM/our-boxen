# Mason's stuff
class people::masonm {
  include spotify

  $home = "/Users/${::boxen_user}"
  $coding = "${home}/coding"
  $dotfiles = "${coding}/dotfiles"

  file { $coding:
    ensure  => directory
  }

  vcsrepo { $dotfiles:
    ensure   => present,
    source   => 'https://bitbucket.org/MasonM/dotfiles',
    provider => hg,
  }

  exec { "${dotfiles}/copy.sh":
    require => Vcsrepo[$dotfiles],
  }

  vcsrepo { "${home}/.oh-my-zsh":
    ensure   => present,
    source   => 'https://github.com/MasonM/oh-my-zsh.git',
    provider => git,
  }

  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

  include osx::finder::unhide_library

  package { 'Evoluent Mouse':
    ensure   => installed,
    source   => 'http://www.evoluent.com/download/EvoluentVerticalMouseDeviceController1.0.8f1_10_6.dmg',
    provider => 'appdmg',
  }
}
