#!/bin/bash

# 1. Создаем папку для бэкапов, если ее нет
BACKUP_DIR="$HOME/devops-lab/backups"
mkdir -p "$BACKUP_DIR"

# 2. Берем текущую дату для имени файла
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
FILE_NAME="backup_$DATE.tar.gz"

# 3. Что мы бэкапим (папку с логами)
SOURCE_DIR="/var/log"

# 4. Собираем архив
echo "Начинаю бэкап логов..."
tar -czf "$BACKUP_DIR/$FILE_NAME" "$SOURCE_DIR" 2>/dev/null

# 5. Проверяем, получилось ли
if [ -f "$BACKUP_DIR/$FILE_NAME" ]; then
    echo "✅ Бэкап успешно создан: $FILE_NAME"
else
    echo "❌ Ошибка! Бэкап не создался."
fi
