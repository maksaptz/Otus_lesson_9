sed -e 's/\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\).*$/\1/' -e t -e d access-4560-644067.log | sort -r | uniq -c | sort -n -r | head
cat access-4560-644067.log | awk '{print $7}' | sort -r | uniq -c | sort -n -r | head
