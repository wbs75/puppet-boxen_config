class people::wbs75::config::terminal_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    ###################
    # Terminal Config #
    ###################

    File {
        owner   =>  $my_username,
        group   =>  'admin',
        mode    =>  '0644',
    }

    property_list_key { 'Default Window Settings':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        key         => 'Default Window Settings',
        value       => 'Pro',
        value_type  => 'string',
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
        require     => Property_list_key['Default Window Settings', 'Default Profiles Version', 'Secure Keyboard Entry', 'Shell', 'Startup Window Settings'],
        path        => "${my_homedir}/Library/Preferences/com.apple.terminal.plist",
        mode        => '0600',
    }

}


