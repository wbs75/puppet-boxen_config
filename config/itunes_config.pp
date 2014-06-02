class people::wbs75::config::itunes_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {
    
    ###################
    # iTunes Settings #
    ###################

    property_list_key { 'AutomaticDeviceBackupsDisabled':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key     => 'AutomaticDeviceBackupsDisabled',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'disableCheckForDeviceUpdates':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key     => 'disableCheckForDeviceUpdates',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'disableGeniusSidebar':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key     => 'disableGeniusSidebar',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'disablePing':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key     => 'disablePing',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'disablePingSidebar':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key     => 'disablePingSidebar',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'dontAutomaticallySyncIPods':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key     => 'dontAutomaticallySyncIPods',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'hide-ping-dropdown':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key     => 'hide-ping-dropdown',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'lookForSharedMusic':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key     => 'lookForSharedMusic',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'NSAllowNonTitledResizableWindows':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key     => 'NSAllowNonTitledResizableWindows',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'remember-view-settings-for-each-source':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key     => 'remember-view-settings-for-each-source',
        value      => true,
        value_type => 'boolean',
    }

}
