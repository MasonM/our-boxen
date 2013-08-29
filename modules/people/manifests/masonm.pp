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

  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

  include osx::finder::unhide_library
}
