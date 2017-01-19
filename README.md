[![Build Status](https://travis-ci.org/030/ansible-sensu-client.svg?branch=master)](https://travis-ci.org/030/ansible-sensu-client)

ansible-sensu-client
====================

Installs and configures sensu-client.

Requirements
------------

This role requires a running sensu-server, sensu-api and a messagebroker, e.g. rabbitmq.

Role Variables
--------------

* checks

```
- cmd: check-cpu
```

* metrics

```
- cmd: metrics-memory-percent
  handlers:
    - relay
```

* websites

```
- name: google
  cmd: check-http
  url: https://google.com
  keyword: google
  interval: 300
```

* ports

```
- name: software-name
  cmd: check-ports
  port: 234
  interval: 30
  handlers:
    - mailer
    - sms
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
ansible all -i "localhost," -c local -m template -a "src=checks.j2 dest=./test.txt" --extra-vars='{"sensu_client_checks_metrics": [{"name":"hello","cmd":"check-http","url":"http://hello","keyword":"world"},{"cmd":"check-ports","port":50,"interval":30,"handlers":["mailer","sms"]},{"cmd":"check-disk-usage","handlers":[relay],"args":"cgroup -p 'jhjh'"}], "sensu_client_check_disk_ignore_path_regex": "haha"}' && cat test.txt
```

License
-------

MIT

Author Information
------------------

http://stackexchange.com/users/3302040/030
