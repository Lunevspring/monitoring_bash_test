Алгоритм действий для установки и работы скрипта и таймера:
1) Добавляем репозиторий git clone https://github.com/Lunevspring/monitoring_bash_test.git 
2) Делаем наш скрипт исполняемым chmod +x /path/to/monitoring_test.sh
3) Выполняем следующие команды для запуска таймера
 - sudo systemctl daemon-reload - перезагрузка демона
 - sudo systemctl enable monitoring_test.timer - переключение таймера в статус активации
 - sudo systemctl start monitoring_test.timer - запуск таймера
