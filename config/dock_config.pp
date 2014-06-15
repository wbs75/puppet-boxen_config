class people::wbs75::config::dock_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    #################
    # Dock Settings #
    #################

    File {
      owner => $my_username,
      group => 'staff',
      mode  => '0644',
    }

    property_list_key { 'Disable Mission Control':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'mcx-expose-disabled',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Launchanim':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'launchanim',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Dock Alignment':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'pinning',
        value       =>  'middle',
        value_type  =>  'string',
    }

    property_list_key { 'Magnification':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'magnification',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Mineffect':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'mineffect',
        value       =>  'scale',
        value_type  =>  'string',
    }

    property_list_key { 'Mouse-over-hilte-stack':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'mouse-over-hilte-stack',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'No-bouncing':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'no-bouncing',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'No-glass':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'no-glass',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Use-new-list-stack':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'use-new-list-stack',
        value       =>  true,
        value_type  =>  'boolean',
    }

    file { 'Dock Plist':
        ensure      =>  file,
        require     =>  [
                            Property_list_key['Disable Mission Control'],
                            Property_list_key['Launchanim'],
                            Property_list_key['Dock Alignment'],
                            Property_list_key['Magnification'],
                            Property_list_key['Mineffect'],
                            Property_list_key['Mouse-over-hilte-stack'],
                            Property_list_key['No-bouncing'],
                            Property_list_key['No-glass'],
                            Property_list_key['Use-new-list-stack'],
                        ],
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        mode        =>  '0600',
        notify      =>  Exec['Defaults Read Dock Plist'],
                        
    }

    exec { 'Defaults Read Dock Plist':
        user        => "${my_username}",
        command     => '/usr/bin/defaults read ~/Library/Preferences/com.apple.dock.plist',
    }

    exec { 'Restart the Dock':
        command     => '/usr/bin/killall -HUP Dock',
        refreshonly => true,
    }

}
