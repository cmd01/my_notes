#!/bin/bash
echo "Проверка запущенной службы monit..."
a=`ps ax | grep [m]monit | wc -l`
if [ $a -gt 0 ]; then
 echo "У Вас запущена служба monit"
 echo "нажмите 1 и ENTER, чтобы выключить ее" 
 echo "нажмите 2 и ENTER, чтобы продолжить, не выключая monit..."
 read doing
 case $doing in
 1)
 /etc/init.d/monit stop
 sleep 5
 b=`ps ax | grep [m]onit | wc -l`
 if [ "$b" -gt 0 ]; then
  echo "службу monit выключить не удалось, выключите ее и запустите скрипт снова"
 else
  echo "monit выключен"
 fi
 ;;
 2)
 echo "продолжаем работу, не выключая monit.."
 ;;
 *)
 echo "введено, что-то не то, выход из скрипта"
 esac
else
 echo "служба monit не обнаружена.."
fi
exit 0


