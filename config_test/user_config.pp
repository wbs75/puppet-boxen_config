class people::wbs75::config::user_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    ###############
    # User Config #
    ###############

    git::config::global {
        'user.name':
            value => 'wbs';
        'user.email':
            value => 'wbs75@me.com';
        'github.user':
            value => 'wbs75';
        'color.ui':
            value => 'true';
        'core.quotepath':
            value => 'false';
        'diff.tool':
            value => 'opendiff';
        'merge.tool':
            value => 'opendiff';
        'push.default':
            value => 'simple';
        'alias.amend':
            value => 'commit --amend -C HEAD';
    }

    File {
        owner   =>  $my_username,
        group   =>  'admin',
        mode    =>  '0644',
    }

    # Disable Dashboard
    property_list_key { 'Disable Dashboard':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.dashboard.plist",
        key         => 'mcx-disabled',
        value       => true,
        value_type  => 'boolean',
        notify      => Exec['Restart User Docks'],
    }

    # Activate extra debugging features for Installer
    property_list_key { 'Enable Installer Debugging':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.installer.plist",
        key         => 'defaults write com.apple.installer',
        value       => true,
        value_type  => 'boolean',
    }

    property_list_key { 'Show Expired Certificates':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.keychainaccess.plist",
        key         => 'Show Expired Certificates',
        value       => true,
        value_type  => 'boolean',
    }

    property_list_key { 'Distinguish Legacy ACLs':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.keychainaccess.plist",
        key         => 'Distinguish Legacy ACLs',
        value       => true,
        value_type  => 'boolean',
    }

    # Disable "Are you sure you want to open this?" Messages
    property_list_key { 'Disable "Are you sure you want to open this?" Messages':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.LaunchServices.plist",
        key         => 'LSQuarantine',
        value       => false,
        value_type  => 'boolean',
    }

    # Disables system-level key combos like command-option-esc (Force Quit), command-tab (App switcher) to be used on the remote machine
    property_list_key { 'Do Not Send SystemKeys':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.ScreenSharing.plist",
        key         => 'DoNotSendSystemKeys',
        value       => true,
        value_type  => 'boolean',
    }

    # Restart SystemUIServer for ScreenShot changes to take effect. Shadows are not included in screenshots of individual windows
    property_list_key { 'Disable Shadow':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.screencapture.plist",
        key         => 'disable-shadow',
        value       => true,
        value_type  => 'boolean',
        # notify      => Exec['Restart SystemUIServer'],
    }

    # The format in which screen captures are taken using hot keys (ie. Command-Shift-3, Command-Shift-4, etc.).
    property_list_key { 'Screen Capture Format':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.screencapture.plist",
        key         => 'type',
        value       => 'jpg',
        value_type  => 'string',
        # notify      => Exec['Restart SystemUIServer'],
    }

    property_list_key { 'Disable Menubar Time Machine icon':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.68296EB8-678A-5D6C-B437-F6710A922355.plist",
        key         => 'dontAutoLoad',
        value       => '/System/Library/CoreServices/Menu Extras/TimeMachine.menu',
        value_type  => array,
    }

    property_list_key { 'Disable Menubar Bluetooth icon':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.68296EB8-678A-5D6C-B437-F6710A922355.plist",
        key         => 'dontAutoLoad',
        value       => '/System/Library/CoreServices/Menu Extras/Bluetooth.menu',
        value_type  => array,
    }

    property_list_key { 'Disable Menubar AirPort icon':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.68296EB8-678A-5D6C-B437-F6710A922355.plist",
        key         => 'dontAutoLoad',
        value       => '/System/Library/CoreServices/Menu Extras/AirPort.menu',
        value_type  => array,
    }

    # Prevent protection when attempting to remotely control this computer
    property_list_key { 'Skip Local Address Check':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.ScreenSharing.plist",
        key         => 'skipLocalAddressCheck',
        value       => true,
        value_type  => 'boolean',
    }

    exec { 'Restart User Finder':
        command         => '/usr/bin/killall Finder',
        refreshonly     => true,
    }

    exec { 'Restart User Docks':
        command         => '/usr/bin/killall Finder',
        refreshonly     => true,
    }

    # xec { 'Restart SystemUIServer':
    #     command     => '/usr/bin/killall SystemUIServer',
    #     refreshonly => true,
    # }

    file { 'Dashboard Plist':
        ensure  => file,
        require => Property_list_key['Disable Dashboard'],
        path    => "${my_homedir}/Library/Preferences/com.apple.dashboard.plist",
        mode    => '0600',
    }

    file { 'Installer Plist':
        ensure  => file,
        require => Property_list_key['Enable Installer Debugging'],
        path    => "${my_homedir}/Library/Preferences/com.apple.installer.plist",
        mode    => '0600',
    }

    file { 'Keychainaccess Plist':
        ensure  => file,
        require => Property_list_key['Show Expired Certificates', 'Distinguish Legacy ACLs'],
        path    => "${my_homedir}/Library/Preferences/com.apple.keychainaccess.plist",
        mode    => '0600',
    }

    file { 'LaunchServices Plist':
        ensure  => file,
        require => Property_list_key['Disable "Are you sure you want to open this?" Messages'],
        path    => "${my_homedir}/Library/Preferences/com.apple.LaunchServices.plist",
        mode    => '0600',
    }

    file { 'Screencapture Plist':
        ensure  => file,
        require => Property_list_key['Disable Shadow', 'Screen Capture Format'],
        path    => "${my_homedir}/Library/Preferences/com.apple.screencapture.plist",
        mode    => '0600',
    }

    file { "${my_homedir}/Library/Preferences/ByHost/com.apple.systemuiserver.000c291e1dc4.plist":
        ensure  =>  file,
        require =>  Property_list_key['Disable Menubar Time Machine icon', 'Disable Menubar Bluetooth icon', 'Disable Menubar AirPort icon'],
        path    =>  "${my_homedir}/Library/Preferences/ByHost/com.apple.systemuiserver.000c291e1dc4.plist",
        mode    =>  '0600',
    }

    file { 'ScreenSharing Plist':
        ensure  => file,
        require => Property_list_key['Skip Local Address Check', 'Do Not Send SystemKeys'],
        path    => "${my_homedir}/Library/Preferences/com.apple.ScreenSharing.plist",
        mode    => '0600',
    }


}
