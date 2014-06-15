class people::wbs75::config::system_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    #################
    # System Config #
    #################


    include osx::software_update
    include osx::disable_app_quarantine
    include osx::no_network_dsstores

    File {
      owner =>  $my_username,
      group => 'admin',
      mode  => '0644',
    }

########################################################################################

    property_list_key { 'Disable Gatekeeper':
        ensure  =>  present,
        path    =>  '/var/db/SystemPolicy-prefs.plist',
        key     =>  'enabled',
        value   =>  'no',
        notify  =>   Exec['Defaults Disable Gatekeeper Plist'],
    }

    exec { 'Defaults Disable Gatekeeper Plist':
        command     => "defaults read /var/db/SystemPolicy-prefs.plist",
        path        =>  "/usr/bin/",
    }

########################################################################################

    # Additional information to display on the login window
    property_list_key { 'Admin Host Info':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.loginwindow.plist",
        key         =>  'AdminHostInfo',
        value       =>  'HostName',
        value_type  =>  'string',
    }

    # Disable Automatic Login - Note: change value to "false" for Disable Automatic Login to work
    property_list_key { 'Disable Auto Login Client':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.loginwindow.plist",
        key         =>  'com.apple.login.mcx.DisableAutoLoginClient',
        value       =>  true,
        value_type  =>  'boolean',
        notify      =>   Exec['Defaults Read Loginwindow Plist'],
    }

    exec { 'Defaults Read Loginwindow Plist':
        command     => "defaults read ${my_homedir}/Library/Preferences/com.apple.loginwindow.plist",
        path        =>  "/usr/bin/",
    }


########################################################################################

    # Disable Secure Virtual Memory - Requires Restart
    property_list_key { 'Disable Encrypted Swap':
        ensure      =>  present,
        path        =>  "/Library/Preferences/com.apple.virtualMemory.plist",
        key         =>  'DisableEncryptedSwap',
        value       =>  true,
        value_type  =>  'boolean',
        notify      =>   Exec['Default Read VirtualMemory Plist'],
    }

    exec { 'Default Read VirtualMemory Plist':
        command     =>  "defaults read /Library/Preferences/com.apple.virtualMemory.plist",
        path        =>  "/usr/bin/",
    }

}
