#!/bin/bash
echo "Для запуска скрипта обновления базы данных необходимо ввести следующие данные:"
echo "укажите Вашу базу данных. Варианты: ORACLE, POSGRESQL, MSSQL"
read db
echo "введите IP адрес сервера баз данных"
read ipaddress
echo "введите порт сервера баз данных"
read port
echo "введите имя базы данных"
read dbname
echo "введите имя пользователя базы данных"
read dbuser
echo "введите пароль для пользователя базы данных"
read dbpassword

echo "Убедитесь, что все ввели верно:"
echo $db
echo $ipaddress:$port
echo $dbname
echo $dbuser
echo $dbpassword

echo "Если хотите продолжить нажмите 1 и ENTER, если хотите выйти нажмите 2 и ENTER"
read doing
case $doing in
1)
echo "Скрипт обновления базы данных может быть запущен в 2 режимах"
;;
2)
echo "Вы нажали 2 и завершили скрипт без каких либо действий"
exit 0
;;
*)
echo "Вы ошиблись, попробуйте еще раз"
esac
