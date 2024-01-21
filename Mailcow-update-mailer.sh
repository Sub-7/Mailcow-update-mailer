#!/bin/bash

#### your email address #########
email_address=your@email.address
#################################

if cd /opt/mailcow-dockerized/ && ./update.sh --check | grep -q "Updated code is available."; then
  latest_version=$(curl -sL https://github.com/mailcow/mailcow-dockerized | grep -oP '\/releases\/tag\/\K[^"]+')
  wget -O u.html https://github.com/mailcow/mailcow-dockerized/releases/tag/$latest_version
  sed -i '/<head>/,/<\/head>/d' u.html
  sed -i 's/<link[^>]*>//g; s/<meta[^>]*>//g; s/<script[^>]*>//g; s/<\/script>//g; s/<span[^>]*>.*<\/span>//g' u.html
  sed -i '1,/<div class=""   data-hpc>/d' u.html
  sed -i '/Contributors/,$d' u.html
  sed -i '/<summary>/,/<\/summary>/d' u.html
  sed -i '/<svg/,/<\/svg>/d' u.html
  sed -i '/<details/,/<\/details>/d' u.html
  sed -i '/<\/h1>/,/<h2>What'"'"'s Changed<\/h2>/ {/<\/h1>/!{/<h2>What'"'"'s Changed<\/h2>/!d}}' u.html
  sed -i 's/<div[^>]*>//g; s/<\/div>//g' u.html
  sed -i '/<h2>What'"'"'s Changed<\/h2>/i \ \ \ \ \ \ \ \ \ <span style="color: red;">⚠️ DO A BACKUP BEFORE UPDATING TO BE ON THE SAFE SIDE ⚠️<\/span>' u.html
  echo -e "\nUpdate Command: cd /opt/mailcow-dockerized/ && ./update.sh" >> u.html
  s-nail -s "Mailcow update [$latest_version] available." -M text/html $email_address < u.html
  rm u.html
else
  echo "no updates available."
fi
