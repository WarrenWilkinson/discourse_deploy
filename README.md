# Discourse Deploy

#### Table of Contents

1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)

## Description

Installs discourse docker on a system and configures it

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