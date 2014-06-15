class people::wbs75::config::remotedesktop_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    ######################
    ### Remote Desktop ###
    ######################

    File {
      owner => $my_username,
      group => 'staff',
      mode  => '0644',
    }

    exec { 'Default Read RemoteDesktop Plist':
        command     => '/usr/bin/defaults read ~/Library/Preferences/com.apple.RemoteDesktop.plist',
        path        =>  "/usr/bin/",
    }

    property_list_key { 'Directory Group Logins Enabled':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.RemoteDesktop.plist",
        key         =>  'DirectoryGroupLoginsEnabled',
        value       =>  true,
        value_type  =>  'boolean',
        notify      =>  Exec['Default Read RemoteDesktop Plist'],
    }

    property_list_key { 'Do Not Send System Keys':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.RemoteDesktop.plist",
        key         =>  'DoNotSendSystemKeys',
        value       =>  true,
        value_type  =>  'boolean',
        notify      =>  Exec['Default Read RemoteDesktop Plist'],
    }

    property_list_key { 'Show Short User Name':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.RemoteDesktop.plist",
        key         =>  'showShortUserName',
        value       =>  true,
        value_type  =>  'boolean',
        notify      =>  Exec['Default Read RemoteDesktop Plist'],
    }

    file { 'RemoteDesktop Plist':
        ensure      =>  file,
        require     =>  [
                            Property_list_key['Directory Group Logins Enabled'],
                            Property_list_key['Do Not Send System Keys'],
                            Property_list_key['Show Short User Name'],
                        ],
        path        =>  "${my_homedir}/Library/Preferences/com.apple.RemoteDesktop.plist",
        mode        =>  '0600',
        notify      =>  Exec['Default Read RemoteDesktop Plist'],
    }
}
