class people::wbs75::config::safari_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    ##############
    ### Safari ###
    ##############

    File {
        owner => $my_username,
        group => 'staff',
        mode  => '0644',
    }

    property_list_key { 'Backspace Key Navigation Enabled':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Downloads Clearing Policy':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'Downloads Clearing Policy',
        value       =>  1,
        value_type  =>  'integer',
    }

    property_list_key { 'History Age In Days Limit':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'HistoryAgeInDaysLimit',
        value       =>  1,
        value_type  =>  'integer',
    }

    property_list_key { 'Home Page':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'HomePage',
        value       =>  'https://google.com/',
        value_type  =>  'string',
    }

    property_list_key { 'Local File Restrictions Enabled':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'LocalFileRestrictionsEnabled',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'DNS Prefetching Enabled':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'WebKitDNSPrefetchingEnabled',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Include Toolbar Redesign':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'DebugSafari4IncludeToolbarRedesign',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable Top Sites':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'DebugSafari4IncludeTopSites',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Enable Form Modification On Close':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'DebugConfirmTossingUnsubmittedFormText',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable Animated Images':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'WebKitAllowAnimatedImagesPreferenceKey',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable Animated Image Looping':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'WebKitAllowAnimatedImageLoopingPreferenceKey',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable CoverFlow View In Bookmarks View':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'DebugSafari4IncludeFlowViewInBookmarksView',
        value       =>  false,
        value_type  =>  'boolean',
    }

    property_list_key { 'Use Encoding Detector':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'WebKitUsesEncodingDetector',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Include Fancy URL Completion List':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'DebugSafari4IncludeFancyURLCompletionList',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Include Google Suggestions':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'DebugSafari4IncludeGoogleSuggest',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Grammar Checking Enabled':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'WebGrammarCheckingEnabled',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Continuous Spell Checking Enabled':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'WebContinuousSpellCheckingEnabled',
        value       =>  true,
        value_type  =>  'boolean',
    }

    property_list_key { 'Disable Print Backgrounds':
        ensure      =>  present,
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key         =>  'WebKitShouldPrintBackgroundsPreference',
        value       =>  false,
        value_type  =>  'boolean',
    }

    file { 'Safari Plist':
        ensure      =>  file,
        require     =>  [
                            Property_list_key['Backspace Key Navigation Enabled'],
                            Property_list_key['Downloads Clearing Policy'],
                            Property_list_key['History Age In Days Limit'],
                            Property_list_key['Home Page'],
                            Property_list_key['Local File Restrictions Enabled'],
                            Property_list_key['DNS Prefetching Enabled'],
                            Property_list_key['Include Toolbar Redesign'],
                            Property_list_key['Disable Top Sites'],
                            Property_list_key['Enable Form Modification On Close'],
                            Property_list_key['Disable Animated Images'],
                            Property_list_key['Disable Animated Image Looping'],
                            Property_list_key['Disable CoverFlow View In Bookmarks View'],
                            Property_list_key['Use Encoding Detector'],
                            Property_list_key['Include Fancy URL Completion List'],
                            Property_list_key['Include Google Suggestions'],
                            Property_list_key['Grammar Checking Enabled'],
                            Property_list_key['Continuous Spell Checking Enabled'],
                            Property_list_key['Disable Print Backgrounds'],
                        ],
        path        =>  "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        mode        =>  '0600',
        notify      =>  Exec['Defaults Read Safari Plist'],
    }

    exec { 'Defaults Read Safari Plist':
        command     => "defaults read ${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        path        =>  "/usr/bin/",
    }

}



