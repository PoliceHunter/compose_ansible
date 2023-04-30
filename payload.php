<?php
if ($_SERVER['HTTP_X_GITHUB_EVENT'] == 'push') {
  echo shell_exec('cd /home/danila/compose_ansible/ && git pull && ansible-playbook ansible_deploy.yml');
}
?>

