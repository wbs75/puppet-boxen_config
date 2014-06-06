class people::wbs75::config::user_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    ###############
    # User Config #
    ###############

    include bash
    include bash::completion

    git::config::global { 'user.email':
        value  => 'wbs75@me.com'
    }

    file { '.Dashboard Plist':
        ensure  => file,
        require => Property_list_key['Disable Dashboard'],
        path    => "${my_homedir}/Library/Preferences/com.apple.dashboard.plist",
        mode    => '0600',
    }

    # Disable Dashboard
    property_list_key { 'Disable Dashboard':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dashboard.plist",
        key     => 'mcx-disabled',
        value   => true,
        value_type  => 'boolean',
    }

    file { '.Installer Plist':
        ensure  => file,
        require => Property_list_key['Enable Installer Debugging'],
        path    => "${my_homedir}/Library/Preferences/com.apple.installer.plist",
        mode    => '0600',
    }

    # Activate extra debugging features for Installer
    property_list_key { 'Enable Installer Debugging':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.installer.plist",
        key     => 'defaults write com.apple.installer',
        value   => true,
        value_type  => 'boolean',
    }

    file { '.Keychainaccess Plist':
        ensure  => file,
        require => Property_list_key['Show Expired Certificates', 'Distinguish Legacy ACLs'],
        path    => "${my_homedir}/Library/Preferences/com.apple.keychainaccess.plist",
        mode    => '0600',
    }

    property_list_key { 'Show Expired Certificates':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.keychainaccess.plist",
        key     => 'Show Expired Certificates',
        value   => true,
        value_type  => 'boolean',
    }

    property_list_key { 'Distinguish Legacy ACLs':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.keychainaccess.plist",
        key     => 'Distinguish Legacy ACLs',
        value   => true,
        value_type  => 'boolean',
    }

    file { '.LaunchServices Plist':
        ensure  => file,
        require => Property_list_key['Disable "Are you sure you want to open this?" Messages'],
        path    => "${my_homedir}/Library/Preferences/com.apple.LaunchServices.plist",
        mode    => '0600',
    }

    # Disable "Are you sure you want to open this?" Messages
    property_list_key { 'Disable "Are you sure you want to open this?" Messages':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.LaunchServices.plist",
        key     => 'LSQuarantine',
        value   => false,
        value_type  => 'boolean',
    }

    file { '.Screencapture Plist':
        ensure  => file,
        require => Property_list_key['Disable Shadow', 'Screen Capture Format'],
        path    => "${my_homedir}/Library/Preferences/com.apple.screencapture.plist",
        mode    => '0600',
    }

    # Restart SystemUIServer for ScreenShot changes to take effect. Shadows are not included in screenshots of individual windows
    property_list_key { 'Disable Shadow':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.screencapture.plist",
        key     => 'disable-shadow',
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
        key     => 'type',
        value   => 'jpg',
        value_type  => 'string',
        notify  => Exec['Restart SystemUIServer'],
    }

    file { "${my_homedir}/Library/Preferences/ByHost/com.apple.systemuiserver.000c291e1dc4.plist":
        ensure  => file,
        mode    => '0600',
        require => Property_list_key['Disable Menubar Time Machine icon', 'Disable Menubar Bluetooth icon', 'Disable Menubar AirPort icon'],
    }

    property_list_key { 'Disable Menubar Time Machine icon':
        ensure => present,
        path    => "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.BCE23ED2-261F-5E00-951F-142662E2472E.plist",
        key     => 'dontAutoLoad',
        value   => '/System/Library/CoreServices/Menu Extras/TimeMachine.menu',
        value_type  => array,
    }

    property_list_key { 'Disable Menubar Bluetooth icon':
        ensure => present,
        path    => "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.BCE23ED2-261F-5E00-951F-142662E2472E.plist",
        key     => 'dontAutoLoad',
        value   => '/System/Library/CoreServices/Menu Extras/Bluetooth.menu',
        value_type  => array,
    }

    property_list_key { 'Disable Menubar AirPort icon':
        ensure => present,
        path    => "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.BCE23ED2-261F-5E00-951F-142662E2472E.plist",
        key     => 'dontAutoLoad',
        value   => '/System/Library/CoreServices/Menu Extras/AirPort.menu',
        value_type  => array,
    }

    File {
        owner => $my_username,
        group => 'staff',
        mode  => '0644',
    }
}
