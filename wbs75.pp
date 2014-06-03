class people::wbs75 {

    include people::wbs75::params
    class {'people::wbs75::config::system_config': } ->
    class {'people::wbs75::config::global_config': } ->
    class {'people::wbs75::config::user_config': } ->
    class {'people::wbs75::config::dock_config': } ->
    class {'people::wbs75::config::diskutility_config': } ->
    class {'people::wbs75::config::finder_config': } ->
    class {'people::wbs75::config::itunes_config': } ->
    class {'people::wbs75::config::remotedesktop_config': } ->
    class {'people::wbs75::config::safari_config': }

}
