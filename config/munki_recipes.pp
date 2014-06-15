class projects::munki_recipes (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ){

    repository { "${my_sourcedir}/recipes":
        ensure   => 'origin/HEAD',
        source  => 'wbs75/recipes',
    }

    repository { "${my_sourcedir}/autopkg-recipes":
        ensure   => 'origin/HEAD',
        source  => 'wbs75/autopkg-recipes',
    }
}
