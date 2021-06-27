#!/bin/bash

sudo rm /etc/ssh/sshd_config
touch sshd_config
echo "Include /etc/ssh/sshd_config.d/*.conf" >> sshd_config
echo "LoginGraceTime 2m" >> sshd_config
echo "PermitRootLogin prohibit-password" >> sshd_config
echo "StrictModes yes" >> sshd_config
echo "MaxAuthTries 2" >> sshd_config
echo "MaxSessions 3" >> sshd_config
echo "PubkeyAuthentication yes" >> sshd_config
echo "AuthorizedKeysFile	.ssh/authorized_keys .ssh/authorized_keys2" >> sshd_config
echo "PasswordAuthentication yes" >> sshd_config
echo "PermitEmptyPasswords no" >> sshd_config
echo "AllowGroups sshuser" >> sshd_config
echo "ChallengeResponseAuthentication no" >> sshd_config
echo "UsePAM yes" >> sshd_config
echo "X11Forwarding no" >> sshd_config
echo "PrintMotd no" >> sshd_config
echo "ClientAliveInterval 60" >> sshd_config
echo "ClientAliveCountMax 3" >> sshd_config
echo "AcceptEnv LANG LC_*" >> sshd_config
echo "Subsystem sftp	/usr/lib/openssh/sftp-server" >> sshd_config
chmod 644 sshd_config
sudo mv sshd_config /etc/ssh/sshd_config
sudo service sshd restart
