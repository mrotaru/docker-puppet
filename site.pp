file { '/tmp/hello-file':
  ensure  => 'present',
  content => "Hello Puppet & Docker!\n",
  mode    => '0644',
}
