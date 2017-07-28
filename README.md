# Discourse Deploy

#### Table of Contents

1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)

## Description

Installs discourse docker on a system and configures it

## Parameters  
* `type`
Whether the discourse installation should be standalone or web_only (default: standalone)

* `postgres_socket`
What postgres socket should discourse use to connect to the postgres db. [only for web_only] (default: '')

* `postgres_username`
What postgres username should discourse use to connect to the postgres db. [only for web_only] (default: '')

* `postgres_password`
What postgres password should discourse use to connect to the postgres db. [only for web_only] (default: '')

* `postgres_host`
What postgres_host should discourse use to connect to the postgres db. [only for web_only] (default: '')

* `redis_host`
What redis host should discourse use to connect to the redis server. [only for web_only] (default: '')

* `dev_emails`
What developer emails should be added to discourse. (default: '')

* `domain`
What should be the domain name of the discourse installation. (default: '')

* `smtp_address`
What smtp address should discourse use to connect to the smtp server (default: '')

* `smtp_username`
What smtp username should discourse use to connect to the smtp server (default: '')

* `smtp_password`
What smtp password should discourse use to connect to the smtp server (default: '')

* `smtp_port`
What smtp port should discourse use to connect to the smtp server (default: 587)

* `smtp_tls`
should discourse use tls to connect to the smtp server (default: true)

* `after_install`
Commands to be run inside to docket after installation (default: [])

* `plugins`
Plugins to be installed (default: [])

* `sidekiqs`
No. sidekiqs to be run. Zero is considered as automatic(default: 0)

* `manage`
should puppet manage the discourse installation by building and rebuilding (default: true)

* `templates`
list of docker templates to add (default: []]).
eg: ["cloudflare"]

## Usage
Install discourse with default configuration
```puppet
    class{ 'discourse_deploy': }
```

Install discourse with custom configuration
```puppet
    class{ 'discourse_deploy': 
        domain => 'discourse.example.com',
        dev_emails => 'dev@host.com'
    }
```

## Limitations

This is limited to linux installations and Puppet v4 and above

## Release Notes/Contributors/Etc. 

---------Unstable------------------  
v0.1.0 - Created Module  
v0.1.3 - Fixed major bugs  
v0.1.4 - Fixed web_only.pp  
----------Stable-------------------  
v1.0.0 - Fixed major bugs. Made sidekiqs param as Integer  
v1.1.0 - Fix more bugs including the invalid app.yml  
v1.1.1 - emergency bug fix  