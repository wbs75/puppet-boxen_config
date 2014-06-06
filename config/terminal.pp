class people::wbs75::config::terminal_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {


    ###################
    # Terminal Config #
    ###################

    file { '.Terminal Plist':
        ensure  => file,
        require => Property_list_key[],
        path    => "${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        mode    => '0600',
    }


    File {
        owner => $my_username,
        group => 'staff',
        mode  => '0644',
    }

}
