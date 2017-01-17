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
    response_code: 405
```

* monitor ports

```
sensu_client_ports:
  - 22
  - 80
  - 8443
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
ansible all -i "localhost," -c local -m template -a "src=checks.j2 dest=./test.txt" --extra-vars='{"sensu_client_checks_metrics": [{"name":"check-http","url":"http://hello","keyword":"world"},{"name":"check-ports","port":50,"interval":30,"handlers":["mailer","sms"]},{"name":"check-disk-usage","handlers":[relay],"args":"cgroup -p 'jhjh'"}], "sensu_client_check_disk_ignore_path_regex": "haha"}' && cat test.txt
```

License
-------

MIT

Author Information
------------------

http://stackexchange.com/users/3302040/030
