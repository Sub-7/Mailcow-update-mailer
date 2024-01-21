# Mailcow update mailer
This script checks Mailcow for new updates and sends you an email if there is anything new.

[![Mailcow-update-mailer.png](https://i.postimg.cc/brsvx09t/Mailcow-update-mailer.png)](https://postimg.cc/kRP99bZJ)

# Requirements:
1. s-nail: is a text-based email client for Unix.
2. Mailcow-update-mailer Script
# Installation (as root on the Mailcow server):
Install s-nail:
```sh
apt install s-nail -y && echo "set smtp=smtp://127.0.0.1:25" | tee -a /etc/s-nail.rc
```
Setup:
Download script, query email address, execute.
```sh
read -p "Please enter your e-mail address: " email_address && wget -O Mailcow-update-mailer.sh https://raw.githubusercontent.com/Sub-7/Mailcow-update-mailer/main/Mailcow-update-mailer.sh && sed -i "s/^\(email_address=\).*\$/\1\"$email_address\"/" Mailcow-update-mailer.sh && bash Mailcow-update-mailer.sh
```
