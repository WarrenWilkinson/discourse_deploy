# Class: discourse_deploy
# ===========================
#
# Installs and deploys discourse docker
#
# Parameters
# ----------
#
# * `type`
# Whether the discourse installation should be standalone or web_only (default: standalone)
#
# * `postgres_socket`
# What postgres socket should discourse use to connect to the postgres db. [only for web_only] (default: '')
#
# * `postgres_username`
# What postgres username should discourse use to connect to the postgres db. [only for web_only] (default: '')
#
# * `postgres_password`
# What postgres password should discourse use to connect to the postgres db. [only for web_only] (default: '')
#
# * `postgres_host`
# What postgres_host should discourse use to connect to the postgres db. [only for web_only] (default: '')
#
# * `redis_host`
# What redis host should discourse use to connect to the redis server. [only for web_only] (default: '')
#
# * `dev_emails`
# What developer emails should be added to discourse. (default: '')
#
# * `domain`
# What should be the domain name of the discourse installation. (default: '')
#
# * `smtp_address`
# What smtp address should discourse use to connect to the smtp server (default: '')
#
# * `smtp_username`
# What smtp username should discourse use to connect to the smtp server (default: '')
#
# * `smtp_password`
# What smtp password should discourse use to connect to the smtp server (default: '')
#
# * `smtp_port`
# What smtp port should discourse use to connect to the smtp server (default: 587)
#
# * `smtp_tls`
# should discourse use tls to connect to the smtp server (default: true)
#
# * `after_install`
# Commands to be run inside to docket after installation (default: [])
#
# * `plugins`
# Plugins to be installed (default: [])
#
# * `sidekiqs`
# No. sidekiqs to be run (default: automatic)
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# Examples
# --------
#
# @example
#    class { 'discourse_deploy':
#      domain => 'discourse.example.com',
#      dev_emails => 'dev@host.com'
#    }
#
# Authors
# -------
#
# Melroy <meldsza@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2017 Melroy Neil Dsouza
#
class discourse_deploy (
      String $type = 'standalone',
      String $postgres_socket = '',
      String $postgres_username ='', 
      String $postgres_password ='',
      String $postgres_host ='', 
      String $redis_host = '', 
      String $dev_emails = '' , 
      String $domain = '', 
      String $smtp_address = '', 
      String $smtp_username = '',
      String $smtp_port = 587, 
      String $smtp_password = '',
      Boolean $smtp_tls  = true ,
      Array $after_install =[], 
      Array $plugins = [],
      $sidekiqs = false
      ){
  $allowed_types = ['^standalone$','^web_only$']
  validate_re($type, $allowed_types)
  package{ 'docker':
    ensure => 'present'
  }
  service{ 'docker':
    ensure => 'running',
    enable => true
  }
  ->vcsrepo{ '/var/discourse/':
    ensure   => 'present',
    provider => 'git',
    source   => 'https://github.com/discourse/discourse_docker.git'
  }
  ->file{ '/var/discourse/containers/app.yml':
    ensure => 'file',
    source => epp("discourse_deploy/templates/${type}.epp")
  }
  ->exec { './launcher bootstrap app':
    cwd     => '/var/discourse/'
  }
  ->exec { './launcher start app':
    cwd     => '/var/discourse/'
  }
}
