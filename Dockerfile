# 1. Берем легкий Linux-образ
FROM alpine:latest

# 2. Устанавливаем bash (в Alpine его нет по умолчанию)
RUN apk add --no-cache bash coreutils

# 3. Создаем рабочую папку внутри контейнера
WORKDIR /app

# 4. Копируем твой скрипт из виртуалки в контейнер
# ВАЖНО: убедись, что файл называется ii_war (или поменяй имя здесь)
COPY ii_war /app/ii_war

# 5. Даем ему права на запуск
RUN chmod +x /app/ii_war

# 6. Говорим контейнеру, что запускать при старте
CMD ["/app/ii_war"]
