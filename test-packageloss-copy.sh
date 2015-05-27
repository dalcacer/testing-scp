#!/bin/bash
TIME=/usr/bin/time
OUT=scp-packageloss-filecopy.txt
cat /dev/null > $OUT

function measure() {
  echo "$1 package loss" >> $OUT
  tc qdisc add dev eth1 root netem loss $1%

  for i in {1..5}
  do
    ($TIME -f "%e" scp /vagrant/jdom-2.0.6.zip vagrant@minion:~/) 2>> $OUT
    ssh vagrant@minion rm ~/jdom-2.0.6.zip
    sleep 5
  done

  tc qdisc del dev eth1 root netem loss $1%
}



for i in {0..60..5}
  do
    measure $i
  done
