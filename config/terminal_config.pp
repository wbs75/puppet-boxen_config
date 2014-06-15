class people::wbs75::config::terminal_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    ###################
    # Terminal Config #
    ###################

    File {
      owner => $my_username,
      group => 'admin',
      mode  => '0644',
    }

    property_list_key { 'Default Window Settings':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        key         => 'Default Window Settings',
        value       => 'Pro',
        value_type  => 'string',
    }

    property_list_key { 'Default Profiles Version':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        key         => 'DefaultProfilesVersion',
        value       =>  1,
        value_type  => 'integer',
    }

    property_list_key { 'Focus Follows Mouse':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        key         => 'FocusFollowsMouse',
        value       => 'true',
        value_type  => 'boolean',
    }

    property_list_key { 'Option Click To Move Cursor':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        key         => 'OptionClickToMoveCursor',
        value       => 'true',
        value_type  => 'boolean',
    }

    property_list_key { 'Has Migrated Defaults':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        key         => 'HasMigratedDefaults',
        value       => 'true',
        value_type  => 'boolean',
    }

    property_list_key { 'Startup Window Settings':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        key         => 'Startup Window Settings',
        value       => "Pro",
        value_type  => 'string',
    }

    property_list_key { 'Default Profiles Version':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        key         => 'DefaultProfilesVersion',
        value       => 1,
        value_type  => 'integer',
    }

    property_list_key { 'Secure Keyboard Entry':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        key         => 'SecureKeyboardEntry',
        value       => true,
        value_type  => 'boolean',
    }

    property_list_key { 'Shell':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        key         =>  'shell',
        value       =>  '/opt/boxen/homebrew/bin/bash',
        value_type  =>  'string',
    }

    file { 'Terminal Plist':
        ensure      => file,
        require     =>  [
                            Property_list_key['Option Click To Move Cursor'],
                            Property_list_key['Focus Follows Mouse'],
                            Property_list_key['Default Profiles Version'],
                            Property_list_key['Has Migrated Defaults'],
                            Property_list_key['Default Window Settings'],
                            Property_list_key['Default Profiles Version'],
                            Property_list_key['Secure Keyboard Entry'],
                            Property_list_key['Shell'],
                            Property_list_key['Startup Window Settings'],
                        ],
        path        => "${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        mode        => '0600',
        notify      =>   Exec['Defaults Read Terminal Plist'],
    }

    exec { 'Defaults Read Terminal Plist':
        command     =>  "defaults read ${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        path        =>  "/usr/bin/",
    }

}


