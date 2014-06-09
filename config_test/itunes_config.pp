class people::wbs75::config::itunes_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    ###################
    # iTunes Settings #
    ###################

    File {
        owner   =>  $my_username,
        group   =>  'admin',
        mode    =>  '0644',
    }

    property_list_key { 'Disable Automatic Device Backups':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key         =>  'AutomaticDeviceBackupsDisabled',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable Check For Device Updates':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key         =>  'disableCheckForDeviceUpdates',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable Genius Sidebar':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key         =>  'disableGeniusSidebar',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable Ping':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key         =>  'disablePing',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable Ping Sidebar':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key         =>  'disablePingSidebar',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Do not Automatically Sync iOS Device':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key         =>  'dontAutomaticallySyncIPods',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Hide Ping Dropdown':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key         =>  'hide-ping-dropdown',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Look For Shared Music':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key         =>  'lookForSharedMusic',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Allow Title Resize Windows':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key         =>  'NSAllowNonTitledResizableWindows',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Remember View For Settings':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        key         =>  'remember-view-settings-for-each-source',
        value       =>  true,
        value_type  =>  'boolean',
    }

    file { 'Itunes Plist':
        ensure      =>  file,
        require     =>  Property_list_key['Disable Automatic Device Backups', 'Disable Check For Device Updates', 'Disable Genius Sidebar', 'Disable Ping', 'Disable Ping Sidebar', 'Do not Automatically Sync iOS Device', 'Hide Ping Dropdown', 'Look For Shared Music', 'Allow Title Resize Windows', 'Remember View For Settings'],
        path        =>  "${my_homedir}/Library/Preferences/com.apple.iTunes.plist",
        mode        =>  '0600',
    }

}
