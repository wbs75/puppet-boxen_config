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

    property_list_key { 'Disable Gatekeeper':
        ensure => present,
        path   => '/var/db/SystemPolicy-prefs.plist',
        key    => 'enabled',
        value  => 'no',
    }

    File {
        owner => 'root',
        group => 'wheel',
        mode  => '0644',
    }

    # Additional information to display on the login window
    property_list_key { 'Admin Host Info':
        ensure      =>  present,
        path        =>  "/Library/Preferences/com.apple.loginwindow.plist",
        key         =>  'AdminHostInfo',
        value       =>  'HostName',
        value_type  =>  'string',
    }

    # Disable Automatic Login - Note: change value to "false" for Disable Automatic Login to work
    property_list_key { 'Disable Auto Login Client':
        ensure      =>  present,
        path        =>  "/Library/Preferences/com.apple.loginwindow.plist",
        key         =>  'com.apple.login.mcx.DisableAutoLoginClient',
        value       =>  true,
        value_type  =>  'boolean',
    }

    # Disable Secure Virtual Memory - Requires Restart
    property_list_key { 'Disable Encrypted Swap':
        ensure      =>  present,
        path        =>  "/Library/Preferences/com.apple.virtualMemory.plist",
        key         =>  'DisableEncryptedSwap',
        value       =>  true,
        value_type  =>  'boolean',
    }

    file { 'Loginwindow Plist':
        ensure  =>  file,
        require =>  Property_list_key['Admin Host Info', 'Disable Auto Login Client'],
        path    =>  "/Library/Preferences/com.apple.loginwindow.plist",
        mode    =>  '0644',
    }

    file { 'VirtualMemory Plist':
        ensure  =>  file,
        require =>  Property_list_key['Disable Encrypted Swap'],
        path    =>  "/Library/Preferences/com.apple.virtualMemory.plist",
        mode    =>  '0644',
    }
}
