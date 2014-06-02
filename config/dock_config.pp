class people::wbs75::config::dock_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    #################
    # Dock Settings #
    #################

    # Dock prefs only take effect when you restart the dock
    property_list_key { 'Hide the dock':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key     => 'autohide',
        value   => true,
        value_type => 'boolean',
        notify     => Exec['Restart the Dock'],
    }

    exec { 'Restart the Dock':
        command     => '/usr/bin/killall -HUP Dock',
        refreshonly   => true,
    }

    property_list_key { 'Disable Mission Control':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key     => 'mcx-expose-disabled',
        value   => true,
        value_type => 'boolean',
        notify     => Exec['Restart the Dock'],
    }

    property_list_key { 'launchanim':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key     => 'launchanim',
        value   => false,
        value_type    => 'boolean',
        notify     => Exec['Restart the Dock'],
    }

    property_list_key { 'dock alignment':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key     => 'pinning',
        value   => 'middle',
        value_type    => 'string',
        notify     => Exec['Restart the Dock'],
    }

    property_list_key { 'magnification':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key     => 'magnification',
        value   => true,
        value_type    => 'boolean',
        notify     => Exec['Restart the Dock'],
    }

    property_list_key { 'mineffect':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key     => 'mineffect',
        value   => 'scale',
        value_type    => 'string',
        notify     => Exec['Restart the Dock'],
    }

    property_list_key { 'mod-count':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key     => 'mod-count',
        value   => 64,
        value_type    => 'integer',
        notify     => Exec['Restart the Dock'],
    }

    property_list_key { 'mouse-over-hilte-stack':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key     => 'mouse-over-hilte-stack',
        value   => true,
        value_type    => 'boolean',
        notify     => Exec['Restart the Dock'],
    }

    property_list_key { 'no-bouncing':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key     => 'no-bouncing',
        value   => true,
        value_type    => 'boolean',
        notify     => Exec['Restart the Dock'],
    }

    property_list_key { 'no-glass':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key     => 'no-glass',
        value   => true,
        value_type    => 'boolean',
        notify     => Exec['Restart the Dock'],
    }

    property_list_key { 'tilesize':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key     => 'tilesize',
        value   => 27,
        value_type    => 'real',
        notify     => Exec['Restart the Dock'],
    }

    property_list_key { 'use-new-list-stack':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.dock.plist",
        key     => 'use-new-list-stack',
        value   => true,
        value_type    => 'boolean',
        notify     => Exec['Restart the Dock'],
    }

}
