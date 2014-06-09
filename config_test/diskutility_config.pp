class people::wbs75::config::diskutility_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    ################
    # Disk Utility #
    ################

    File {
        owner   =>  $my_username,
        group   =>  'admin',
        mode    =>  '0644',
    }

    property_list_key { 'Show All Disk Formats':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.DiskUtility.plist",
        key         =>  'advanced-image-options',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Allows Disk Images As RAIDs':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.DiskUtility.plist",
        key         =>  'DUAllowsDiskImagesAsRAIDs',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Add Debug Menu':
        ensure      => present,
        path        => "${my_homedir}/Library/Preferences/com.apple.DiskUtility.plist",
        key         => 'DUDebugMenuEnabled',
        value       => true,
        value_type  => 'boolean',
    }

    property_list_key { 'Restore Skip Verifification':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.DiskUtility.plist",
        key         =>  'DURestoreCanSkipVerify',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Show Details In FirstAid':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.DiskUtility.plist",
        key         =>  'DUShowDetailsInFirstAid',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Show All Partitions':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.DiskUtility.plist",
        key         =>  'DUShowEveryPartition',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Show Extra Preferences':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.DiskUtility.plist",
        key         =>  'internal-preferences-enabled',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Show all Debug Messages':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.DiskUtility.plist",
        key         =>  'DUDebugMessageLevel',
        value       =>  4,
        value_type  =>  'integer',
    }

    file { 'DiskUtility Plist':
        ensure      =>  file,
        require     =>  Property_list_key['Show All Disk Formats', 'Allows Disk Images As RAIDs', 'Add Debug Menu', 'Restore Skip Verifification', 'Show Details In FirstAid', 'Show All Partitions', 'Show Extra Preferences', 'Show all Debug Messages'],
        path        =>  "${my_homedir}/Library/Preferences/com.apple.DiskUtility.plist",
        mode        =>  '0600',
    }

}