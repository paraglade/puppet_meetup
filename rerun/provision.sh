#!/bin/bash -x

function run_step {

  cmd=$*
  cmd_hash=$(echo ${cmd} | md5sum | cut -d " " -f 1)
  cmd_hash_file="/tmp/.step-${cmd_hash}"
  [ ! -e ${cmd_hash_file} ] && ${cmd} && touch ${cmd_hash_file}
}

run_step apt-get update
run_step apt-get upgrade -y
run_step apt-get install -y git zip autoconf discount python-pygments
run_step apt-get autoremove -y

run_step git clone https://github.com/rerun/rerun.git

run_step cp rerun/rerun /usr/bin
run_step cp rerun/etc/bash_completion.sh /etc/bash_completion.d/rerun
run_step mkdir -p /var/rerun
run_step cp -a rerun/modules /var/rerun/modules
run_step rm -rf rerun
