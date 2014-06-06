class people::wbs75::config::safari_config (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ) {

    File {
        owner => $my_username,
        group => 'admin',
        mode  => '0600',
    }

    ##############
    ### Safari ###
    ##############

    file { '.Safari Plist':
        ensure  => file,
        require => Property_list_key['Backspace Key Navigation Enabled', 'Downloads Clearing Policy', 'History Age In Days Limit', 'Home Page', 'Local File Restrictions Enabled', 'DNS Prefetching Enabled', 'Include Toolbar Redesign', 'Disable Top Sites', 'Enable Form Modification On Close', 'Disable Animated Images', 'Disable Animated Image Looping', 'Disable CoverFlow View In Bookmarks View', 'Use Encoding Detector', 'Include Fancy URL Completion List', 'Include Google Suggestions', 'Grammar Checking Enabled', 'Continuous Spell Checking Enabled', 'Disable Print Backgrounds'],
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        mode    => '0600',
    }

    property_list_key { 'Backspace Key Navigation Enabled':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'Downloads Clearing Policy':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'Downloads Clearing Policy',
        value      => 1,
        value_type => 'integer',
    }

    property_list_key { 'History Age In Days Limit':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'HistoryAgeInDaysLimit',
        value      => 1,
        value_type => 'integer',
    }

    property_list_key { 'Home Page':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'HomePage',
        value      => 'https://google.com/',
        value_type => 'string',
    }

    property_list_key { 'Local File Restrictions Enabled':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'LocalFileRestrictionsEnabled',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'DNS Prefetching Enabled':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'WebKitDNSPrefetchingEnabled',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'Include Toolbar Redesign':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'DebugSafari4IncludeToolbarRedesign',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'Disable Top Sites':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'DebugSafari4IncludeTopSites',
        value      => false,
        value_type => 'boolean',
    }

    property_list_key { 'Enable Form Modification On Close':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'DebugConfirmTossingUnsubmittedFormText',
        value      => false,
        value_type => 'boolean',
    }

    property_list_key { 'Disable Animated Images':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'WebKitAllowAnimatedImagesPreferenceKey',
        value      => false,
        value_type => 'boolean',
    }

    property_list_key { 'Disable Animated Image Looping':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'WebKitAllowAnimatedImageLoopingPreferenceKey',
        value      => false,
        value_type => 'boolean',
    }

    property_list_key { 'Disable CoverFlow View In Bookmarks View':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'DebugSafari4IncludeFlowViewInBookmarksView',
        value      => false,
        value_type => 'boolean',
    }

    property_list_key { 'Use Encoding Detector':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'WebKitUsesEncodingDetector',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'Include Fancy URL Completion List':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'DebugSafari4IncludeFancyURLCompletionList',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'Include Google Suggestions':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'DebugSafari4IncludeGoogleSuggest',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'Grammar Checking Enabled':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'WebGrammarCheckingEnabled',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'Continuous Spell Checking Enabled':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'WebContinuousSpellCheckingEnabled',
        value      => true,
        value_type => 'boolean',
    }

    property_list_key { 'Disable Print Backgrounds':
        ensure  => present,
        path    => "${my_homedir}/Library/Preferences/com.apple.Safari.plist",
        key     => 'WebKitShouldPrintBackgroundsPreference',
        value      => false,
        value_type => 'boolean',
    }

}

