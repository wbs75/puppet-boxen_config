class projects::osx_vm_templates (
    $my_homedir   = $people::wbs75::params::my_homedir,
    $my_sourcedir = $people::wbs75::params::my_sourcedir,
    $my_username  = $people::wbs75::params::my_username
    ){

    repository { "${my_sourcedir}/osx_vm_templates":
        ensure   => 'origin/HEAD',
    	source   => 'timsutton/osx-vm-templates',
  	}
}
