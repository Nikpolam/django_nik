#!/usr/bin/env bash
# Exit on error
set -o errexit

# Установка Python зависимостей
pip install -r requrements.txt

# Миграции
python manage.py migrate

# Создание суперпользователя
python create_superuser.py

# Сборка бэкенда + статика
python manage.py collectstatic
