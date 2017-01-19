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
- name: check cpu
  cmd: check-cpu
```

* metrics

```
- name: metrics memory percent
  cmd: metrics-memory-percent
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
  - name: port 234
    cmd: check-ports
    port: 234
    interval: 30
    handlers:
      - mailer
      - sms
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
ansible all -i "localhost," -c local -m template -a "src=checks.j2 dest=./test.txt" --extra-vars='{"sensu_client_checks_metrics": [{"name":"check http","cmd":"check-http","url":"http://hello","keyword":"world"},{"name":"check ports","cmd":"check-ports","port":50,"interval":30,"handlers":["mailer","sms"]},{"name":"check disk usage","cmd":"check-disk-usage","handlers":[relay],"args":"cgroup -p 'jhjh'"}], "sensu_client_check_disk_ignore_path_regex": "haha"}' && cat test.txt
```

License
-------

MIT

Author Information
------------------

http://stackexchange.com/users/3302040/030
