#!/bin/bash

sudo rm /etc/ssh/sshd_config
echo "Include /etc/ssh/sshd_config.d/*.conf"\
"\nPort 3300"\
"\nLoginGraceTime 2m"\
"\nPermitRootLogin prohibit-password"\
"\nStrictModes yes"\
"\nMaxAuthTries 2"\
"\nMaxSessions 3"\
"\nPubkeyAuthentication yes"\
"\nAuthorizedKeysFile	.ssh/authorized_keys .ssh/authorized_keys2"\
"\nPasswordAuthentication yes"\
"\nPermitEmptyPasswords no"\
"\nAllowGroups sshuser"\
"\nChallengeResponseAuthentication no"\
"\nUsePAM yes"\
"\nX11Forwarding no"\
"\nPrintMotd no"\
"\nClientAliveInterval 60"\
"\nClientAliveCountMax 3"\
"\nAcceptEnv LANG LC_*"\
"\nSubsystem sftp	/usr/lib/openssh/sftp-server" > sshd_config
chmod 644 sshd_config
sudo mv sshd_config /etc/ssh/sshd_config
sudo service sshd restart
sudo ufw allow 3300

