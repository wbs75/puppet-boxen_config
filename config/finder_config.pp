class people::wbs75::config::finder_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    ###################
    # Finder Settings #
    ###################

    File {
        owner => $my_username,
        group => 'staff',
        mode  => '0644',
    }

    include osx::finder::show_external_hard_drives_on_desktop
    include osx::finder::show_hard_drives_on_desktop
    include osx::finder::show_mounted_servers_on_desktop
    include osx::finder::show_removable_media_on_desktop
    include osx::finder::show_all_on_desktop
    include osx::finder::unhide_library
    include osx::finder::show_hidden_files
    include osx::finder::enable_quicklook_text_selection

    property_list_key { 'Animate Window Zoom':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'AnimateWindowZoom',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable Show Posix Path In Title':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  '_FXShowPosixPathInTitle',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable Animation WindowZoom':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'AnimateWindowZoom',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Enable Cut':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'AllowCutForItems',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable All Animations':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'DisableAllAnimations',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable Fancy Window Transition':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'FXDisableFancyWindowTransition',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable Extension Change Warning':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'FXEnableExtensionChangeWarning',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Enable Quickview SlowMotion':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'QLEnableSlowMotion',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Enable XRay Folders':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'QLEnableXRayFolders',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Enable Quit Menu':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'QuitMenuItem',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Restore Window State':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'RestoreWindowState',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Show Custom Icons For Remote Volumes':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'ShowCustomIconsForRemoteVolumes',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Show Custom Icons For Removable Volumes':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'ShowCustomIconsForRemovableVolumes',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Sidebar Tags Section Closed':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'SidebarTagsSctionDisclosedState',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Warn On Empty Trash':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'WarnOnEmptyTrash',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Preferred View Style':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'FXPreferredViewStyle',
        value       =>  'clmv',
        value_type  =>  'string',
    }

    property_list_key { 'Desktop View Settings, Arranged By':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'arrangeBy',
        value       =>  'kind',
        value_type  =>  'string',
    }

    property_list_key { 'Show Icon Preview':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'showIconPreview',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Animate Window Zoom':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        key         =>  'AnimateWindowZoom',
        value       =>  false,
        value_type  =>  'boolean',
    }

    file { 'Finder Plist':
        ensure  => file,
        require => [
                        Property_list_key['Animate Window Zoom'],
                        Property_list_key['Disable Show Posix Path In Title'],
                        Property_list_key['Disable Animation WindowZoom'],
                        Property_list_key['Enable Cut'],
                        Property_list_key['Disable All Animations'],
                        Property_list_key['Disable Fancy Window Transition'],
                        Property_list_key['Disable Extension Change Warning'],
                        Property_list_key['Enable Quickview SlowMotion'],
                        Property_list_key['Enable XRay Folders'],
                        Property_list_key['Enable Quit Menu'],
                        Property_list_key['Restore Window State'],
                        Property_list_key['Show Custom Icons For Remote Volumes'],
                        Property_list_key['Show Custom Icons For Removable Volumes'],
                        Property_list_key['Sidebar Tags Section Closed'],
                        Property_list_key['Warn On Empty Trash'],
                        Property_list_key['Preferred View Style'],
                        Property_list_key['Desktop View Settings, Arranged By'],
                        Property_list_key['Show Icon Preview'],
                    ],
        path    =>  "${my_homedir}/Library/Preferences/com.apple.finder.plist",
        mode    =>  '0600',
        notify      =>  [
                            Exec['Defaults Read Finder Plist'],
                            Exec['Restart the User_Config Finder'],
                        ],
    }

    exec { 'Defaults Read Finder Plist':
        command     => "defaults read ${my_homedir}/Library/Preferences/com.apple.finder.plist",
        path        =>  "/usr/bin/",
    }

    exec { 'Restart the User_Config Finder':
        command     => '/usr/bin/killall -HUP Finder',
        refreshonly => true,
    }

}
