class projects::boxen_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ){

    repository { "${my_sourcedir}/puppet-boxen_config":
        ensure      => 'origin/HEAD',
        source      => 'wbs75/puppet-boxen_config',
    }
}
