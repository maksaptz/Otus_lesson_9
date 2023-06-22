#!/bin/bash

LOCKFILE=/var/log/.lockFile

if (set -o noclobber; echo "$$" > "$LOCKFILE") 2> /dev/null
then
	trap "rm -f '$LOCKFILE'; exit $?" TERM EXIT

	unique () {
     		 sort -r temp.md | uniq -c | sort -nr
	}
	timeStart=$(head -n 1 access-4560-644067.log | awk '{print $4 $5}' | sed 's/\[//; s/\]//')
	timeEnd=$(tail -n 1 access-4560-644067.log | awk '{print $4 $5}' | sed 's/\[//; s/\]//')
	echo "Временной диапозон: $timeStart : $timeEnd" > answers.md


	echo "Список IP адресов (с наибольшим кол-вом запросов):" >> answers.md
	sed -e 's/\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\).*$/\1/' -et -ed access-4560-644067.log > temp.md
	unique | head >> answers.md

	echo "Список запрашиваемых URL (с наибольшим кол-вом запросов):" >> answers.md
	cat access-4560-644067.log | awk '{print $7}' > temp.md
	unique | head >> answers.md

	echo "Ошибки веб-сервера/приложения c момента последнего запуска:" >> answers.md
	cat access-4560-644067.log | awk '{print $9}' | grep "^[4-5]" >> answers.md

	echo "Список всех кодов HTTP ответа с указанием их кол-ва с момента последнего запуска скрипта:" >> answers.md
	cat access-4560-644067.log | awk '{print $9}'| grep -v "-" > temp.md
	unique  >> answers.md
	rm temp.md
        cat answers.md | mail -s "Log Info" root@localhost
	rm answers.md
else
  echo "The script is still running PID=$$"
fi
