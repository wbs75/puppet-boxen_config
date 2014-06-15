class projects::desktop {

    file { 'Default Desktop':
        ensure  => file,
        path    =>"/System/Library/CoreServices/DefaultDesktop.jpg",
        mode    =>'0755',
    }

    class { 'ruby::global':
        version => '2.0.0-p451'
    }

    ruby_gem { "Desktop for 2.0.0":
        gem             => 'desktop',
        version         => '1.1.1',
        ruby_version    => '2.0.0-p451',
        notify          => Exec['Set Desktop'],
    }

    exec { 'Set Desktop':
        user        => 'root',
        command     =>  '/usr/bin/sudo /opt/rubies/2.0.0-p451/bin/desktop http://fc05.deviantart.net/fs71/f/2012/282/6/c/apple_dark_by_mikesgame-d5hb6i1.jpg',
        require     =>  Ruby_gem['Desktop for 2.0.0']
    }
}
