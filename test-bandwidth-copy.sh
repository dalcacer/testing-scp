#!/bin/bash
TIME=/usr/bin/time
OUT=scp-bandwidht-filecopy.txt
cat /dev/null > $OUT


function measure() {
  echo "$1 bandwidth" >> $OUT
  # egress limit
  tc qdisc add dev eth1 handle 1: root htb default 11
  tc class add dev eth1 parent 1: classid 1:1 htb rate $1kbps
  tc class add dev eth1 parent 1:1 classid 1:11 htb rate $1kbps

  for i in {1..5}
  do

    ($TIME -f "%e" scp /vagrant/jdom-2.0.6.zip vagrant@minion:~/) 2>> $OUT
    ssh vagrant@minion rm ~/jdom-2.0.6.zip
    sleep 5
  done

  #remove egress
  tc qdisc del dev eth1 root    &>/dev/null
}


#for i in 102400 24576 3072 2048 1024 250 40 20
for i in 2048 1024 250 40 20
  do
    measure $i
  done
