# Elrond-scripts
Some scripts for Elrond Battle of Nodes

## Installation
Works on Debian / Ubuntu.
`bash ufw.sh`

## Description
* You need to run this as root or with sudo.
* It reads your sshd_config for custom port, otherwise 22 default.
* Default : incoming drop & outgoing accept.
* Exceptions : sshd + ratelimiting.