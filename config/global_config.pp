class people::wbs75::config::global_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    ###################
    # Global Settings #
    ###################
    #########################################################
    # Reboot is required for some of changes to take effect #
    #########################################################

    include osx::global::enable_standard_function_keys
    include osx::global::disable_remote_control_ir_receiver

    file { '.Global Plist':
        ensure  => file,
        require => Property_list_key['Enable MenuBar Transparency', 'Enable Mouse Swipe Navigate With Scrolls', 'Apple Highlight Color', 'Side Bar Icon Size - Small', 'Apple Use Core UI', 'Apple Use Core UI', 'Check Spelling While Typing', 'Disable Automatic Spelling Correction', 'Automatic Termination', 'Quick Look Debugging', 'Show All File Extensions', 'Disable Resume system-wide', 'Enable Extension Change Warning'],
        path=>"${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
        mode=>'0600',
    }

        property_list_key { 'Disable Ducking Autocorrect':
            ensure     => present,
            path       => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
            key        => 'NSAutomaticSpellingCorrectionEnabled',
            value      => false,
            value_type => 'boolean',
        }

        property_list_key { 'Enable MenuBar Transparency':
            ensure  => present,
            path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
            key     => 'AppleEnableMenuBarTransparency',
            value   => false,
            value_type  => 'boolean',
        }

        property_list_key { 'Enable Mouse Swipe Navigate With Scrolls':
            ensure  => present,
            path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
            key     => 'AppleEnableMouseSwipeNavigateWithScrolls',
            value   => true,
            value_type  => 'boolean',
        }

        property_list_key { 'Apple Highlight Color':
            ensure  => present,
            path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
            key     => 'AppleHighlightColor',
            value   => '1.000000 0.823500 0.505900',
            value_type  => 'string',
        }

        property_list_key { 'Side Bar Icon Size - Small':
            ensure  => present,
            path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
            key     => 'NSTableViewDefaultSizeMode',
            value   => 1,
            value_type  => 'integer',
        }

        # To turn rounded corners off for all windows, amongst other things. Apps must be restarted.
        property_list_key { 'Apple Use Core UI':
            ensure  => present,
            path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
            key     => 'AppleUseCoreUI',
            value   => true,
            value_type  => 'boolean',
        }

        property_list_key { 'Check Spelling While Typing':
            ensure  => present,
            path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
            key     => 'CheckSpellingWhileTyping',
            value   => true,
            value_type  => 'boolean',
        }

        property_list_key { 'Disable Automatic Spelling Correction':
            ensure  => present,
            path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
            key     => 'WebAutomaticSpellingCorrectionEnabled',
            value   => false,
            value_type  => 'boolean',
        }

        # Warning: This feature is buggy! Requires a logout, 1GB of RAM, and only one video card. QuartzGL can boost performance if an application is hardware acceleration dependent.
        property_list_key { 'Automatic Termination':
            ensure  => present,
            path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
            key     => 'NSDisableAutomaticTermination',
            value   => true,
            value_type  => 'boolean',
        }

        # Cause Quick Look to print log messages showing its activity, such as which generators it loads and which documents it requests previews and thumbnails for.
        property_list_key { 'Quick Look Debugging':
            ensure  => present,
            path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
            key     => 'QLEnableLogging',
            value   => true,
            value_type  => 'boolean',
        }

        property_list_key { 'Show All File Extensions':
            ensure  => present,
            path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
            key     => 'AppleShowAllExtensions',
            value   => true,
            value_type  => 'boolean',
        }

        property_list_key { 'Disable Resume system-wide':
            ensure  => present,
            path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
            key     => 'NSQuitAlwaysKeepsWindows',
            value   => false,
            value_type  => 'boolean',
        }

        property_list_key { 'Enable Extension Change Warning':
            ensure  => present,
            path    => "${my_homedir}/Library/Preferences/.GlobalPreferences.plist",
            key     => 'FXEnableExtensionChangeWarning',
            value   => false,
            value_type  => 'boolean',
            notify      => Exec['Restart Finder'],
        }

        exec { 'Restart Finder':
            command         => '/usr/bin/killall -HUP Finder',
            refreshonly     => true,
        }

        File {
            owner => $my_username,
            group => 'staff',
            mode  => '0644',
        }
}
