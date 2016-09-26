[![Build Status](https://travis-ci.org/030/ansible-sensu-client.svg?branch=master)](https://travis-ci.org/030/ansible-sensu-client)

ansible-sensu-client
====================

Installs and configures sensu-client.

Requirements
------------

This role requires a running sensu-server, sensu-api and a messagebroker, e.g. rabbitmq.

Role Variables
--------------

* monitor websites

```
sensu_client_websites:
  - name: website1
    url: http://unknownwebsite123
    keyword: unknown
  - name: website2
    url: http://unknownwebsite456
    keyword: unknown
```

Dependencies
------------

* 030.sensu-install
* geerlingguy.ntp

Example Playbook
----------------

```
- hosts: servers
  roles:
    - { role: 030.sensu-client }
```

License
-------

MIT

Author Information
------------------

http://stackexchange.com/users/3302040/030
