class projects::boxen_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ){

    File {
        owner => $my_username,
        group => 'admin',
        mode  => '0644',
    }

    boxen::project { 'boxen_config':
        dir     => "${my_homedir}/src/puppet-boxen_config",
        source  => 'https://github.com/wbs75/puppet-boxen_config',
    }
}
