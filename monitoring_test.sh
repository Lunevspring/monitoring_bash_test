#!/bin/bash

# Путь к лог-файлу
LOG_FILE="/var/log/monitoring.log"

# URL для мониторинга
MONITOR_URL="https://test.com/monitoring/test/api"

# Проверка запущен ли процесс test
if pgrep -x "test" > /dev/null; then
    # Если процесс запущен, отправляем запрос
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$MONITOR_URL")

    # Проверяем код ответа
    if [ "$RESPONSE" -ne 200 ]; then
        echo "$(date) - Ошибка при обращении к $MONITOR_URL. Код ответа: $RESPONSE" >> "$LOG_FILE"
    fi
else
    # Если процесс не запущен, ничего не делать
    exit 0
fi

# Проверка на перезапуск процесса
if [ -f "/tmp/test_pid" ]; then
    PREV_PID=$(cat /tmp/test_pid)
    if ! ps -p $PREV_PID > /dev/null; then
        echo "$(date) - Процесс 'test' был перезапущен." >> "$LOG_FILE"
    fi
fi

# Сохраняем текущий PID процесса
pgrep -x "test" > /tmp/test_pid
