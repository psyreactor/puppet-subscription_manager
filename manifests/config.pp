# subscription_manager Configuration
class subscription_manager::config {
  file { '/etc/rhsm/rhsm.conf':
    ensure  => 'file',
    content => template('subscription_manager/rhsm.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
