Simple setup to test scp/ssh and its fitness for a specific project.


* `vagrant up`
* `vagrant ssh master`
  * `ssh-keygen -t rsa`
  * `scp /home/vagrant/.ssh/id_rsa.pub vagrant@minion:~/.ssh/authorized_keys`
  * `sudo cp id_rsa* /root/.ssh/`

* in gui
  *  `cd /vagrant`
  * `sudo ./test-bandwidth-copy.sh && sudo ./test-packageloss-copy.sh`
