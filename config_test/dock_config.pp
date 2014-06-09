class people::wbs75::config::dock_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    #################
    # Dock Settings #
    #################

    File {
        owner   =>  $my_username,
        group   =>  'admin',
        mode    =>  '0644',
    }

    property_list_key { 'Disable Mission Control':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'mcx-expose-disabled',
        value       =>  true,
        value_type  =>  'boolean',
        notify      =>   Exec['Restart the Dock'],
    }

    property_list_key { 'Launchanim':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'launchanim',
        value       =>  false,
        value_type  =>  'boolean',
        notify      =>   Exec['Restart the Dock'],
    }

    property_list_key { 'Dock Alignment':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'pinning',
        value       =>  'middle',
        value_type  =>  'string',
        notify      =>   Exec['Restart the Dock'],
    }

    property_list_key { 'Magnification':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'magnification',
        value       =>  true,
        value_type  =>  'boolean',
        notify      =>   Exec['Restart the Dock'],
    }

    property_list_key { 'Mineffect':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'mineffect',
        value       =>  'scale',
        value_type  =>  'string',
        notify      =>   Exec['Restart the Dock'],
    }

    property_list_key { 'Mouse-over-hilte-stack':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'mouse-over-hilte-stack',
        value       =>  true,
        value_type  =>  'boolean',
        notify      =>   Exec['Restart the Dock'],
    }

    property_list_key { 'No-bouncing':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'no-bouncing',
        value       =>  true,
        value_type  =>  'boolean',
        notify      =>   Exec['Restart the Dock'],
    }

    property_list_key { 'No-glass':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'no-glass',
        value       =>  true,
        value_type  =>  'boolean',
        notify      =>   Exec['Restart the Dock'],
    }

    property_list_key { 'Use-new-list-stack':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key         =>  'use-new-list-stack',
        value       =>  true,
        value_type  =>  'boolean',
        notify      =>  Exec['Restart the Dock'],
    }

    exec { 'Restart the Dock':
        command         => '/usr/bin/killall Dock',
        refreshonly     => true,
    }

    file { 'Dock Plist':
        ensure      =>  file,
        require     =>  Property_list_key['Disable Mission Control', 'Launchanim', 'Dock Alignment', 'Magnification', 'Mineffect', 'Mouse-over-hilte-stack', 'No-bouncing', 'No-glass', 'Use-new-list-stack'],
        path        =>  "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        mode        =>  '0600',
    }

}
