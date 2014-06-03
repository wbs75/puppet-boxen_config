class people::wbs75::config::remotedesktop_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {
    
    ######################
    ### Remote Desktop ###
    ######################

    property_list_key { 'Directory Group Logins Enabled':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.RemoteDesktop.plist",
        key     => 'DirectoryGroupLoginsEnabled',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'Do Not Send System Keys':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.RemoteDesktop.plist",
        key     => 'DoNotSendSystemKeys',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'Show Short User Name':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.RemoteDesktop.plist",
        key     => 'showShortUserName',
        value      => true,
        value_type => 'boolean',
    }
}
