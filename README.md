[![Build Status](https://travis-ci.org/030/ansible-sensu-client.svg?branch=master)](https://travis-ci.org/030/ansible-sensu-client)

ansible-sensu-client
====================

Installs and configures sensu-client.

Requirements
------------

This role requires a running sensu-server, sensu-api and a messagebroker, e.g. rabbitmq.

Role Variables
--------------

* sensu_client_checks_metrics

```
sensu_client_checks_metrics:
  - name: check-cpu
    interval: 200
```

* sensu_client_websites

```
sensu_client_websites:
  - name: website1
    url: http://unknownwebsite123
    keyword: unknown
    handlers:
      - mailer
      - someOtherHandler
  - name: website2
    url: http://unknownwebsite456
    keyword: unknown
    response_code: 405
    interval: 50
```

* sensu_client_ports

```
sensu_client_ports:
  - name: helloPort
    number: 123
    handlers:
      - mailer
      - someOtherHandler
    interval: 300
```

* sensu_client_procs

check whether a certain process, e.g. supervisor still runs

```
sensu_client_procs:
  - process: supervisor
```

* plugins

```
sensu_plugin_install:
  - name: cpu-checks
    version: 1.0.0
  - name: disk-checks
    version: 2.0.1
```

Dependencies
------------

* 030.sensu-install
* 030.sensu-plugin-install
* geerlingguy.ntp

Example Playbook
----------------

```
- hosts: servers
  roles:
    - { role: 030.sensu-client }
```

Additional testing
------------------

```
sh tests/template.sh
```

License
-------

MIT

Author Information
------------------

http://stackexchange.com/users/3302040/030
