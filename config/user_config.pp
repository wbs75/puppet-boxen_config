class people::wbs75::config::user_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    ###############
    # User Config #
    ###############

    File {
      owner => $my_username,
      group => 'staff',
      mode  => '0644',
    }

########################################################################

    # Disable Dashboard
    property_list_key { 'Disable Dashboard':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dashboard.plist",
        key         =>  'mcx-disabled',
        value       =>  true,
        value_type  =>  'boolean',
    }

    file { 'Dashboard Plist':
        ensure      =>  file,
        require     =>  Property_list_key['Disable Dashboard'],
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dashboard.plist",
        mode        =>  '0600',
        notify      =>   Exec['Defaults Read Dashboard Plist'],
    }

    exec { 'Defaults Read Dashboard Plist':
        command     => "defaults read ${my_homedir}/Library/Preferences/com.apple.dashboard.plist",
        path        =>  "/usr/bin/",
    }

########################################################################

    # Activate extra debugging features for Installer
    property_list_key { 'Enable Installer Debugging':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.installer.plist",
        key         =>  'defaults write com.apple.installer',
        value       =>  true,
        value_type  =>  'boolean',
    }

    file { 'Installer Plist':
        ensure      =>  file,
        require     =>  Property_list_key['Enable Installer Debugging'],
        path        =>  "${my_homedir}/Library/Preferences/com.apple.installer.plist",
        mode        =>  '0600',
        notify      =>   Exec['Defaults Read Installer Plist'],
    }

    exec { 'Defaults Read Installer Plist':
        command     => "defaults read ${my_homedir}/Library/Preferences/com.apple.installer.plist",
        path        =>  "/usr/bin/",
    }

########################################################################

    property_list_key { 'Show Expired Certificates':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.keychainaccess.plist",
        key         =>  'Show Expired Certificates',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Distinguish Legacy ACLs':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.keychainaccess.plist",
        key         =>  'Distinguish Legacy ACLs',
        value       =>  true,
        value_type  =>  'boolean',
    }

    file { 'Keychainaccess Plist':
        ensure      =>  file,
        require     =>  [
                            Property_list_key['Show Expired Certificates'],
                            Property_list_key['Distinguish Legacy ACLs'],
                        ],
        path        =>  "${my_homedir}/Library/Preferences/com.apple.keychainaccess.plist",
        mode        =>  '0600',
        notify      =>    Exec['Defaults Read Keychainaccess Plist'],
    }

    exec { 'Defaults Read Keychainaccess Plist':
        command     => "defaults read ${my_homedir}/Library/Preferences/com.apple.keychainaccess.plist",
        path        =>  "/usr/bin/",
    }

########################################################################

    # Disable "Are you sure you want to open this?" Messages
    property_list_key { 'Disable "Are you sure you want to open this?" Messages':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.LaunchServices.plist",
        key         =>  'LSQuarantine',
        value       =>  false,
        value_type  =>  'boolean',
    }

    file { 'LaunchServices Plist':
        ensure      =>  file,
        require     =>  Property_list_key['Disable "Are you sure you want to open this?" Messages'],
        path        =>  "${my_homedir}/Library/Preferences/com.apple.LaunchServices.plist",
        mode        =>  '0600',
        notify      =>  Exec['Defaults Read LaunchServices Plist'],
    }

    exec { 'Defaults Read LaunchServices Plist':
        command     => "defaults read ${my_homedir}/Library/Preferences/com.apple.LaunchServices.plist",
        path        =>  "/usr/bin/",
    }

########################################################################

    # Prevent protection when attempting to remotely control this computer
    property_list_key { 'Skip Local Address Check':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.ScreenSharing.plist",
        key         => 'skipLocalAddressCheck',
        value       => true,
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

    file { 'ScreenSharing Plist':
        ensure      =>  file,
        require     =>  Property_list_key['Skip Local Address Check', 'Do Not Send SystemKeys'],
        path        =>  "${my_homedir}/Library/Preferences/com.apple.ScreenSharing.plist",
        mode        =>  '0600',
        notify      =>  Exec['Defaults Read ScreenSharing Plist'],
    }

    exec { 'Defaults Read ScreenSharing Plist':
        command     => "defaults read ${my_homedir}/Library/Preferences/com.apple.ScreenSharing.plist",
        path        =>  "/usr/bin/",
    }

########################################################################

    # Restart SystemUIServer for ScreenShot changes to take effect. Shadows are not included in screenshots of individual windows
    property_list_key { 'Disable Shadow':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.screencapture.plist",
        key         =>  'disable-shadow',
        value       =>  true,
        value_type  =>  'boolean',
    }

    # The format in which screen captures are taken using hot keys (ie. Command-Shift-3, Command-Shift-4, etc.).
    property_list_key { 'Screen Capture Format':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.screencapture.plist",
        key         =>  'type',
        value       =>  'jpg',
        value_type  =>  'string',
    }

    file { 'Screencapture Plist':
        ensure      =>  file,
        require     =>  Property_list_key['Disable Shadow', 'Screen Capture Format'],
        path        =>  "${my_homedir}/Library/Preferences/com.apple.screencapture.plist",
        mode        =>  '0600',
        notify      =>  Exec['Defaults Read Screencapture Plist'],
    }

    exec { 'Defaults Read Screencapture Plist':
        command     => "defaults read ${my_homedir}/Library/Preferences/com.apple.screencapture.plist",
        path        =>  "/usr/bin/",
    }

########################################################################

    # property_list_key { 'Disable Menubar Time Machine icon':
    #     ensure      =>  present,
    #     path        =>  "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.68296EB8-678A-5D6C-B437-F6710A922355.plist",
    #     key         =>  'dontAutoLoad',
    #     value       =>  '/System/Library/CoreServices/Menu Extras/TimeMachine.menu',
    #     value_type  =>  array,
    # }

    # property_list_key { 'Disable Menubar Bluetooth icon':
    #     ensure      =>  present,
    #     path        =>  "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.68296EB8-678A-5D6C-B437-F6710A922355.plist",
    #     key         =>  'dontAutoLoad',
    #     value       =>  '/System/Library/CoreServices/Menu Extras/Bluetooth.menu',
    #     value_type  =>  array,
    # }

    # property_list_key { 'Disable Menubar AirPort icon':
    #     ensure      =>  present,
    #     path        =>  "${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.68296EB8-678A-5D6C-B437-F6710A922355.plist",
    #     key         =>  'dontAutoLoad',
    #     value       =>  '/System/Library/CoreServices/Menu Extras/AirPort.menu',
    #     value_type  =>  array,
    # }

    # file { "${my_homedir}/Library/Preferences/ByHost/com.apple.systemuiserver.000c291e1dc4.plist":
    #     ensure      =>  file,
    #     require     =>  [
    #                         Property_list_key['Disable Menubar Time Machine icon'],
    #                         Property_list_key['Disable Menubar Bluetooth icon'],
    #                         Property_list_key['Disable Menubar AirPort icon'],
    #                     ],
    #     path        =>  "${my_homedir}/Library/Preferences/ByHost/com.apple.systemuiserver.000c291e1dc4.plist",
    #     mode        =>  '0600',
    #     notify      =>  [
    #                         Exec['Defaults Read ByHost .GlobalPreferences Plist'],
    #                         Exec['Defaults Read .Systemuiserver Plist'],
    #                         Exec['Restart SystemUIServer'],
    #                     ],
    # }

    # exec { 'Defaults Read ByHost .GlobalPreferences Plist':
    #     command     => "defaults read ${my_homedir}/Library/Preferences/ByHost/.GlobalPreferences.68296EB8-678A-5D6C-B437-F6710A922355.plist",
    #     path        =>  "/usr/bin/",
    # }

    # exec { 'Defaults Read .Systemuiserver Plist':
    #     command     => "defaults read ${my_homedir}/Library/Preferences/ByHost/com.apple.systemuiserver.000c291e1dc4.plist",
    #     path        =>  "/usr/bin/",
    # }

    # exec { 'Restart SystemUIServer':
    #     command     => '/usr/bin/killall SystemUIServer',
    # }

}
