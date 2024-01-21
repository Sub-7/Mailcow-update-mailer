# Mailcow update mailer
- Testet on Debian GNU/Linux 12 (bookworm)
# Description
This script checks Mailcow for new updates and sends you an email if there is anything new.

[![Mailcow-update-mailer.png](https://i.postimg.cc/brsvx09t/Mailcow-update-mailer.png)](https://postimg.cc/kRP99bZJ)

# Requirements:
s-nail: is a text-based email client for Unix.
# Installation (as root on the Mailcow server):
1. Install s-nail:
```sh
apt install s-nail -y && echo "set smtp=smtp://127.0.0.1:25" | tee -a /etc/s-nail.rc
```
2. Setup:
(download script, query email address, execute)
```sh
read -p "Please enter your e-mail address: " email_address && wget -O Mailcow-update-mailer.sh https://raw.githubusercontent.com/Sub-7/Mailcow-update-mailer/main/Mailcow-update-mailer.sh && chmod +x Mailcow-update-mailer.sh && sed -i "s/^\(email_address=\).*\$/\1\"$email_address\"/" Mailcow-update-mailer.sh && ./Mailcow-update-mailer.sh
```
3. Set up daily Cronjob:
(You will be asked for the time when the daily cron job should be executed)
```sh
wget -O Mailcow-update-mailer-cronjob.sh https://raw.githubusercontent.com/Sub-7/Mailcow-update-mailer/main/Mailcow-update-mailer-cronjob.sh && bash Mailcow-update-mailer-cronjob.sh
```
# Uninstall:
```sh
apt remove --purge s-nail -y && rm Mailcow-update-mailer.sh && rm Mailcow-update-mailer-cronjob.sh
```
also edit crontab and remove line with content "03:00 * * * */root/Mailcow-update-mailer.sh"
Command: crontab -e

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/paypalme/SubS7v7n)
