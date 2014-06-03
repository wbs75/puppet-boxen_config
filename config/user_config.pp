class people::wbs75::config::user_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {
    
    File {
        owner => $my_username,
        group => 'staff',
        mode  => '0644',
    }

    ###############
    # User Config #
    ###############
    
    include bash
    include bash::completion

    git::config::global { 'user.email':
        value  => 'wbs75@me.com'
    }

    # Disable Dashboard
    property_list_key { 'Disable Dashboard':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dashboard.plist",
        key => 'mcx-disabled',
        value   => true,
        value_type  => 'boolean',
    }

    # Activate extra debugging features for Installer
    property_list_key { 'Enable Installer Debugging':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.installer.plist",
        key => 'defaults write com.apple.installer',
        value   => true,
        value_type  => 'boolean',
    }

    property_list_key { 'Show Expired Certificates':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.keychainaccess.plist",
        key => 'Show Expired Certificates',
        value   => true,
        value_type  => 'boolean',
    }

    property_list_key { 'Distinguish Legacy ACLs':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.keychainaccess.plist",
        key => 'Distinguish Legacy ACLs',
        value   => true,
        value_type  => 'boolean',
    }

    # Disable "Are you sure you want to open this?" Messages
    property_list_key { 'Disable "Are you sure you want to open this?" Messages':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.LaunchServices.plist",
        key => 'LSQuarantine',
        value   => false,
        value_type  => 'boolean',
    }

    # Restart SystemUIServer for ScreenShot changes to take effect. Shadows are not included in screenshots of individual windows
    property_list_key { 'Disable Shadow':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.screencapture.plist",
        key => 'disable-shadow',
        value   => true,
        value_type  => 'boolean',
        notify  => Exec['Restart SystemUIServer'],
    }

    exec { 'Restart SystemUIServer':
        command => '/usr/bin/killall -HUP SystemUIServer',
        refreshonly => true,
    }

    # The format in which screen captures are taken using hot keys (ie. Command-Shift-3, Command-Shift-4, etc.).
    property_list_key { 'Screen Capture Format':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.screencapture.plist",
        key => 'type',
        value   => 'jpg',
        value_type  => 'string',
        notify  => Exec['Restart SystemUIServer'],
    }

    file { "${my_homedir}/Library/Preferences/ByHost/com.apple.systemuiserver.000c291e1dc4.plist":
        ensure  => file,
        mode    => '0600',
        require => Property_list_key['disable Menubar Time Machine icon', 'disable Menubar Bluetooth icon', 'disable Menubar AirPort icon'],
    }

    property_list_key { 'disable Menubar Time Machine icon':
        ensure => present,
        path   => "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.BCE23ED2-261F-5E00-951F-142662E2472E.plist",
        key => 'dontAutoLoad',
        value  => '/System/Library/CoreServices/Menu Extras/TimeMachine.menu',
        value_type  => array,
    }

    property_list_key { 'disable Menubar Bluetooth icon':
        ensure => present,
        path   => "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.BCE23ED2-261F-5E00-951F-142662E2472E.plist",
        key => 'dontAutoLoad',
        value  => '/System/Library/CoreServices/Menu Extras/Bluetooth.menu',
        value_type  => array,
    }

    property_list_key { 'disable Menubar AirPort icon':
        ensure => present,
        path   => "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.BCE23ED2-261F-5E00-951F-142662E2472E.plist",
        key => 'dontAutoLoad',
        value  => '/System/Library/CoreServices/Menu Extras/AirPort.menu',
        value_type  => array,
    }
}
