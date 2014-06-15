class projects::font_ubuntu (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {
    
    File {
      owner => 'root',
      group => 'wheel',
      mode  => '1575',
    }

    repository { "${my_homedir}/src/puppet-font_ubuntu":
        source  => 'wbs75/puppet-font_ubuntu',
    }

    file {"/Library/Fonts":
        ensure      =>  link,
        recurse     =>  true,
        source      =>  "${my_homedir}/src/puppet-font_ubuntu/ubuntu_font_family",
        require     =>  Repository["${my_homedir}/src/puppet-font_ubuntu"],
        mode        => '0644',
    }

}
