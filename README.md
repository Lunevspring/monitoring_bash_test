Алгоритм действий для установки и работы скрипта и таймера:
1) Добавляем репозиторий git clone https://github.com/Lunevspring/monitoring_bash_test.git 
2) Делаем наш скрипт исполняемым chmod +x /path/to/monitoring_test.sh
3) Выполняем следующие команды для запуска таймера
sudo systemctl daemon-reload - перезагрузка демона
sudo systemctl enable monitor_test.timer - переключение в таймер в статус активации
sudo systemctl start monitor_test.timer - запуск таймера
