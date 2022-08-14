# tg-alerts

A simple Telegram bot to alert its owner on incoming SSH logins.

## Setup

1. Copy the `tg-alerts/` subdirectory to `/opt/`
2. Fix permissions on `creds.conf`; only root should be able to read and write
3. Specify the correct user ID and bot API key in `creds.conf`
4. Specify the correct hostname and IP in `login.sh`
5. Add this to your `/etc/sshd_config`:
```bash
# login alerts
ForceCommand /opt/tg-alerts/login_wrapper.sh
```
6. Add this to your `/etc/sudoers`:
```
# Login alerts
Defaults!/opt/tg-alerts/login.sh env_keep += "SSH_CLIENT"
ALL ALL=NOPASSWD: /opt/tg-alerts/login.sh
```
7. Done! You will now receive a message when a user logs in via SSH.
