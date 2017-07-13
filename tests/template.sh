###TODO###

##check ports
#ansible all -i "localhost," -c local -m template -a "src=checks.j2 dest=./test.txt" --extra-vars='{"sensu_client_ports": [{"number":80,"handlers":["mailer","sms"]},{"number":81,"handlers":["somehandler"],"interval":300}]}' && cat test.txt
#
##check ports without handlers
#ansible all -i "localhost," -c local -m template -a "src=checks.j2 dest=./test.txt" --extra-vars='{"sensu_client_ports": [{"number":80},{"number":81,"interval":300}]}' && cat test.txt
#
##check websites
#ansible all -i "localhost," -c local -m template -a "src=checks.j2 dest=./test.txt" --extra-vars='{"sensu_client_websites": [{"name":"google","url":"http://google.com","keyword":"google"},{"name":"google","url":"http://google.com","keyword":"google","response_code":302,"handlers":["mailer","sms"]}]}' && cat test.txt
#
##check websites without handlers
#ansible all -i "localhost," -c local -m template -a "src=checks.j2 dest=./test.txt" --extra-vars='{"sensu_client_websites": [{"name":"google","url":"http://google.com","keyword":"google"},{"name":"google","url":"http://google.com","keyword":"google","response_code":302}]}' && cat test.txt
#
#echo "Check websites without keyword"
#ansible all -i "localhost," -c local -m template -a "src=checks.j2 dest=./test.txt" --extra-vars='{"sensu_client_websites": [{"name":"google","url":"http://google.com"},{"name":"google","url":"http://google.com","keyword":"google","response_code":302}]}' && cat test.txt && export CKSUM=$(cksum test.txt | awk '{ print $1 }') && [ "$CKSUM" -eq "547109648" ]
#
##check metrics
#ansible all -i "localhost," -c local -m template -a "src=checks.j2 dest=./test.txt" --extra-vars='{"sensu_client_checks_metrics": [{"name":"check-disk-usage","handlers":["mailer","sms"]},{"name":"hallo","handlers":["sms"]},{"name":"world_metrics"}], "sensu_client_check_disk_ignore_path_regex": "haha"}' && cat test.txt
#
##check metrics without handlers
#ansible all -i "localhost," -c local -m template -a "src=checks.j2 dest=./test.txt" --extra-vars='{"sensu_client_checks_metrics": [{"name":"check-disk-usage"},{"name":"hallo"},{"name":"world_metrics"}], "sensu_client_check_disk_ignore_path_regex": "haha"}' && cat test.txt
#
#ansible all -i "localhost," -c local -m template -a "src=checks.j2 dest=./test.txt" --extra-vars='@tests/gh87-subscriptions.yml' && cat test.txt
#
#ansible all -i "localhost," -c local -m template -a "src=checks.j2 dest=./test.txt" --extra-vars='@tests/gh7-procs.yml' && cat test.txt

###TODO###

echo "Check websites without keyword"
ansible all -i "localhost," -c local -m template -a "src=checks.j2 dest=./test.txt" --extra-vars='@tests/gh97-check-http.yml' && cat test.txt && export CKSUM=$(cksum test.txt | awk '{ print $1 }') && [ "$CKSUM" -eq "547109648" ]
