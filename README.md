# Bash

## Цель домашнего задания:
Научиться писать скрипты на языке bash.

Описание домашнего задания:

Написать скрипт для CRON, который раз в час будет формировать письмо и отправлять на заданную почту.
Необходимая информация в письме:
1) Список IP адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта;
2) Список запрашиваемых URL (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта;
3) Ошибки веб-сервера/приложения c момента последнего запуска;
4) Список всех кодов HTTP ответа с указанием их кол-ва с момента последнего запуска скрипта;
5) Скрипт должен предотвращать одновременный запуск нескольких копий, до его завершения.

### Ход выполнения домашнего задания
Файл "access-4560-644067.log" взят за имитацию лога сервера.
Скрипт следует запускать с правами root т.к. LOCKFILE создается в директории с доступом прав админа.
Для выполнения задания в скрипте использовались следующие инструменты:
- конструкция с LOCKFILE и трапом с целью предотвращения запуска 2-ух копий скрипта;
- функция unique которая автоматизирует повторяющиеся команды;
- создаются 2 временных файла для парсинга информации;
- команды sed, awk, cat, grep, uniq, sort, head, tail для вывода необходимой информации из логов;
- команда mail для отправки полученной информации на электронную почту.

#### sh скрипт содержит комментарии с описанием выполняемых команд!
