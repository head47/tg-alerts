# tg-alerts

A simple Telegram bot to alert its owner on incoming SSH logins.

## Setup

1. Copy the `tg-alerts/` subdirectory to `/opt/`
2. Specify the correct user ID and bot API key in `creds.conf`
3. Specify the correct hostname and IP in `login.sh`
4. Add this to your `/etc/sshd_config`:
```bash
# login alerts
ForceCommand /opt/tg-alerts/login_wrapper.sh
```
5. Done! You will now receive a message when a user logs in via SSH.
