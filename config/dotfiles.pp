class projects::dotfiles (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ){

    repository { "${my_homedir}/src/dotfiles":
        ensure      => 'origin/HEAD',
        source      => 'wbs75/dotfiles',
    }
    
    file { "/Users/${my_username}/.aliases":
        ensure => link,
        mode   => '0644',
        target => "${my_sourcedir}/dotfiles/.aliases",
    }

    file { "/Users/${my_username}/.bash_profile":
        ensure => link,
        mode   => '0644',
        target => "${my_sourcedir}/dotfiles/.bash_profile",
    }

    file { "/Users/${my_username}/.bash_prompt":
        ensure => link,
        mode   => '0644',
        target => "${my_sourcedir}/dotfiles/.bash_prompt",
    }

    file { "/Users/${my_username}/.bashrc":
        ensure => link,
        mode   => '0644',
        target => "${my_sourcedir}/dotfiles/.bashrc",
    }

    file { "/Users/${my_username}/.exports":
        ensure => link,
        mode   => '0644',
        target => "${my_sourcedir}/dotfiles/.exports",
    }

    file { "/Users/${my_username}/.functions":
        ensure => link,
        mode   => '0644',
        target => "${my_sourcedir}/dotfiles/.functions",
    }

    file { "/Users/${my_username}/.hgignore":
        ensure => link,
        mode   => '0644',
        target => "${my_sourcedir}/dotfiles/.hgignore",
    }

    file { "/Users/${my_username}/.hushlogin":
        ensure => link,
        mode   => '0644',
        target => "${my_sourcedir}/dotfiles/.hushlogin",
    }

    file { "/Users/${my_username}/.inputrc":
        ensure => link,
        mode   => '0644',
        target => "${my_sourcedir}/dotfiles/.inputrc",
    }

    file { "/Users/${my_username}/.screenrc":
        ensure => link,
        mode   => '0644',
        target => "${my_sourcedir}/dotfiles/.screenrc",
    }
}
