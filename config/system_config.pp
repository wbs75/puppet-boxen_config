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

    file { '.Loginwindow Plist':
        ensure  => file,
        require => Property_list_key['Admin Host Info', 'Disable Auto Login Client'],
        path    => "${my_homedir}/Library/Preferences/com.apple.loginwindow.plist",
        mode    => '0600',
    }

    # Additional information to display on the login window
    property_list_key { 'Admin Host Info':
        ensure  => present,
        path    => "/Library/Preferences/com.apple.loginwindow.plist",
        key     => 'AdminHostInfo',
        value   => 'HostName',
        value_type  => 'string',
    }

    # Disable Automatic Login - Note: change value to "false" for Disable Automatic Login to work
    property_list_key { 'Disable Auto Login Client':
        ensure  => present,
        path    => "/Library/Preferences/com.apple.loginwindow.plist",
        key     => 'com.apple.login.mcx.DisableAutoLoginClient',
        value   => true,
        value_type  => 'boolean',
    }

    file { '.VirtualMemory Plist':
        ensure  => file,
        require => Property_list_key['Disable Encrypted Swap'],
        path    => "${my_homedir}/Library/Preferences/com.apple.virtualMemory.plist",
        mode    => '0600',
    }

    # Disable Secure Virtual Memory - Requires Restart
    property_list_key { 'Disable Encrypted Swap':
        ensure  => present,
        path    => "/Library/Preferences/com.apple.virtualMemory.plist",
        key     => 'DisableEncryptedSwap',
        value   => true,
        value_type  => 'boolean',
    }

    file { '.ScreenSharing Plist':
        ensure  => file,
        require => Property_list_key['Skip Local Address Check', 'Do Not Send SystemKeys'],
        path    => "${my_homedir}/Library/Preferences/com.apple.ScreenSharing.plist",
        mode    => '0600',
    }

    # Prevent protection when attempting to remotely control this computer
    property_list_key { 'Skip Local Address Check':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.ScreenSharing.plist",
        key     => 'skipLocalAddressCheck',
        value   => true,
        value_type  => 'boolean',
    }

    # Disables system-level key combos like command-option-esc (Force Quit), command-tab (App switcher) to be used on the remote machine
    property_list_key { 'Do Not Send SystemKeys':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.ScreenSharing.plist",
        key     => 'DoNotSendSystemKeys',
        value   => true,
        value_type  => 'boolean',
    }

    File {
        owner => $my_username,
        group => 'staff',
        mode  => '0644',
    }

}
