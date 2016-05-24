
# Used to define/realize users on Puppet-managed systems
#
class accounts {

  @accounts::virtual { 'monitor':
    uid             =>  1001,
    realname        =>  'Monitor',
    pass            =>  '<password hash goes here>',
  }
}

node default {
}

node 'server.domain.net' {
  include accounts
  realize (Accounts::Virtual['johndoe'])
}