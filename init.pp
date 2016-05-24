
# Used to define/realize users on Puppet-managed systems
#
class accounts {

	package {
	 'vim':
    ensure => 'installed',
    }
    package{
 'curl':
    ensure => 'installed',
    }
    package{
 'git':
    ensure => 'installed',
	}


  @accounts::virtual { 'monitor':
    uid             =>  1001,
    realname        =>  'Monitor',
    pass            =>  'nailcutter',
  }

  file { '/home/monitor/scripts':
    ensure => 'directory',
  }

  wget::fetch { "download github":
  source      => 'https://github.com/LoveKalashnikov/VoyagerAdrianClifton.git',
  destination => '/home/monitor/scripts/',
  timeout     => 0,
  verbose     => false,
  cache_file  => 'memory_check',
}

  file { '/home/monitor/src':
    ensure => 'directory',
  }

  file { '/home/monitor/src':
    ensure => 'my_memory_check',
    target => '/home/monitor/scripts/memory_check',
  }

}

