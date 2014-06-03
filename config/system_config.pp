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
    
    # Disable Gatekeeper so you can install any package you want
    property_list_key { 'Disable Gatekeeper':
        ensure  => present,
        path    => '/var/db/SystemPolicy-prefs.plist',
        key => 'enabled',
        value   => 'no',
    }

    # Additional information to display on the login window
    property_list_key { 'AdminHostInfo':
        ensure  => present,
        path    => "/Library/Preferences/com.apple.loginwindow.plist",
        key => 'AdminHostInfo',
        value   => 'HostName',
        value_type  => 'string',
    }

    # Disable Secure Virtual Memory - Requires Restart 
    property_list_key { 'DisableEncryptedSwap':
        ensure  => present,
        path    => "/Library/Preferences/com.apple.virtualMemory.plist",
        key => 'DisableEncryptedSwap',
        value   => true,
        value_type  => 'boolean',
    }

    # Warning: This feature may be unstable. Requires a restart. Enables Quartz 2D extreme functionality, which uses the graphics card to render graphics and text
    property_list_key { 'Enables Quartz 2D':
        ensure  => present,
        path    => "/Library/Preferences/com.apple.windowserver.plist"
        key => 'Quartz2DExtremeEnabled',
        value   => true,
        value_type  => 'boolean',
    }

    # Disable Automatic Login - Note: change value to "false" for Disable Automatic Login to work
    property_list_key { 'Disabl Auto Login Client':
        ensure  => present,
        path    => "/Library/Preferences/com.apple.loginwindow.plist",
        key => 'com.apple.login.mcx.DisableAutoLoginClient',
        value   => true,
        value_type  => 'boolean',
    }

    # Prevent protection when attempting to remotely control this computer
    property_list_key { 'Skip Local Address Check':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.ScreenSharing.plist",
        key => 'skipLocalAddressCheck',
        value   => true,
        value_type  => 'boolean',
    }

    # Disables system-level key combos like command-option-esc (Force Quit), command-tab (App switcher) to be used on the remote machine
    property_list_key { 'Do Not Send SystemKeys':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.ScreenSharing.plist",
        key => 'DoNotSendSystemKeys',
        value   => true,
        value_type  => 'boolean',
    }
